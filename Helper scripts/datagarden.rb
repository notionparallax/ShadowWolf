# this goes through the P&P project database and removes any blank locations
# https://github.com/notionparallax/ShadowWolf/issues/823
def locblanks(prjs)
	prjcounter = 0
	addresscounter = 0
	flag = false
	
	fname = "/scripts/locblanks.csv"
	somefile = File.open(fname, "w")
	
	somefile.puts "project_number|project_name|locs-for-proj|is_confidential?|dirty_location|building_name|street_number|street|suburb_area|state_county|country|postcode|tags|lat|lon|boundary_points"
	
	# check each project in array prjs
	for p in prjs
		# check each address for the project (some have more than one)
		for loc in p.building.locations
			# find those that are blank and output to csv (just to list and double check)
			if (loc.address.dirty_location.to_s.empty? && loc.address.building_name.to_s.empty? && loc.address.street_number.to_s.empty? && loc.address.street.to_s.empty? && 
				loc.address.suburb_area.to_s.empty? && loc.address.state_county.to_s.empty? && loc.address.country.to_s.empty? && loc.address.postcode.to_s.empty? && loc.address.tags.empty? && 
				loc.geo_json.lat.to_s.empty? && loc.geo_json.lon.to_s.empty? && loc.geo_json.boundary_points.to_s.empty?)

				# prepare string to output to csv (remove any newlines from project_name)
				if p.building.phases[0].project_name =~ /\n/
					txtrow = "\"#{p.project_number}\"|\"**NEWLINES REMOVED#{p.building.phases[0].project_name.delete("\n")}\"|\"#{p.building.locations.count}\"|\"#{p.building.confidential}\"|"\
					"\"#{loc.address.dirty_location.to_s}\"|\"#{loc.address.building_name.to_s}\"|\"#{loc.address.street_number.to_s}\"|\"#{loc.address.street.to_s}\"|"\
					"\"#{loc.address.suburb_area.to_s}\"|\"#{loc.address.state_county.to_s}\"|\"#{loc.address.country.to_s}\"|\"#{loc.address.postcode.to_s}\"|\"#{loc.address.tags.to_s}\"|"\
					"\"#{loc.geo_json.lat.to_s}\"|\"#{loc.geo_json.lon.to_s}\"|\"#{loc.geo_json.boundary_points.to_s}\""
				else
					txtrow = "\"#{p.project_number}\"|\"#{p.building.phases[0].project_name}\"|\"#{p.building.locations.count}\"|\"#{p.building.confidential}\"|"\
					"\"#{loc.address.dirty_location.to_s}\"|\"#{loc.address.building_name.to_s}\"|\"#{loc.address.street_number.to_s}\"|\"#{loc.address.street.to_s}\"|"\
					"\"#{loc.address.suburb_area.to_s}\"|\"#{loc.address.state_county.to_s}\"|\"#{loc.address.country.to_s}\"|\"#{loc.address.postcode.to_s}\"|\"#{loc.address.tags.to_s}\"|"\
					"\"#{loc.geo_json.lat.to_s}\"|\"#{loc.geo_json.lon.to_s}\"|\"#{loc.geo_json.boundary_points.to_s}\""
				end				
				
				addresscounter = addresscounter + 1
				somefile.puts txtrow
				flag = true
			
			end


		end
		if flag
			prjcounter = prjcounter + 1
			flag = false
		end
	end
	somefile.close
	[prjcounter, addresscounter]
end

# Some project numbers are duplicated - list all project nums and names in a csv 
# with index, so can clean out duplicates
def find_dups(prjs)
	prjcounter = 0
		
	fname = "/scripts/prjnums.csv"
	somefile = File.open(fname, "w")
	
	somefile.puts "index|project_number|project_name"
	
	# check each project in array prjs
	prjs.each_with_index do |p, index|
		txtrow = "#{index.to_s}|#{p.project_number}|#{p.building.phases[0].project_name}"
		somefile.puts txtrow
		prjcounter = prjcounter+1
	end
	
	# txtrow = 
		# check each address for the project (some have more than one)
		# for loc in p.building.locations
			# remove any newlines
			# if p.building.phases[0].project_name =~ /\n/
				# txtrow = "\"*NEWLINES REMOVED*#{p.building.phases[0].project_name.delete("\n")}\"|#{p.building.confidential}|\"#{p.project_number}\"|#{loc.geo_json.lat}|#{loc.geo_json.lon}"
			# else
				# txtrow = "\"#{p.building.phases[0].project_name}\"|#{p.building.confidential}|\"#{p.project_number}\"|#{loc.geo_json.lat}|#{loc.geo_json.lon}"
			# end
			
			# addresscounter = addresscounter + 1
			# somefile.puts txtrow
		# end
		# prjcounter = prjcounter + 1
	# end
	somefile.close
	prjcounter
