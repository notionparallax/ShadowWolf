json.id contact.id
json.extract! contact, :created_at, :updated_at, :personal_email, :personal_phone
json.social do
  json.partial! "socials/social.json.jbuilder", social: person_contact.social
end if person_contact.social
