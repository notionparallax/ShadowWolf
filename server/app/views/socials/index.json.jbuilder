json.array!(@socials) do |social|
  json.partial! "socials/social.json.jbuilder", social: social
end
