# Commands to be passed to the scaffold generator
#person_name  first:string      last:string      preferred_first:string  preferred_last:string
#employee
#photo        fun:string        bw:string        colour:string
#condition    name:string       start_date:date  end_date:date
models = <<-RUBY.split("\n")
person
employee                   login:string           position:string
employee_mobile            number:string          is_work:boolean             distribute:boolean
employee_contact           extension:string       studio:string               work_email:string
person_contact             personal_email:string  personal_phone:string
person_name                prefix:string          first:string                middle:string              last:string         suffix:string                 preferred_first:string    preferred_last:string
applicant
application                date:date              covering_letter:string      portfolio:string           assessment:text     future_consideration:boolean  skills_and_keywords:text
security_clearance         issuing_body:string    level:string                expiry:date
finance                    employee_code:string
qualification              name:string            level:string                institution:string         first_year:integer  last_year:integer
registration               organisation:string    registration_number:string  state:string               country:string
membership                 organisation:string    membership_number:string    state:string               country:string
personal_award             name:string            awarding_body:string        description:text           url:string
professional_contribution  activity:string        description:text            url:string
travel
passport                   number:string          expiry:date                 issuing_body:string
frequent_flier_program     name:string            number:string
project_experience         start:date             end:date                    name:string                firm:string         role:string                   stage:string              url:string
biography                  one_line_bio:string    approach:text               expertise:text             experience:text     achievements:text             value_statement:text
social                     twitter:string         instagram:string            github:string              pinterest:string    google_plus:string            linkedin:string           facebook:string        tumblr:string
media
attention                  date:date              url:string                  scan_or_screengrab:string  body_text:text      publication:string            reason:string
office_culture             first_aider:boolean    fire_warden:boolean
event_participation        name:string            date:date                   url:string
dietary                    requirements:text
preferences                likes:text             dislikes:text
RUBY

# Commands to be passed to the relation generator
#person_name       --parent-class=person   --relation-type=embeds_one  --class_synonym=name
#employee          --parent-class=person   --relation-type=embeds_one
#photo             --parent-class=employee --relation-type=embeds_one
#condition         --parent-class=employee --relation-type=embeds_many
#contact           --parent-class=employee --relation-type=embeds_one
#mobile            --parent-class=contact  --relation-type=embeds_one
relations = <<-RUBY.split("\n")
employee_contact           --parent-class=employee          --relation-type=embeds_one   --class_synonym=contact
person_contact             --parent-class=person            --relation-type=embeds_one   --class_synonym=contact
employee_mobile            --parent-class=employee_contact  --relation-type=embeds_one   --class_synonym=mobile
security_clearance         --parent-class=employee          --relation-type=embeds_many
finance                    --parent-class=employee          --relation-type=embeds_one
qualification              --parent-class=employee          --relation-type=embeds_many
registration               --parent-class=employee          --relation-type=embeds_many
membership                 --parent-class=employee          --relation-type=embeds_many
personal_award             --parent-class=employee          --relation-type=embeds_many
professional_contribution  --parent-class=employee          --relation-type=embeds_many
travel                     --parent-class=employee          --relation-type=embeds_one
passport                   --parent-class=travel            --relation-type=embeds_many
frequent_flier_program     --parent-class=travel            --relation-type=embeds_many
project_experience         --parent-class=employee          --relation-type=embeds_many
biography                  --parent-class=employee          --relation-type=embeds_one
social                     --parent-class=person_contact    --relation-type=embeds_one
media                      --parent-class=employee          --relation-type=embeds_one
attention                  --parent-class=media             --relation-type=embeds_many
office_culture             --parent-class=employee          --relation-type=embeds_one
event_participation        --parent-class=office_culture    --relation-type=embeds_many
dietary                    --parent-class=office_culture    --relation-type=embeds_one
preferences                --parent-class=dietary           --relation-type=embeds_one
applicant --parent-class=person --relation-type=embeds_one
application --parent-class=application --relation-type=embeds_many
RUBY
models.each do |model|
  puts %x(rails g scaffold #{model} --timestamps)
end
relations.each do |rel|
  puts %x(rails g relation #{rel})
end
