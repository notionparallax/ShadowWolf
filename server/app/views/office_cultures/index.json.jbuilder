json.array!(@office_cultures) do |office_culture|
  json.partial! "office_cultures/office_culture.json.jbuilder", office_culture: office_culture
end
