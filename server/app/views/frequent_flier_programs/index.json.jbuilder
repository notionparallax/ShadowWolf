json.array!(@frequent_flier_programs) do |frequent_flier_program|
  json.partial! "frequent_flier_programs/frequent_flier_program.json.jbuilder", frequent_flier_program: frequent_flier_program
end
