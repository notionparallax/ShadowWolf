json.array!(@mobiles) do |mobile|
  json.partial! "mobiles/mobile.json.jbuilder", mobile: mobile
end
