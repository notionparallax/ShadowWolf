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