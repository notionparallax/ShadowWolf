json.array!(@personal_awards) do |personal_award|
  json.partial! "personal_awards/personal_award.json.jbuilder", personal_award: personal_award
end
