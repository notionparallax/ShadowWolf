json.array!(@addresses) do |address|
  json.partial! "addresses/address.json.jbuilder", address: address
end
