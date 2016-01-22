# find all projects that have address but no lat / lon
def nolatlon(prjs)
	addresscounter = 0
	
	# check each project in array prjs
	for p in prjs
		# retrieve project data
		st_project_number = p.project_number
		st_project_name = p.building.phases[0].project_name
					
		# check each address for the project (some have more than one)
		for loc in p.building.locations
			# Only output address data that has some value but no lat &/or lon
			if loc.geo_json.lat.nil? || loc.geo_json.lon.nil?
				if loc.address.dirty_location.to_s.empty?
					if constructAddress(loc.address).empty?
						# no address, lat/lon or dirty location then just forget it
					else
						# if there's an address but lacking lat/lon output it
						puts "#{st_project_number}\tAddress is: #{constructAddress(loc.address)}\tLat/Lon: #{loc.geo_json.lat.to_s}/#{loc.geo_json.lon.to_s}"
						addresscounter = addresscounter + 1
					end
				else
					# if there's a dirty location then output it with project number
					puts "#{st_project_number}\tlocation: #{loc.address.dirty_location.to_s}\tLat/Lon: #{loc.geo_json.lat.to_s}/#{loc.geo_json.lon.to_s}"
					addresscounter = addresscounter + 1
				end
			end
		end
	end
	
	addresscounter
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
