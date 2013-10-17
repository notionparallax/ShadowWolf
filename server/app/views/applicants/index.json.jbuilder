json.array!(@applicants) do |applicant|
  json.extract! applicant, 
  json.url applicant_url(applicant, format: :json)
end
