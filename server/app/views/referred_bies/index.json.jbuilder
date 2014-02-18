json.array!(@referred_bies) do |referred_by|
  json.partial! "referred_bies/referred_by.json.jbuilder", referred_by: referred_by
end
