json.id press.id
json.extract! press, :created_at, :updated_at
json.attentions do
  json.array!(press.attentions) do |attention|
    json.partial! "attentions/attention.json.jbuilder", attention: attention
  end
end
