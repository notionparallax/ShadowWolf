 # if people have left, set their status
def left_people
  ["abarber","jwaller", "stomoare"]
  # ptrendall?
  # jchui, kmallon?
end

def change_to_left p
  puts p.employee.login + " Left"
  newCondition = Condition.new
  newCondition.name = "Left"
  newCondition.start_date = DateTime.now
  p.conditions << newCondition
  p.employee.contact.extension = "Left"
  p.save
end

# Call example:
#    Person.all.each do |p|
#      change_to_left p if left_people.include? p.employee.login
#    end