json.array!(@quotes) do |quote|
  json.partial! "quotes/quote.json.jbuilder", quote: quote
end
