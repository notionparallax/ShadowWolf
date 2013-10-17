json.array!(@frequent_flier_programs) do |frequent_flier_program|
  json.extract! frequent_flier_program, :name, :number
  json.url frequent_flier_program_url(frequent_flier_program, format: :json)
end
