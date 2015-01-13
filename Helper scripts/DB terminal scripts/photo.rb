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

# kill the muppets
Person.all.each{|p|
    if muppets.include? p.employee.photo.bw
        puts p.employee.login + " is a muppet"
        p.employee.photo.bw = "http://i134.photobucket.com/albums/q94/juliansaul/gurning.jpg"
        p.save
    end
}

#replace a specific photo
Person.all.each{|p|
    if p.employee.login == ""
        p.employee.photo.bw = ""
        p.save
    end
}


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

# if people have left, set their status
leftPeople = ["sblack"]
Person.all.each{|p|
    if leftPeople.include? p.employee.login
        puts p.employee.login + " Left"
        newCondition = Condition.new
        newCondition.name = "Left"
        newCondition.start_date = DateTime.now
        p.conditions << newCondition
        p.save
    end
}

Person.all.each{|p|
    if leftPeople.include? p.employee.login
        puts p.employee.login
        c1 = Condition.new
        c1.name = "Left"
        c1.start_date = DateTime.new(2012,12,4)
        p.conditions << c1

        c2 = Condition.new
        c2.name = "Left"
        c2.start_date = DateTime.new(2006,4,3)
        p.conditions << c2

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

# change a studio
melpeople = ["",""]
Person.all.each{|p|
    if melpeople.include? p.employee.login
        puts p.employee.login + " mel"
        p.employee.contact.studio = "Melbourne"
        p.save
    end
}


destroyPeople = ["CJO"]
Person.all.each{|p|
    if destroyPeople.include? p.employee.login
        puts p.employee.login + " destroy"
        p.destroy
    end
}

eg = [""]
Person.all.each{|p|
    if eg.include? p.employee.login
        puts ""
        puts p.employee.login + " exists"
        puts ""
        p.employee.login = ""
        p.save
    end
}



# goes through 3 lists and sets people accordingly
leftPeople=[]
leavePeople=['']
maternityPeople=[]
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
    unless p.employee.office_culture.dietary.preference
        puts p.employee.login
        dp = Preference.new
        dp.likes = "cakes"
        dp.dislikes = "dirt"
        p.employee.office_culture.dietary.preference = dp
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
    {:login => 'login' , :photo => 'aPhoto.imagefile'},
    {:login => 'login' , :photo => 'aPhoto.imagefile'},
    {:login => 'login' , :photo => 'aPhoto.imagefile'},
    {:login => 'login' , :photo => 'aPhoto.imagefile'},
    {:login => 'login' , :photo => 'aPhoto.imagefile'},
    {:login => 'login' , :photo => 'aPhoto.imagefile'},
    {:login => 'login' , :photo => 'aPhoto.imagefile'},
    {:login => 'login' , :photo => 'aPhoto.imagefile'},
    {:login => 'login' , :photo => 'aPhoto.imagefile'}]

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

Person.all.each{|p|
   if '' == p.employee.login
    p.employee.photo.bw = "http://blogs.bvn.com.au/tropos/files/2014/07/.jpg"
    p.save
    puts p.employee.photo.bw
    puts ""
   end
}

peeps=[
    {:sacName => "" , :studio => "Melbourne", :photo => "", :ext => 8, :login => ""},
    {:sacName => "" , :studio => "Melbourne", :photo => "", :ext => 9, :login => ""},
    {:sacName => "" , :studio => "Melbourne", :photo => "", :ext => 2, :login => ""},
    {:sacName => "" , :studio => "Melbourne", :photo => "", :ext => 0, :login => ""},
    {:sacName => "" , :studio => "Melbourne", :photo => "", :ext => 3, :login => ""},
    {:sacName => "" , :studio => "Melbourne", :photo => "", :ext => 7, :login => ""},
    {:sacName => "" , :studio => "Melbourne", :photo => "", :ext => 4, :login => ""},
    {:sacName => "" , :studio => "Melbourne", :photo => "", :ext => 0, :login => ""},
    {:sacName => "" , :studio => "Melbourne", :photo => "", :ext => 1, :login => ""},
]
peeps.each{|ppp|
    Person.all.each{|p|
       if ppp[:login] == p.employee.login
        puts ppp[:sacName]

        if ppp[:photo] != ""
            p.employee.photo.bw = ppp[:photo]
        end

        if ppp[:studio] != ""
            p.employee.contact.studio    = ppp[:studio]
        end

        if ppp[:ext] != ""
            p.employee.contact.extension = ppp[:ext]
        end

        p.save
        puts ""
       end
    }
}

Person.all.each{|p|
    Person.all.each{|op|
        if p.employee.login.downcase == op.employee.login.downcase
            puts p.employee.login + "  " + op.employee.login
        end
    }
}


Project.all.each{|p|
    unless p.building.project_categories.class == Array
        p.building.project_categories = "" if p.building.project_categories.nil?
        pcs = p.building.project_categories.split(",").map(&:strip)
        p.building.project_categories = pcs
        p.save
    end
}

Project.all.map{|p| p.building.project_categories.class}.uniq

Project.all.map{|p| p.building.project_categories.map { |pc|
    pc.include? ','
    }.any?
}.any?