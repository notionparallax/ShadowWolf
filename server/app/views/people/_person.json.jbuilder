json.name do
  json.extract! person.name, :first, :last, :middle, :preferred_first, :preferred_last
end
if person.employee
  json.employee do
    if person.employee.biography
      json.biography do
        json.extract! person.employee.biography, :one_line_bio, :your_approach, :expertise, :key_experience, :achievements, :value_statement
      end
    end
  end
end
json.id person.id
json.url person_url(person, format: :json)
