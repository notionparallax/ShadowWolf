json.extract! travel, :created_at, :updated_at
json.passports do
  json.array!(travel.passports) do |passport|
    json.partial! 'passports/passport.json.jbuilder', passport: passport
  end
end
json.frequent_flier_programs do
  json.array!(travel.frequent_flier_programs) do |frequent_flier_program|
    json.partial! 'frequent_flier_programs/frequent_flier_program.json.jbuilder', frequent_flier_program: frequent_flier_program
  end
end
json.passports do
  json.array!(travel.passports) do |passport|
    json.partial! "app/views/passports/passport.json.jbuilder", passport: passport
  end
end
json.frequent_flier_programs do
  json.array!(travel.frequent_flier_programs) do |frequent_flier_program|
    json.partial! "app/views/frequent_flier_programs/frequent_flier_program.json.jbuilder", frequent_flier_program: frequent_flier_program
  end
end
