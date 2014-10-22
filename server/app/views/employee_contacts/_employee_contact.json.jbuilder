json.id contact.id
json.extract! contact, :created_at, :updated_at, :extension, :studio, :work_email, :direct_dial
json.mobile do
  json.partial! "employee_mobiles/employee_mobile.json.jbuilder", mobile: contact.mobile
end if contact.mobile
