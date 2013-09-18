models = <<-RUBY.split("\n")
person
person_name first:string last:string
employee
qualification name:string organisation:string
RUBY
relations = <<-RUBY.split("\n")
person_name   --parent-class=person   --relation-type=embeds_one  --class_synonym=name
employee      --parent-class=person   --relation-type=embeds_one
qualification --parent-class=employee --relation-type=embeds_many
RUBY

models.each do |model|
  puts %x(rails g scaffold #{model} --timestamps)
end
relations.each do |rel|
  puts %x(rails g relation #{rel})
end
