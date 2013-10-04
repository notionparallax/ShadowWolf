json.extract! contact, :created_at, :updated_at, :extension, :studio
json.mobile do
  json.partial! 'mobiles/mobile.json.jbuilder', mobile: contact.mobile
end if contact.mobile
