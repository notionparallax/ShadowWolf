json.array!(@project_experiences) do |project_experience|
  json.extract! project_experience, :start_date, :end_date, :name, :firm, :role, :stage, :url
  json.url project_experience_url(project_experience, format: :json)
end
