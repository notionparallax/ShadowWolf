json.array!(@passports) do |passport|
  json.partial! "passports/passport.json.jbuilder", passport: passport
end
