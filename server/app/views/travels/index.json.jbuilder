json.array!(@travels) do |travel|
  json.partial! "travels/travel.json.jbuilder", travel: travel
end
