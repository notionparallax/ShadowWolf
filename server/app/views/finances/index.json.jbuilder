json.array!(@finances) do |finance|
  json.partial! "finances/finance.json.jbuilder", finance: finance
end
