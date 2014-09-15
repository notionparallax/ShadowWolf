#copy and paste these at the terminal as needed

#no surprises here, a list of pictures of muppets
muppets = ["http://img4.wikia.nocookie.net/__cb20101015151246/muppet/images/0/05/Beaker.jpg",
           "http://www.doriabiddle.com/images/bunsen.gif",
           "http://www.aceshowbiz.com/images/still/the-muppets-pic07.jpg",
           "http://media.timeout.com/blogimages/wp-content/uploads/2014/03/muppets3.jpg",
           "http://sironaconsulting.com/images/old/6a00d8341c761a53ef011571ab8c64970b-pi.jpg",
           "http://spinoff.comicbookresources.com/wp-content/uploads/2011/11/muppets-walter.jpg",
           "http://i2.cdn.turner.com/cnn/dam/assets/130704041649-sesame-street-muppet-elmo-horizontal-gallery.jpg",
           "http://www.aceshowbiz.com/images/still/the-muppets-pic08.jpg"]

#a list of logins of people who don't have photos
blankPeople = ["",""]

Person.all.each{|p|
    #add photo stubs to each person
    if p.employee.photo == nil or blankPeople.include? p.employee.login
        puts p.employee.login + " got a photo stub"
        phot = Photo.new
        phot.bw = muppets.sample
        p.employee.photo = phot
        p.save
    end

    #add social stubs to each person
    if p.contact.social == nil
        puts p.employee.login + " got social contact"
        socialStub = Social.new
        p.contact.social = socialStub
        p.contact.social.twitter = "psy_oppa"
        p.contact.social.instagram = "tonyabbottmhr"
        p.save
    end
}

# if people have left, set their status to 'left'
leftPeople = ["",""]
Person.all.each{|p|
    if leftPeople.include? p.employee.login
        puts p.employee.login
        puts "left"
        newCondition = Condition.new
        newCondition.name = "Left"
        newCondition.start_date = DateTime.now
        p.conditions << newCondition
        p.save
    end
}

# change someone's login
Person.all.each{|p|
    if p.name.preferred_last == ""
        puts p.employee.login
        p.employee.login = ""
        puts p.employee.login
        p.save
    end
}




# goes through 3 lists and sets people accordingly
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
}


Person.all.each{|p|
    if p.employee.office_culture.dietary == nil
        puts p.employee.login + " added a new dietary"
        d= Dietary.new
        p.employee.office_culture.dietary = d
        p.save
    end
}

# stub dietary preference
Person.all.each{|p|
    unless p.employee.office_culture.dietary.preference
        puts p.employee.login
        dp = Preference.new
        dp.likes = "cakes"
        dp.dislikes = "dirt"
        p.employee.office_culture.dietary.preference = dp
        p.save
    end
}


photosAndPeople = [
    {:login => 'login',     :photo => 'aPhoto.imagefile'},
    {:login => 'login',      :photo => 'aPhoto.imagefile'},
    {:login => 'login', :photo => 'aPhoto.imagefile'},
    {:login => 'login',      :photo => 'aPhoto.imagefile'},
    {:login => 'login', :photo => 'aPhoto.imagefile'},
    {:login => 'login',     :photo => 'aPhoto.imagefile'},
    {:login => 'login',     :photo => 'aPhoto.imagefile'},
    {:login => 'login',      :photo => 'aPhoto.imagefile'},
    {:login => 'login',    :photo => 'aPhoto.imagefile'}]

photosAndPeople.each{|ppp|
    Person.all.each{|p|
       if ppp[:login] == p.employee.login
        puts ppp[:photo]
        p.employee.photo.bw = ppp[:photo]
        p.save
        puts p.employee.photo.bw
        puts ""
       end
    }
}