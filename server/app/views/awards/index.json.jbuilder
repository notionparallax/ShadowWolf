json.array!(@awards) do |award|
  json.partial! "awards/award.json.jbuilder", award: award
end
