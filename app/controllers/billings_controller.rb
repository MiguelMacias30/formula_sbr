class BillingsController < ApplicationController

  def pre_pay
    orders = current_user.orders.where(paid: false)

    total  = 0
    orders.each do |order|
    total += (order.product.price * order.quantity)
    end

    items = orders.map do |order|
			item = {}
			item[:name] = order.product.name
			item[:sku] = order.product.id.to_s
			item[:price] = order.product.price
			item[:currency] = 'BOB'
			item[:quantity] = order.quantity
			item
  end

  payment = PayPal::SDK::REST::Payment.new({
			intent: 'sale',
			payer: {
				payment_method: 'paypal'
			},
			redirect_urls: {
				return_url: 'localhost:3000/billings/execute',
				cancel_url: 'localhost:3000'
      },
      transaction: [
        {
          item_list:{
            items: items
          },
          amount: {
            total: total.to_s,
            currency: 'BOB'
          },
          description: 'compra desde mi taller en rails'
          }

      ]
    })

    if payment.create
			redirect_url = payment.links.find{|link| link.method == 'REDIRECT'}.href
			redirect_to redirect_url
    else
      render json: payment.error
    end
  end

  def execute
    	paypal_payment = PayPal::SDK::REST::Payment.find(params[:paymentId])

      if paypal_payment.execute(payer_id: params[:payer_id])
			     amount = paypal_payment.transactions.first.amount.total


           billing = Billing.create(
     				user_id: current_user.id,
     				code: paypal_payment.id,
     				amount: amount.to_f,
     				payment_method: 'paypal',
     				currency: 'BOB'
     			)

          orders = current_user.orders.where(paid: false)

          orders.update_all(paid: true, billing_id: billing.id)

          redirect_to products_path, notice: 'el pago se ha realizado con exito!! c:'

      else
          redirect_to products_path, notice: 'no se ha podido realizar el pago con paypal'
      end
  end
end
