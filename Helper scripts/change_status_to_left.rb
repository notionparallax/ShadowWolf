 # if people have left, set their status
def left_people
  ["sblack","tchristensen","rwood","dingle","lwilliams"]
end

def change_to_left person
  puts p.employee.login + " Left"
  newCondition = Condition.new
  newCondition.name = "Left"
  newCondition.start_date = DateTime.now
  p.conditions << newCondition
  p.employee.contact.extension = "Left"
  p
end

# Call example:
#    Person.all.each do |p|
#      change_to_left p if left_people.include? p.employee.login
#    end
