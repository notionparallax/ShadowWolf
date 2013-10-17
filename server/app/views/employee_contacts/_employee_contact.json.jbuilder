json.extract! contact, :created_at, :updated_at, :extension, :studio, :work_email
json.mobile do
  json.partial! 'employee_mobiles/employee_mobile.json.jbuilder', mobile: employee_contact.mobile
end if employee_contact.mobile
