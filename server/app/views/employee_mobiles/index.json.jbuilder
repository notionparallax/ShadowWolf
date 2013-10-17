json.array!(@employee_mobiles) do |employee_mobile|
  json.extract! employee_mobile, :number, :is_work, :distribute
  json.url employee_mobile_url(employee_mobile, format: :json)
end
