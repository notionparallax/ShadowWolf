json.array!(@photographies) do |photography|
  json.partial! "photographies/photography.json.jbuilder", photography: photography
end
