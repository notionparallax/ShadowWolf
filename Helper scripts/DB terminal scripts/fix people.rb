    leftPeople      = []
    leavePeople     = []
    maternityPeople = []
    activePeople    = ["bdoherty"]

    Person.all.each{|p|
        if leftPeople.include?(p.employee.login)
            puts p.employee.login
            puts "left"
            newCondition = Condition.new
            newCondition.name = "Left"
            newCondition.start_date = DateTime.now
            p.conditions << newCondition
            p.save
        end

        if leavePeople.include?(p.employee.login)
            puts p.employee.login
            puts "leave"
            newCondition = Condition.new
            newCondition.name = "Leave"
            newCondition.start_date = DateTime.now
            p.conditions << newCondition
            p.save
        end

        if maternityPeople.include?(p.employee.login)
            puts "maternity"
            puts p.employee.login
            newCondition = Condition.new
            newCondition.name = "Maternity"
            newCondition.start_date = DateTime.now
            p.conditions << newCondition
            p.save
        end

        if activePeople.include?(p.employee.login)
            puts "Active"
            puts p.employee.login
            newCondition = Condition.new
            newCondition.name = "Active"
            newCondition.start_date = DateTime.now
            p.conditions << newCondition
            p.save
        end
    }
