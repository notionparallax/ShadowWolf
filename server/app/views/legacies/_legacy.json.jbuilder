json.id legacy.id
json.extract! legacy, :created_at, :updated_at, :one_line_grab, :dirty_pictures, :dirty_testimonial, :description_project_sheet, :description_200_500_words, :description_awards_style, :dirty_awards, :innovation_client_style, :innovation_value_add, :interesting_things, :brief_elements, :security_level
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
