json.array!(@attentions) do |attention|
  json.extract! attention, :date, :url, :scan_or_screengrab, :body_text, :publication, :reason
  json.url attention_url(attention, format: :json)
end
