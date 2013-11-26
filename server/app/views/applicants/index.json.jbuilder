json.array!(@applicants) do |applicant|
  json.partial! "applicants/applicant.json.jbuilder", applicant: applicant
end
