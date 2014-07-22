muppets = ["http://img4.wikia.nocookie.net/__cb20101015151246/muppet/images/0/05/Beaker.jpg",
           "http://www.doriabiddle.com/images/bunsen.gif",
           "http://www.aceshowbiz.com/images/still/the-muppets-pic07.jpg",
           "http://media.timeout.com/blogimages/wp-content/uploads/2014/03/muppets3.jpg",
           "http://sironaconsulting.com/images/old/6a00d8341c761a53ef011571ab8c64970b-pi.jpg",
           "http://spinoff.comicbookresources.com/wp-content/uploads/2011/11/muppets-walter.jpg",
           "http://i2.cdn.turner.com/cnn/dam/assets/130704041649-sesame-street-muppet-elmo-horizontal-gallery.jpg",
           "http://www.aceshowbiz.com/images/still/the-muppets-pic08.jpg"]

blankPeople = [""]
#add photo stubs to each person
Person.all.each{|p|
    if p.employee.photo == nil or blankPeople.include? p.employee.login
        puts p.employee.login + " got a photo stub"
        phot = Photo.new
        phot.bw = muppets.sample
        p.employee.photo = phot
        p.save
    end

    if p.contact.social == nil
        puts p.employee.login + " got social contact"
        socialStub = Social.new
        p.contact.social = socialStub
        p.contact.social.twitter = "psy_oppa"
        p.contact.social.instagram = "tonyabbottmhr"
        p.save
    end
}


Person.all.each{|p|
    if [""].include? p.employee.login
        puts p.employee.login
        puts "left"
        newCondition = Condition.new
        newCondition.name = "Left"
        newCondition.start_date = DateTime.now
        p.conditions << newCondition
        p.save
    end
}

#
# Person.all.each{|p|
#     if leftPeople.include?(p.employee.login)
#         puts p.employee.login
#         puts "left"
#         newCondition = Condition.new
#         newCondition.name = "Left"
#         newCondition.start_date = DateTime.now
#         p.conditions << newCondition
#         p.save
#     end

#     if leavePeople.include?(p.employee.login)
#         puts p.employee.login
#         puts "leave"
#         newCondition = Condition.new
#         newCondition.name = "Leave"
#         newCondition.start_date = DateTime.now
#         p.conditions << newCondition
#         p.save
#     end

#     if maternityPeople.include?(p.employee.login)
#         puts "maternity"
#         puts p.employee.login
#         newCondition = Condition.new
#         newCondition.name = "Maternity"
#         newCondition.start_date = DateTime.now
#         p.conditions << newCondition
#         p.save
#     end
# }
