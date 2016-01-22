# This file contains scripts to help with database gardening
def checkQuals(ppl)
	counter = 0
	# go through and display all ppl who have 1 qualification that is blank
	for p in ppl
		#if p.employee.qualifications.count == 1
		# there is probably a much better way to check each attribute is blank
		    for q in p.employee.qualifications
			    if q.name.nil? && q.level.nil? && q.institution.nil? && q.first_year.nil? && q.last_year.nil?
			    	print "Qualifications are blank - "
				    print p.employee.login
				    print " "
				    print p.name.preferred_first 
				    print " "
				    puts p.name.preferred_last
				    counter = counter + 1
			    end
		    end
	    #end
	end
	counter
end

# find users that have non-blank qualifications and output details to file
def hasQuals(ppl)
	counter = 0
	flag = false
	fname = "/scripts/hasQualsOut.txt"
	somefile = File.open(fname, "w")
	# check each person in array ppl
	somefile.puts "Login|current_condition|work_email|qualification name|level|institution|first_year|last_year"
	for p in ppl
		# check each qualification in array of qualifications
		for q in p.employee.qualifications
			# check if qualifications is not nil
			if !(q.name.nil? && q.level.nil? && q.institution.nil? && q.first_year.nil? && q.last_year.nil?)
                txtrow = "#{p.employee.login}|#{p.current_condition.name.to_s}|#{p.employee.contact.work_email.to_s}|#{q.name.to_s}|#{q.level.to_s}|#{q.institution.to_s}|#{q.first_year}|#{q.last_year.to_s}"
                somefile.puts txtrow
                #somefile.print p.employee.login 
                #somefile.print p.current_condition
                #somefile.print "|"
                #somefile.puts q.name.to_s + "|" + q.level.to_s + "|" + q.institution.to_s + "|" + q.first_year.to_s + "|" + q.last_year.to_s
                flag = true
            end
        end
        # count the number of people with qualifications filled in
        # (don't count the number of qualifications, hence flag)
        if flag
        	counter = counter + 1
        	flag = false
        end
    end
    somefile.close
    counter
end

# find users that have non-blank Registrations and output details to file
def hasRegs(ppl)
	counter = 0
	flag = false
	fname = "/scripts/hasRegsOut.csv"
	somefile = File.open(fname, "w")
	
	somefile.puts "\"Login\",\"current_condition\",\"work_email\",\"organisation\",\"registration_number\",\"state\",\"country\",\"expiry\",\"first_granted\""
	
	# check each person in array ppl
	for p in ppl
		# check each registration in array of registrations
		for r in p.employee.registrations
			# check if registration is not nil 
			if !(r.organisation.nil? && r.registration_number.nil? && r.state.nil? && r.country.nil? && r.expiry.nil? && r.first_granted.nil?)
                # check registration is not empty
				if !(r.organisation.to_s.empty? && r.registration_number.to_s.empty? && r.state.to_s.empty? && r.country.to_s.empty? && r.expiry.to_s.empty? && r.first_granted.to_s.empty?)
					txtrow = "\"#{p.employee.login}\",\"#{p.current_condition.name.to_s}\",\"#{p.employee.contact.work_email.to_s}\",\"#{r.organisation.to_s}\",\"#{r.registration_number.to_s}\",\"#{r.state.to_s}\",\"#{r.country.to_s}\",\"#{r.expiry.to_s}\",\"#{r.first_granted.to_s}\""
					somefile.puts txtrow
					flag = true
				end
            end
        end
        # count the number of people with qualifications filled in
        # (don't count the number of qualifications, hence flag)
        if flag
        	counter = counter + 1
        	flag = false
        end
    end
    somefile.close
    counter
end

