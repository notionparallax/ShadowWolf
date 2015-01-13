json.array!(@clients) do |client|
  json.partial! "clients/client.json.jbuilder", client: client
end
