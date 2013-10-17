json.array!(@socials) do |social|
  json.extract! social, :twitter, :instagram, :github, :pinterest, :google_plus, :linkedin, :facebook, :tumblr
  json.url social_url(social, format: :json)
end
