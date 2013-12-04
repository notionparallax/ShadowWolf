json.array!(@biographies) do |biography|
  json.partial! "biographies/biography.json.jbuilder", biography: biography
end
