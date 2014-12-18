json.id legacy.id
json.extract! legacy, :created_at, :updated_at, :dirty_pictures, :dirty_testimonial, :dirty_awards
json.esd do
  json.partial! "environmental_sustainable_designs/environmental_sustainable_design.json.jbuilder", esd: legacy.esd
end if legacy.esd
json.photography do
  json.partial! "photographies/photography.json.jbuilder", photography: legacy.photography
end if legacy.photography
json.awards do
  json.array!(legacy.awards) do |award|
    json.partial! "awards/award.json.jbuilder", award: award
  end
end
json.testimonials do
  json.array!(legacy.testimonials) do |testimonial|
    json.partial! "testimonials/testimonial.json.jbuilder", testimonial: testimonial
  end
end
json.quotes do
  json.array!(legacy.quotes) do |quote|
    json.partial! "quotes/quote.json.jbuilder", quote: quote
  end
end
json.initiatives do
  json.array!(legacy.initiatives) do |initiative|
    json.partial! "initiatives/initiative.json.jbuilder", initiative: initiative
  end
end
json.templates do
  json.array!(legacy.templates) do |template|
    json.partial! "templates/template.json.jbuilder", template: template
  end
end
