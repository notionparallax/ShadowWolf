json.array!(@heights) do |height|
  json.partial! "heights/height.json.jbuilder", height: height
end
