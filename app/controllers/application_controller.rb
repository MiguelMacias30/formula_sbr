class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
		stored_location_for(resource) ||
		if resource.is_a?(Admin)
			admin_dashboard_path
		#else
      #if resource.provider.nil? && !resource.number.nil? || !resource.license_plate.nil?
				#views_path
			else
				views_path
		end
	end


def info_mail(mail:, subject:, message:)
  	mg_client = Mailgun::Client.new('ebb4dd3e3946b6b70eb8292175da147f-2af183ba-a4cb376a')

  	ms_params = {
  		from: 'miguel@sandbox8fb6706e759c4b11ad764b6875b90fbb.mailgun.org',
  		to: mail,
  		subject: subject,
  		text: message
  	}

  	mg_client.send_message('sandbox8fb6706e759c4b11ad764b6875b90fbb.mailgun.org', ms_params)
  end
end
