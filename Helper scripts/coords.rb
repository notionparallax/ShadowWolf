# this goes through the P&P project database and creates a csv spreadsheet with location data
# this data is fed to Google MyMaps so that all the BVN projects can be displayed on the web
def bvnProjMap(prjs)
	prjcounter = 0
	addresscounter = 0
	
	fname = "/scripts/bvnProjMap.csv"
	somefile = File.open(fname, "w")
	
	somefile.puts "\"Project Name\", Start Year, End Year, Project Number, Address, Latitude, Longitude"
	
	# check each project in array prjs
	for p in prjs
		# Skip confidential projects
		if !p.building.confidential
			# retrieve project data
			st_project_number = p.project_number
			st_project_name = p.building.phases[0].project_name
			# retrieve start year and end year if available
			if p.building.legacy.start_date.to_s.empty?
				st_start_year = ""
			else
				st_start_year = p.building.legacy.start_date.to_datetime.year
			end
			if p.building.legacy.completion_date.to_s.empty?
				st_completion_year = ""
			else
				st_completion_year = p.building.legacy.completion_date.to_datetime.year
			end
						
			# check each address for the project (some have more than one)
			for loc in p.building.locations
				# Only output address data that has a latitude and longtitude
				unless loc.geo_json.lat.nil? && loc.geo_json.lon.nil?
					txtrow = "\"#{st_project_name}\",#{st_start_year},#{st_completion_year},#{st_project_number},\"#{constructAddress(loc.address)}\",#{loc.geo_json.lat.to_s},#{loc.geo_json.lon.to_s}"
				addresscounter = addresscounter + 1
				somefile.puts txtrow
				end
			end
		end
		prjcounter = prjcounter + 1
	end
	somefile.close
	[prjcounter, addresscounter]
end

# This takes a project address and makes a string address out of it
def constructAddress(address)
	st_address = ""
	flag = false
	unless address.building_name.to_s.strip.empty?
		st_address = "#{address.building_name}"
		flag = true
	end
	if address.street_number.to_s.strip.empty?
		if !address.street.to_s.strip.empty?
			if flag 
				st_address = st_address << ", #{address.street.to_s}"
			else
				st_address = "#{address.street.to_s}"
			end
			flag = true
		end
	elsif !address.street.to_s.empty?
		if flag 
			st_address = st_address << ", #{address.street_number.to_s}" << " #{address.street.to_s}"
		else
			st_address = st_address << "#{address.street_number.to_s}" << " #{address.street.to_s}"
		end
		flag = true
	end
	unless ("#{address.suburb_area.to_s} #{address.state_county.to_s} #{address.postcode.to_s}").strip.empty?
		if flag 
			st_address = "#{st_address}, #{address.suburb_area.to_s} #{address.state_county.to_s} #{address.postcode.to_s}".strip
			flag = true
		else
			st_address = "#{st_address}#{address.suburb_area.to_s} #{address.state_county.to_s} #{address.postcode.to_s}".strip
			flag = true
		end
	end
	unless address.country.to_s.strip.empty?
		if flag
			st_address = st_address << ", " << address.country.to_s
		else
			st_address = st_address << address.country.to_s 
		end
	end
	st_address.strip
end

def coordsToCsv(prjs)
	prjcounter = 0
	addresscounter = 0
	
	fname = "/scripts/coordsOut.csv"
	somefile = File.open(fname, "w")
	
	somefile.puts "project_name|is_confidential?|project_number|Latitude|Longitude"
	
	# check each project in array prjs
	for p in prjs
		# check each address for the project (some have more than one)
		for loc in p.building.locations
			# remove any newlines
			if p.building.phases[0].project_name =~ /\n/
				txtrow = "\"*NEWLINES REMOVED*#{p.building.phases[0].project_name.delete("\n")}\"|#{p.building.confidential}|\"#{p.project_number}\"|#{loc.geo_json.lat}|#{loc.geo_json.lon}"
			else
				txtrow = "\"#{p.building.phases[0].project_name}\"|#{p.building.confidential}|\"#{p.project_number}\"|#{loc.geo_json.lat}|#{loc.geo_json.lon}"
			end
			
			addresscounter = addresscounter + 1
			somefile.puts txtrow
		end
		prjcounter = prjcounter + 1
	end
	somefile.close
	[prjcounter, addresscounter]
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