end

# Append ~num to project number of prjs[index]
def renum(prjs, index, num)
	oldPNum = prjs[index].project_number 
	newPNum = "#{prjs[index].project_number}~#{num}"
	puts "#{oldPNum}\t=>\t#{newPNum}"
	puts "Do you want to save (Y/N)?"
	question = gets
	
	if question.upcase == "Y\n"
		prjs[index].project_number = newPNum
		prjs[index].save
	else
		puts "NOT SAVED"
	end
	
end

# List all projects planning authorities, attributions and original architects
def projdata(pjs)
	counter = 0
	flag = false
	fname = "/scripts/projdataOut.csv"
	somefile = File.open(fname, "w")
	
	somefile.puts "p.project_number,\"p.building.phases[0].project_name\",\"p.building.planning_authority\",\"p.building.attribution\",\"p.building.original_architect\""
	
	# check each project in array ppl
	for p in pjs
		somefile.puts "#{p.project_number},\"#{p.building.phases[0].project_name}\",\"#{p.building.planning_authority}\",\"#{p.building.attribution}\",\"#{p.building.original_architect}\""
		counter = counter + 1
	end

    somefile.close
    counter
end

# List all non-nil BCA 
def bcaClasses(pjs)
	counter = 0
	flag = false
	fname = "/scripts/bcaClassOut.csv"
	somefile = File.open(fname, "w")
	
	somefile.puts "p.project_number,\"p.building.phases[0].project_name\",\"p.building.BCA_classification[]\""
	
	# check each project in array ppl
	for p in pjs
		if p.building.BCA_classification.nil?
			# Do nothing
		else
			for bcac in p.building.BCA_classification
				somefile.puts "#{p.project_number},\"#{p.building.phases[0].project_name}\",\"#{bcac}\""
			end
			counter = counter + 1
		end
	end

    somefile.close
    counter
end

# List all non-nil Project Categories 
def pCat(pjs)
	counter = 0
	fname = "/scripts/pCatOut.csv"
	somefile = File.open(fname, "w")
	somefile.puts "p.project_number,\"p.building.phases[0].project_name\",\"p.building.project_categories[]\""
	
	# check each project in array pjs
	for p in pjs
		if p.building.project_categories.nil?
			# Do nothing
		else
			for pc in p.building.project_categories
				somefile.puts "#{p.project_number},\"#{p.building.phases[0].project_name}\",\"#{pc}\""
			end
			counter = counter + 1
		end
	end

    somefile.close
    counter
end

# List all non-nil info from the size tab (key dimensions and number of things)
def pSize(pjs)
	counter = 0
	counter2 = 0
	fname = "/scripts/pDimsOut.csv"
	fname2 = "/scripts/pNumsOut.csv"
	somefile = File.open(fname, "w")
	somefile2 = File.open(fname2, "w")
	somefile.puts "p.project_number,\"p.building.phases[0].project_name\",\"p.building.dims[].measurement\",\"p.building.dims[].unit\", \"p.building.dims[].title\",\"p.building.dims[].standard_name\", \"p.building.dims[].standard_version\""
	somefile2.puts "p.project_number,\"p.building.phases[0].project_name\",\"p.building.extras[].label\",\"p.building.extras[].quantity\",p.building.extras[].tags"
	
	# check each project in array pjs
	for p in pjs
		for kd in p.building.dims
			if (kd.measurement.to_s.empty? && kd.unit.to_s.empty? && kd.title.to_s.empty? && kd.standard_name.to_s.empty? && kd.standard_version.to_s.empty?)
				# do nothing
			else
				somefile.puts "#{p.project_number},\"#{p.building.phases[0].project_name}\",\"#{kd.measurement.to_s}\",\"#{kd.unit.to_s}\",\"#{kd.title.to_s}\",\"#{kd.standard_name.to_s}\",\"#{kd.standard_version.to_s}\""
				counter = counter + 1
			end
		end
		for extras in p.building.extras
			if (extras.label.to_s.empty? && extras.quantity.to_s.empty? && extras.tags.to_s.empty?)
				# do nothing
			else
				somefile2.puts "#{p.project_number},\"#{p.building.phases[0].project_name}\",\"#{extras.label.to_s}\",\"#{extras.quantity.to_s}\",#{extras.tags.to_s}"
				counter2 = counter2 + 1
			end
		end
	end

    somefile.close
	somefile2.close
    [counter, counter2]
end