# clean up data in registrations
def cleanRegs(ppl)
	nstate = 0
	nup = 0
	nc = 0
	nuk = 0
	nuk2 = 0
	flag = false
	fname = "/scripts/cleanRegsOut.csv"
	somefile = File.open(fname, "w")
	
	somefile.puts "\"Login\",\"current_condition\",\"work_email\",\"organisation\",\"registration_number\",\"state\",\"country\",\"expiry\",\"first_granted\""
	
	# check each person in array ppl
	for p in ppl
		# check each registration in array of registrations
		for r in p.employee.registrations
			# check if registration is not nil
			if !(r.organisation.nil? && r.registration_number.nil? && r.state.nil? && r.country.nil? && r.expiry.nil? && r.first_granted.nil?)
				# if registration not nil start cleaning!
				# Convert states to uppercase & 3 letters
				auStates = Hash["NEW SOUTH WALES" => "NSW", "QUEENSLAND" => "QLD", "VICTORIA" => "VIC"]
				if !r.state.nil?
					# convert long states to 3 letters
					if auStates[r.state.strip.upcase]
						txtrow = "\"#{p.employee.login}\",\"#{p.current_condition.name.to_s}\",\"#{p.employee.contact.work_email.to_s}\",\"#{r.organisation.to_s}\",\"#{r.registration_number.to_s}\",\"#{r.state.to_s}\",\"#{r.country.to_s}\",\"#{r.expiry.to_s}\",\"#{r.first_granted.to_s}\""
						somefile.puts txtrow
						puts "login: #{p.employee.login}, State: #{r.state.to_s} => #{auStates[r.state.strip.upcase].to_s}, Country: #{r.country.to_s}"
						r.state = auStates[r.state.strip.upcase]
						r.save
						nstate = nstate + 1
					end
					# check for any Aussie states that are not all uppercase (correct as needed)
					auTLStates = ["NSW","QLD","VIC","ACT","WA","SA","NT","TAS"]
					if auTLStates.include?(r.state.strip.upcase) && (r.state != r.state.upcase)
						puts "login: #{p.employee.login}, State: #{r.state.to_s} => #{r.state.upcase.to_s}, Country: #{r.country.to_s}"
						r.state = r.state.upcase
						r.save
						nup = nup + 1
					end
					# check for any Aussie states that don't have "Australia" for country
					auTLStates = ["NSW","QLD","VIC","ACT","WA","SA","NT","TAS"]
					if auTLStates.include?(r.state.strip.upcase) && r.country.nil?
						puts "login: #{p.employee.login}, State: #{r.state.to_s}, Country: #{r.country.to_s} => Australia"
						r.country = "Australia"
						r.save
						nc = nc + 1
					end
					
					# check for UK or United Kingdom in state with blank country
					# for these put country as 'United Kingdom' and leave state blank
					if r.state.upcase.to_s == 'UK' || r.state.upcase.to_s == 'UNITED KINGDOM'
						puts "login: #{p.employee.login}, State: #{r.state.to_s} => \"\", Country: #{r.country.to_s} => United Kingdom"
						r.country = "United Kingdom"
						r.state = ""
						r.save
						nuk = nuk + 1
					end
				end
				# Convert UK to United Kingdom
				if !r.country.nil? && (r.country.strip.upcase.to_s == "UK")
					puts "login: #{p.employee.login}, Country: #{r.country.to_s} => United Kingdom"
					r.country = "United Kingdom"
					r.save
					nuk2 = nuk2 + 1
				end
			end
		end
        # count the number of people with qualifications filled in
        # (don't count the number of qualifications, hence flag)
        # if flag
        	# counter = counter + 1
        	# flag = false
        # end
    end
	
    somefile.close
	
    [nstate, nup, nc, nuk, nuk2]
end

# find users that have non-blank Experience and output details to file
def hasExp(ppl)
	counter = 0
	flag = false
	fname = "/scripts/hasExpOut.csv"
	somefile = File.open(fname, "w")
	
	# somefile.puts "Login~current_condition~work_email~name~firm~role~stage~start_date~end_date~url"

	somefile.puts "p.employee.login~p.current_condition.name~p.employee.contact.work_email~project_experiences[].name~ project_experiences[].firm~ project_experiences[].role~ project_experiences[].stage~ project_experiences[].start_date~ project_experiences[].end_date~ project_experiences[].url"

	# check each person in array ppl
	for p in ppl
		# check each experience in array of project_experiences
		for ex in p.employee.project_experiences
			# check if experience is not nil
			if !(ex.name.nil? && ex.firm.nil? && ex.role.nil? && ex.stage.nil? && ex.start_date.nil? && ex.end_date.nil? && ex.url.nil?)
                txtrow = "#{p.employee.login}~#{p.current_condition.name.to_s}~#{p.employee.contact.work_email.to_s}~#{ex.name }~#{ ex.firm }~#{ ex.role }~#{ ex.stage }~#{ ex.start_date.to_s }~#{ ex.end_date.to_s }~#{ ex.url}"
				somefile.puts txtrow
                flag = true
            end
        end
        # count the number of people with qualifications filled in
        # (don't count the number of qualifications, hence flag)
        if flag
        	counter = counter + 1
        	flag = false
        end
    end
    somefile.close
    counter
