json.id employee_press.id
json.extract! employee_press, :created_at, :updated_at
json.attentions do
  json.array!(employee_press.attentions) do |attention|
    json.partial! "attentions/attention.json.jbuilder", attention: attention
  end
end
