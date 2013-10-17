json.array!(@finances) do |finance|
  json.extract! finance, :employee_code
  json.url finance_url(finance, format: :json)
end
