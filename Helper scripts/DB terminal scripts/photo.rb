photos = {
    "vhey"        => "http://blogs.bvn.com.au/tropos/files/2014/07/Victoria_Hey.jpg",
    "dsams"       => "http://blogs.bvn.com.au/tropos/files/2014/07/Dimity_Sams.jpg",
    "agholami"    => "http://blogs.bvn.com.au/tropos/files/2014/07/Amir_Gholami.jpg",
    "jgrissmann"  => "http://blogs.bvn.com.au/tropos/files/2014/07/Johannes_Grissmann.jpg",
    "kwithnell"   => "http://blogs.bvn.com.au/tropos/files/2014/07/Katherine_Withnell.jpg",
    "swiskers"    => "http://blogs.bvn.com.au/tropos/files/2014/07/Steven_Wiskers.jpg",
    "sarief"      => "http://blogs.bvn.com.au/tropos/files/2014/07/Saskia_Arief.jpg",
    "mhine"       => "http://blogs.bvn.com.au/tropos/files/2014/07/Marc_Hine.jpg",
    "yzhang"      => "http://blogs.bvn.com.au/tropos/files/2014/07/Yilun_Zhang.jpg",
    "ptyppo"      => "http://blogs.bvn.com.au/tropos/files/2014/07/Patrik_Typpo.jpg",
    "bcantor"     => "http://blogs.bvn.com.au/tropos/files/2014/07/Barry_Cantor.jpg",
    "spellegrini" => "http://blogs.bvn.com.au/tropos/files/2014/07/Sara_Pellegrini.jpg",
    "dmcparland"  => "http://blogs.bvn.com.au/tropos/files/2014/07/Danielle_McParland.jpg",
    "ssweeney"    => "http://blogs.bvn.com.au/tropos/files/2014/07/Sam_Sweeney.jpg",
    "mfranklin"   => "http://blogs.bvn.com.au/tropos/files/2014/07/Monique_Franklin.jpg",
    "krees"       => "http://blogs.bvn.com.au/tropos/files/2014/07/Kirby_Rees2.jpg",
    "mmicuta"     => "http://blogs.bvn.com.au/tropos/files/2014/07/Marc_Micuta.jpg",
    "mbaker"      => "http://blogs.bvn.com.au/tropos/files/2014/07/Michael_Baker.jpg"
}

Person.all.each{|p|
    photos.each do |login, photoURL|
        if p.employee.login==login
            puts "#{login}"
            # puts photoURL

            phot = Photo.new
            phot.bw = photoURL

            puts ""
            p.employee.photo = phot
            p.save
        end
    end
}

#add photo stubs to each person
Person.all.each{|p|
    if p.employee.photo == nil
        puts p.employee.login + " got a photo stub"
        phot = Photo.new
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
    puts p.employee.photo.bw
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
