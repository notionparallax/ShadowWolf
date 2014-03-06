json.array!(@environmental_sustainable_designs) do |esd|
  json.partial! "environmental_sustainable_designs/environmental_sustainable_design.json.jbuilder", environmental_sustainable_design: environmental_sustainable_design
end
