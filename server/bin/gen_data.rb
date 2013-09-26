# Commands to be passed to the scaffold generator
models = <<-RUBY.split("\n")
person
person_name first:string last:string preferred_first:string preferred_last:string
employee
photos fun:string bw:string colour:string
RUBY

# Commands to be passed to the relation generator
relations = <<-RUBY.split("\n")
person_name   --parent-class=person   --relation-type=embeds_one  --class_synonym=name
employee      --parent-class=person   --relation-type=embeds_one
photos        --parent-class=employee --relation-type=embeds_one
RUBY

models.each do |model|
  puts %x(rails g scaffold #{model} --timestamps)
end
relations.each do |rel|
  puts %x(rails g relation #{rel})
end
