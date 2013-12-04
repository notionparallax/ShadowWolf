json.array!(@attentions) do |attention|
  json.partial! "attentions/attention.json.jbuilder", attention: attention
end
