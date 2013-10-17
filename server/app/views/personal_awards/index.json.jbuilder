json.array!(@personal_awards) do |personal_award|
  json.extract! personal_award, :name, :awarding_body, :description, :url
  json.url personal_award_url(personal_award, format: :json)
end
