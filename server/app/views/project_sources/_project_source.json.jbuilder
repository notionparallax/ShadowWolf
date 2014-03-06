json.id project_source.id
json.extract! project_source, :created_at, :updated_at, :competition_win, :competition_URL
json.referred_by do
  json.partial! "referred_bies/referred_by.json.jbuilder", referred_by: project_source.referred_by
end if project_source.referred_by