# List all external team
def pExtTeam(pjs)
	counter = 0
	fname = "/scripts/pExtTeamOut.csv"
	somefile = File.open(fname, "w")
	somefile.puts "p.project_number,\"p.building.phases[0].project_name\",\"p.building.building_relationships[].entity\",\"p.building.building_relationships[].relationship_name\", \"p.building.building_relationships[].relationship_description\",\"p.building.building_relationships[].start_date\", \"p.building.building_relationships[].end_date\""
	
	# check each project in array pjs
	for p in pjs
		for kd in p.building.building_relationships
			if (kd.entity.to_s.empty? && kd.relationship_name.to_s.empty? && kd.relationship_description.to_s.empty? && kd.start_date.to_s.empty? && kd.end_date.to_s.empty?)
				# do nothing
			else
				somefile.puts "#{p.project_number},\"#{p.building.phases[0].project_name}\",\"#{kd.entity.to_s}\",\"#{kd.relationship_name.to_s}\",\"#{kd.relationship_description.to_s}\",\"#{kd.start_date.to_s}\",\"#{kd.end_date.to_s}\""
				counter = counter + 1
			end
		end		
	end
    somefile.close
    counter
end

# List all phases
def pPhase(pjs)
	counter = 0
	fname = "/scripts/pPhaseOut.csv"
	somefile = File.open(fname, "w")
	somefile.puts "p.project_number,\"p.building.phases[].project_name\",\"p.building.phases[].studio\",\"p.building.phases[].services_scope\", \"p.building.phases[].delivery_contract\",\"p.building.phases[].staff_contact_login\", \"p.building.phases[].staff_custodian_login\""

	# check each project in array pjs
	for p in pjs
		if p.building.phases.nil?
			puts "#{p.project_number} has no phases!!"
		else
			for fase in p.building.phases
				if  (fase.studio.to_s.empty? && fase.services_scope.to_s.empty? && fase.delivery_contract.to_s.empty? && fase.staff_contact_login.to_s.empty? && fase.staff_custodian_login.to_s.empty?)
					# do nothing
				else
				# pass fields through new lines remover
					somefile.puts "\"#{p.project_number.to_s}\",\"#{nlrem(fase.project_name)}\",\"#{nlrem(fase.studio.to_s)}\",\"#{nlrem(fase.services_scope.to_s)}\",\"#{nlrem(fase.delivery_contract.to_s)}\",\"#{nlrem(fase.staff_contact_login.to_s)}\",\"#{nlrem(fase.staff_custodian_login.to_s)}\""
					counter = counter + 1
				end
			end		
		end
	end
    somefile.close
    counter
end

# List all address info
def pAddress(prj)
	counter = 0
	fname = "/scripts/pAddressOut.csv"
	somefile = File.open(fname, "w")
	somefile.puts "p.project_number,\"p.building.phases[].project_name\",building.locations[].address.dirty_location,building.locations[].address.building_name, building.locations[].address.street_number, building.locations[].address.street,building.locations[].address.suburb_area,building.locations[].address.state_county,building.locations[].address.country,building.locations[].address.postcode,building.locations[].address.tags"

	# check each project in array pjs
	for p in prj
		for locs in p.building.locations
			if constructAddress(locs.address).to_s.empty?
				# Do nothing
			else
				somefile.puts "#{p.project_number},\"#{p.building.phases[0].project_name}\",\"#{locs.address.dirty_location}\",\"#{locs.address.building_name}\",\"#{locs.address.street_number}\",\"#{locs.address.street}\",\"#{locs.address.suburb_area}\",\"#{locs.address.state_county}\",\"#{locs.address.country}\",\"#{locs.address.postcode}\",\"#{locs.address.tags.to_s.gsub("\"","\'")}\""
				counter = counter + 1
			end
		end
	end
    somefile.close
    counter
end

# List all Key Dates Data
def pKeyDates(prj)
	counter = 0
	counterkd = 0
	fname = "/scripts/pDirtyDatesOut.csv"
	fname2 = "/scripts/pKeyDatesOut.csv"
	somefile = File.open(fname, "w")
	somefile2 = File.open(fname2, "w")
	somefile.puts "p.project_number,\"p.building.phases[].project_name\",\"p.building.phases[].dirty_date\""
	somefile2.puts "p.project_number,\"p.building.phases[].project_name\",\"p.building.phases[].key_dates.name\",\"p.building.phases[].key_dates.description\",\"p.building.phases[].key_dates.date\""

	# check each project in array pjs
	for p in prj
		for fase in p.building.phases
			if fase.dirty_date.nil?
			else
				somefile.puts "\"#{p.project_number}\",\"#{nlrem(fase.project_name.to_s)}\",\"#{nlrem(fase.dirty_date.gsub("\"","\'"))}\""
				counter = counter + 1
			end
			for kd in fase.key_dates
				somefile2.puts "#{p.project_number},\"#{fase.project_name}\",\"#{kd.name}\",\"#{kd.description}\",\"#{kd.date}\""
				counterkd = counterkd + 1
			end
		end
	end
    somefile.close
	somefile2.close
    [counter, counterkd]
