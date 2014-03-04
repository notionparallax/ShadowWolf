json.array!(@employee_presses) do |employee_press|
  json.partial! "employee_presses/employee_press.json.jbuilder", employee_press: employee_press
end
