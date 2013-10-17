json.array!(@biographies) do |biography|
  json.extract! biography, :one_line_bio, :approach, :expertise, :experience, :achievements, :value_statement
  json.url biography_url(biography, format: :json)
end