end

# find users that have non-blank Memberships and output details to file
def hasMems(ppl)
	counter = 0
	flag = false
	fname = "/scripts/hasMemsOut.txt"
	somefile = File.open(fname, "w")
	
	somefile.puts "Login|current_condition|work_email|p.employee.memberships[].organisation|p.employee.memberships[].membership_number|p.employee.memberships[].state|p.employee.memberships[].country|p.employee.memberships[].expiry"
	
	# check each person in array ppl
	for p in ppl
		# check each membership in array of memberships
		for m in p.employee.memberships
			# only output if membersip is NOT nil
			if !(m.organisation.nil? && m.membership_number.nil? && m.state.nil? && m.country.nil? && m.expiry.nil?)
                txtrow = "#{p.employee.login}|#{p.current_condition.name.to_s}|#{p.employee.contact.work_email.to_s}|#{m.organisation.to_s}|#{m.membership_number.to_s}|#{m.state.to_s}|#{m.country.to_s}|#{m.expiry.to_s}"
				somefile.puts txtrow
                flag = true
            end
        end
        # count the number of people with qualifications filled in
        # (don't count the number of qualifications, hence flag)
        if flag
        	counter = counter + 1
        	flag = false
        end
    end
    somefile.close
    counter
end

# find users that have non-blank Security Clearances and output details to file
def hasSC(ppl)
	counter = 0
	flag = false
	fname = "/scripts/hasSCOut.txt"
	somefile = File.open(fname, "w")
	
	somefile.puts "Login|current_condition|work_email|issuing_body|level|expiry"
	
	# check each person in array ppl
	for p in ppl
		# check each Security Clearance in array of Security Clearances
		for sc in p.employee.security_clearances
			# only output if security clearance is NOT nil
			if !(sc.issuing_body.nil? && sc.level.nil? && sc.expiry.nil?)
                txtrow = "#{p.employee.login}|#{p.current_condition.name.to_s}|#{p.employee.contact.work_email.to_s}|#{sc.issuing_body.to_s}|#{sc.level.to_s}|#{sc.expiry.to_s}"
				somefile.puts txtrow
                flag = true
            end
        end
        # count the number of people with clearances filled in
        # (don't count the total number of clearances, hence flag)
        if flag
        	counter = counter + 1
        	flag = false
        end
    end
    somefile.close
    counter
end

# find users that have non-blank travel and output details to file
def hasTravel(ppl)
	counter1 = 0
	counter2 = 0
	flag1 = false
	flag2 = false
	fname1 = "/scripts/hasTravel-PassOut.txt"
	fname2 = "/scripts/hasTravel-FFOut.txt"
	somefile1 = File.open(fname1, "w")
	somefile2 = File.open(fname2, "w")
	
	somefile1.puts "Login|current_condition|work_email|number|expiry|issuing_body"
	somefile2.puts "Login|current_condition|work_email|name|number"
	
	# check each person in array ppl
	for p in ppl
		
		# check each passport in array of passports
		for ps in p.employee.travel.passports
			# only output if passport is not NIL
			if !(ps.number.nil? && ps.expiry.nil? && ps.issuing_body.nil?)
                txtrow = "#{p.employee.login}|#{p.current_condition.name.to_s}|#{p.employee.contact.work_email.to_s}|#{ps.number}|#{ps.expiry}|#{ps.issuing_body}"
				somefile1.puts txtrow
                flag1 = true
            end
        end
        # count the number of people with passports filled in
        # (don't count the total number of passports, hence flag1)
        if flag1
        	counter1 = counter1 + 1
        	flag1 = false
        end
		
		# check each Frequent Flyer in array of frequent_flier_programs
		for ff in p.employee.travel.frequent_flier_programs
			# only output if frequent flier is not NIL
			if !(ff.name.nil? && ff.number.nil?)
                txtrow = "#{p.employee.login}|#{p.current_condition.name.to_s}|#{p.employee.contact.work_email.to_s}|#{ff.name}|#{ff.number}"
				somefile2.puts txtrow
                flag2 = true
            end
        end
        # count the number of people with frequent_flier_programs filled in
        # (don't count the total number of frequent_flier_programs, hence flag2)
        if flag2
        	counter2 = counter2 + 1
        	flag2 = false
        end
    end
    somefile1.close
	somefile2.close
    [counter1, counter2]
end

