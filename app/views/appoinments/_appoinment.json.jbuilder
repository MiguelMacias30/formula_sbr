json.extract! appoinment, :id, :day, :service_id, :user_id, :created_at, :updated_at
json.url appoinment_url(appoinment, format: :json)
