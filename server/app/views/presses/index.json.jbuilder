json.array!(@presses) do |press|
  json.partial! "presses/press.json.jbuilder", press: press
end
