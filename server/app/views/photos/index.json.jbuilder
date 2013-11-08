json.array!(@photos) do |photo|
  json.partial! "photos/photo.json.jbuilder", photo: photo
end
