json.array!(@project_experiences) do |project_experience|
  json.partial! "project_experiences/project_experience.json.jbuilder", project_experience: project_experience
end
