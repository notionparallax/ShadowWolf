json.id employee.id
json.extract! employee, :created_at, :updated_at, :login, :position
json.photo do
  json.partial! "app/views/photos/photo.json.jbuilder", photo: employee.photo
end if employee.photo
json.conditions do
  json.array!(employee.conditions) do |condition|
    json.partial! "app/views/conditions/condition.json.jbuilder", condition: condition
  end
end
json.office_culture do
  json.partial! "app/views/office_cultures/office_culture.json.jbuilder", office_culture: employee.office_culture
end if employee.office_culture
json.contact do
  json.partial! "app/views/employee_contacts/employee_contact.json.jbuilder", contact: employee.contact
end if employee.contact
json.security_clearances do
  json.array!(employee.security_clearances) do |security_clearance|
    json.partial! "app/views/security_clearances/security_clearance.json.jbuilder", security_clearance: security_clearance
  end
end
json.finance do
  json.partial! "app/views/finances/finance.json.jbuilder", finance: employee.finance
end if employee.finance
json.qualifications do
  json.array!(employee.qualifications) do |qualification|
    json.partial! "app/views/qualifications/qualification.json.jbuilder", qualification: qualification
  end
end
json.registrations do
  json.array!(employee.registrations) do |registration|
    json.partial! "app/views/registrations/registration.json.jbuilder", registration: registration
  end
end
json.memberships do
  json.array!(employee.memberships) do |membership|
    json.partial! "app/views/memberships/membership.json.jbuilder", membership: membership
  end
end
json.personal_awards do
  json.array!(employee.personal_awards) do |personal_award|
    json.partial! "app/views/personal_awards/personal_award.json.jbuilder", personal_award: personal_award
  end
end
json.professional_contributions do
  json.array!(employee.professional_contributions) do |professional_contribution|
    json.partial! "app/views/professional_contributions/professional_contribution.json.jbuilder", professional_contribution: professional_contribution
  end
end
json.project_experiences do
  json.array!(employee.project_experiences) do |project_experience|
    json.partial! "app/views/project_experiences/project_experience.json.jbuilder", project_experience: project_experience
  end
end
json.biography do
  json.partial! "app/views/biographies/biography.json.jbuilder", biography: employee.biography
end if employee.biography
