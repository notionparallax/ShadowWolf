# edit this, and then `load` it from the rails 
# console to make a new person

p = Person.new

pn = PersonName.new person: p
#pn.prefix = ""
pn.first = "Test"
#pn.middle = ""
pn.last = "Person"
#pn.suffix = "" 
#pn.preferred_first = ""
#pn.preferred_last = ""

#pe = PersonEmployee.new person: p # this line causes it to fail at the moment
#pe.photo.bw = "" 
#pe.photo.colour = "" 
#pe.photo.fun = ""

#pe.position = ""
#pe.login = "tperson"

#pec = Contact.new employee: pe
#pec.extension = "777"
#pec.studio = "Brisbane"
#pec.social.instagram = ""
#pec.social.twitter = ""
#pec.social.github = ""

p.save

puts "person creation done"
