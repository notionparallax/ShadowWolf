json.array!(@templates) do |template|
  json.partial! "templates/template.json.jbuilder", template: template
end