end

# Output all the budget info
def pBudgets(prj)
	counter = 0
	fname = "/scripts/pBudgetsOut.csv"
	somefile = File.open(fname, "w")
	
	somefile.puts "p.project_number,\"p.building.phases[].project_name\",\"p.building.legacy.legacy_budget[].description\",\"p.building.legacy.legacy_budget[].budget\",\" p.building.legacy.legacy_budget[].currency \",\"p.building.legacy.legacy_budget[].date\",p.building.legacy.legacy_budget[].confidential\",\"p.building.legacy.legacy_budget[].comments\",\"p.building.legacy.legacy_budget[].tags\""
	
	for p in prj
		for bgt in p.building.legacy.legacy_budgets
			# Only worry about those that aren't blank
			if !(bgt.description.to_s.strip.empty? && bgt.budget.to_s.strip.empty? && bgt.currency.to_s.strip.empty? && bgt.date.to_s.strip.empty? && bgt.comments.to_s.strip.empty? && bgt.tags.empty?)
				somefile.puts "#{p.project_number},\"#{p.building.phases[0].project_name}\",\"#{bgt.description}\",\"#{bgt.budget}\",\"#{bgt.currency}\",\"#{bgt.date}\",\"#{bgt.confidential}\",\"#{bgt.comments}\",\"#{bgt.tags.to_s.gsub("\"","\'")}\""
				counter = counter + 1
			end
		end
	end
	
	somefile.close
	counter
end

# Output all the award info
def pAwards(prj)
	counter = 0
	fname = "/scripts/pAwardsOut.csv"
	somefile = File.open(fname, "w")

	somefile.puts "p.project_number,\"p.building.phases[].project_name\",\"p.building.legacy.awards[].award\",p.building.legacy.awards[].date,p.building.legacy.awards[].jury,p.building.legacy.awards[].tags"

	for p in prj
		for aw in p.building.legacy.awards
			# Only worry about those that aren't blank
			if !(aw.award.to_s.empty? && aw.date.to_s.empty? && aw.jury.to_s.empty? && aw.tags.empty?)
				somefile.puts "#{p.project_number},\"#{p.building.phases[0].project_name}\",\"#{aw.award.to_s}\",\"#{aw.date.to_s}\",\"#{nlrem(aw.jury.to_s.gsub("\"","\'"))}\",\"#{aw.tags.to_s.gsub("\"","\'")}\""
				counter = counter + 1
			end
		end
	end

	somefile.close
	counter
end

# Output all the press attention info
def pPressAtts(prj)
	counter = 0
	fname = "/scripts/pPressAttsOut.csv"
	somefile = File.open(fname, "w")

	somefile.puts "p.project_number,\"p.building.phases[].project_name\",\"p.building.press.attentions[].url\",\"p.building.press.attentions[].scan_or_screengrab\",\"p.building.press.attentions[].publication\",\"p.building.press.attentions[].reason\""

	for p in prj
		for pa in p.building.press.attentions
			# Only worry about those that aren't blank
			if !(pa.url.to_s.empty? && pa.scan_or_screengrab.to_s.empty? && pa.publication.to_s.empty? && pa.reason.to_s.empty?)
				somefile.puts "#{p.project_number},\"#{p.building.phases[0].project_name}\",\"#{pa.url.to_s}\",\"#{pa.scan_or_screengrab.to_s}\",\"#{pa.publication.to_s}\",\"#{nlrem(pa.reason.to_s.gsub("\"","\'"))}\""
				counter = counter + 1
			end
		end
	end

	somefile.close
	counter
end

# Output all the key brief elements
def pKBEs(prj)
	counter = 0
	fname = "/scripts/pKBEsOut.csv"
	somefile = File.open(fname, "w")

	somefile.puts "p.project_number,\"p.building.phases[].project_name\",p.building.brief_elements[].description,p.building.brief_elements[].tags"

	for p in prj
		for kbe in p.building.brief_elements
			# Only worry about those that aren't blank
			if !(kbe.description.to_s.empty? && kbe.tags.empty?)
				somefile.puts "#{p.project_number},\"#{p.building.phases[0].project_name}\",\"#{kbe.description.to_s}\",\"#{kbe.tags.to_s.gsub("\"","\'")}"
				counter = counter + 1
			end
		end
	end

	somefile.close
	counter
end

# This method takes a string and tests whether new lines are present in the string.
# if the string has new lines the output "**NEWLINES REMOVED" and the string with all new lines deleted
# otherwise output is just original string
def nlrem(someString)
	if someString =~ /\n/
		newString = "**NEWLINES REMOVED#{someString.delete("\n")}"
	else
		newString = someString
	end
	newString
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
