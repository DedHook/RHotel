json.extract! history, :id, :first_name, :last_name, :email, :phone, :start_date, :end_date, :nomer, :created_at, :updated_at
json.url history_url(history, format: :json)
