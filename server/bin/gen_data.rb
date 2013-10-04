# Commands to be passed to the scaffold generator
#person
#person_name first:string last:string preferred_first:string preferred_last:string
#employee
#photo fun:string bw:string colour:string
#condition name:string start_date:date end_date:date
models = <<-RUBY.split("\n")
contact extension:string studio:string
mobile number:string is_bvn:boolean distribute:boolean
RUBY

# Commands to be passed to the relation generator
#person_name   --parent-class=person   --relation-type=embeds_one  --class_synonym=name
#employee      --parent-class=person   --relation-type=embeds_one
#photo         --parent-class=employee --relation-type=embeds_one
#condition     --parent-class=employee --relation-type=embeds_many
relations = <<-RUBY.split("\n")
contact       --parent-class=employee --relation-type=embeds_one
mobile        --parent-class=contact  --relation-type=embeds_one
RUBY

models.each do |model|
  puts %x(rails g scaffold #{model} --timestamps)
end
relations.each do |rel|
  puts %x(rails g relation #{rel})
end
