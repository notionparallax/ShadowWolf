json.array!(@testimonials) do |testimonial|
  json.partial! "testimonials/testimonial.json.jbuilder", testimonial: testimonial
end