# find users that have non-blank personal awards and output details to file
def hasPA(ppl)
	counter = 0
	flag = false
	fname = "/scripts/hasPAOut.txt"
	somefile = File.open(fname, "w")
	
	somefile.puts "Login\tcurrent_condition\twork_email\tname\tawarding_body\tdescription\turl\tyear_achieved"
	
	# check each person in array ppl
	for p in ppl
		# check each personal award in array of personal awards
		for pa in p.employee.personal_awards
			# only output if personal_award is NOT nil
			if !(pa.name.nil? && pa.awarding_body.nil? && pa.description.nil? && pa.url.nil? && pa.year_achieved.nil?)
                txtrow = "#{p.employee.login}\t#{p.current_condition.name.to_s}\t#{p.employee.contact.work_email.to_s}\t#{pa.name}\t#{pa.awarding_body}\t#{pa.description}\t#{pa.url}\t#{pa.year_achieved}"
				somefile.puts txtrow
                flag = true
            end
        end
        # count the number of people with clearances filled in
        # (don't count the total number of clearances, hence flag)
        if flag
        	counter = counter + 1
        	flag = false
        end
    end
    somefile.close
    counter
end

# find users that have non-blank professional contributions and output details to file
def hasPC(ppl)
	counter = 0
	flag = false
	fname = "/scripts/hasPCOut.txt"
	somefile = File.open(fname, "w")
	
	somefile.puts "Login\tcurrent_condition\twork_email\tactivity\tdescription\turl\tdate"
	
		# check each person in array ppl
	for p in ppl
		# check each professional contribution in array of professional_contributions
		for pc in p.employee.professional_contributions
			# only output if professional_contribution is NOT nil
			if !(pc.activity.nil? && pc.description.nil? && pc.url.nil? && pc.date.nil?)
                txtrow = "#{p.employee.login}\t#{p.current_condition.name.to_s}\t#{p.employee.contact.work_email.to_s}\t#{pc.activity}\t\"#{pc.description}\"\t#{pc.url}\t#{pc.date}"
				somefile.puts txtrow
                flag = true
            end
        end
        # count the number of people with professional_contributions filled in
        # (don't count the total number of professional_contributions, hence flag)
        if flag
        	counter = counter + 1
        	flag = false
        end
    end
    somefile.close
    counter
end

# find users that have non-blank press and output details to file
def hasPR(ppl)
	counter = 0
	flag = false
	fname = "/scripts/hasPROut.csv"
	somefile = File.open(fname, "w")
	
	somefile.puts "\"login\"~\"current_condition\"~\"work_email\"~\"date\"~\"url\"~\"scan_or_screengrab\"~\"body_text\"~\"publication\"~\"reason\""
	
	# check each person in array ppl
	for p in ppl
		# check press attention in employee_press
		for pa in p.employee.employee_press.attentions
			# only output if attentions is NOT nil
			if !(pa.date.nil? && pa.url.nil? && pa.scan_or_screengrab.nil? && pa.body_text.nil? && pa.publication.nil? && pa.reason.nil?)
                txtrow = "\"#{p.employee.login}\"~\"#{p.current_condition.name.to_s}\"~\"#{p.employee.contact.work_email.to_s}\"~"
				txtrow << "\"#{pa.date}\"~\"#{pa.url}\"~\"#{pa.scan_or_screengrab}\"~\"#{pa.body_text =~ /\n/ ? ("**NEWLINES REMOVED" + pa.body_text.delete("\n")) : (pa.body_text)}\"~\"#{pa.publication}\"~\"#{pa.reason}\""
				# somefile.puts txtrow
                somefile.puts txtrow
				flag = true
            end
        end
        # count the number of people with press attentions filled in
        # (don't count the total number of professional_contributions, hence flag)
        if flag
        	counter = counter + 1
        	flag = false
        end
    end
    somefile.close
    counter
end

# find users that have non-blank event participations and output details to file
def hasEV(ppl)
	counter = 0
	flag = false
	fname = "/scripts/hasEVOut.csv"
	somefile = File.open(fname, "w")
	
	somefile.puts "\"login\",\"current_condition\",\"work_email\",\"event_name\",\"event_date\",\"event_url\""
	
	# check each person in array ppl
	for p in ppl
		# check press attention in employee_press
		for ev in p.employee.office_culture.event_participations
			# only output if attentions is NOT nil
			if !(ev.name.nil? && ev.date.nil? && ev.url.nil?)
                txtrow = "\"#{p.employee.login}\",\"#{p.current_condition.name.to_s}\",\"#{p.employee.contact.work_email.to_s}\","
				txtrow << "\"#{ev.name}\",\"#{ev.date}\",\"#{ev.url}\""
				# somefile.puts txtrow
                somefile.puts txtrow
				flag = true
            end
        end
        # count the number of people with press attentions filled in
        # (don't count the total number of professional_contributions, hence flag)
        if flag
        	counter = counter + 1
        	flag = false
        end
    end
    somefile.close
    counter
end

# hinds89, 29/10/2015
def tcaseRoles(ppl)
# check each person in array ppl
	# check each person in array ppl
	for p in ppl
		# check each experience in array of project_experiences
		for ex in p.employee.project_experiences
			# check if experience is not nil
			if !(ex.name.nil? && ex.firm.nil? && ex.role.nil? && ex.stage.nil? && ex.start_date.nil? && ex.end_date.nil? && ex.url.nil?)
				# Check if 'Graduate 
            end
        end
	end
end

# list projects with new lines in the project_name
def gdpnums(prjs)
	counter = 0
	
	for p in prjs
		if p.building.phases[0].project_name =~ /\n/
			print p.project_number + ", "
			# puts counter.to_s + "." + p.building.phases[0].project_name
			newname = p.building.phases[0].project_name.gsub(/[\n]+/, " ")
			newname = newname.gsub(/\s+/, " ")
			puts newname
			p.building.phases[0].project_name = newname
			p.save
			counter = counter + 1
		end
	end
	
counter
end

# List in a csv logins, emails, dietary info for all people in the database
def otherinfo(ppl)
	counter = 0
	flag = false
	fname = "/scripts/otherinfoOut.csv"
	somefile = File.open(fname, "w")

	# Column Headings
	somefile.puts "p.employee.login,p.employee.contact.work_email,p.employee.contact.studio,p.employee.contact.extension,p.employee.office_culture.fire_warden,p.employee.office_culture.first_aider,p.employee.office_culture.dietary[\"preference\"][\"likes\"], p.employee.office_culture.dietary[\"preference\"][\"dislikes\"], p.employee.office_culture.dietary.requirements, p.employee.office_culture.dietary.likes, p.employee.office_culture.dietary.dislikes"
	
	# Output details for each person
	for p in ppl
		# catch those people that don't have the '["preference"]' attribute
		if p.employee.office_culture.dietary["preference"].nil?
				somefile.puts "#{p.employee.login.to_s},#{p.employee.contact.work_email.to_s},#{p.employee.contact.studio.to_s}, #{p.employee.contact.extension.to_s},#{p.employee.office_culture.fire_warden.to_s},#{p.employee.office_culture.first_aider.to_s},,,\'#{p.employee.office_culture.dietary.requirements.to_s.gsub("\"","")}\',\'#{p.employee.office_culture.dietary.likes.to_s.gsub("\"","")}\',\'#{p.employee.office_culture.dietary.dislikes.to_s.gsub("\"","")}\'"
		else
			somefile.puts "#{p.employee.login.to_s},#{p.employee.contact.work_email.to_s},#{p.employee.contact.studio.to_s}, #{p.employee.contact.extension.to_s},#{p.employee.office_culture.fire_warden.to_s},#{p.employee.office_culture.first_aider.to_s},\'#{p.employee.office_culture.dietary["preference"]["likes"].to_s}\',\'#{p.employee.office_culture.dietary["preference"]["dislikes"].to_s}\',\'#{p.employee.office_culture.dietary.requirements.to_s.gsub("\"","")}\',\'#{p.employee.office_culture.dietary.likes.to_s.gsub("\"","")}\',\'#{p.employee.office_culture.dietary.dislikes.to_s.gsub("\"","")}\'"
		end
		counter = counter + 1
	end
	
	# close file and return count of people 
	somefile.close
	counter
end

# List all conditions
def listconds(ppl)
	counter = 0
	flag = false
	fname = "/scripts/conds.csv"
	somefile = File.open(fname, "w")

	# Column Headings
	somefile.puts "p.employee.login,p.conditions[].name, p.conditions[].start_date"
	
	# Output details for each person
	for p in ppl
		for con in p.conditions
			somefile.puts "#{p.employee.login.to_s}, #{con.name}, #{con.start_date}"
		end
		counter = counter + 1
	end
	
	# close file and return count of conditions
	somefile.close
	counter
end
