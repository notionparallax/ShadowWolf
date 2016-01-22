# 'Fold' all duplicate values for project_categories
def clean_project_categories(pjs,hashmap)
	counter = 0
	
	for p in pjs
		if p.building.project_categories.nil?
			# Do nothing
		else
			p.building.project_categories.each_with_index do |pc, index|
				if hashmap.include?(pc)
					puts "#{p.project_number}: #{pc} => #{hashmap[pc]}"
					p.building.project_categories[index] = hashmap[p.building.project_categories[index]]
					p.save
					counter += 1
				end
			end
		end
	end
	
	counter
end

# 'Fold' all duplicate values for location > state_county
def cleanstate(pjs, hashmap)
	counter = 0

	# check each project in array
	for p in pjs
		for i in 0..(p.building.locations.count-1)
			statec = p.building.locations[i].address.state_county
			if hashmap.include?(statec)
				puts "#{p.project_number}: #{statec} => #{hashmap[statec]}"
				p.building.locations[i].address.state_county = hashmap[statec]
				p.save
				counter = counter + 1
			end
		end
	end
	
	counter
end

# 'Fold' all duplicate values for Summary > original_architect
def clean_original_architect(pjs, hashmap)
	counter = 0
	
	# check each project in array
	for p in pjs
		original_architect_old = p.building.original_architect
		if hashmap.include?(original_architect_old)
				puts "#{p.project_number}: #{original_architect_old} => #{hashmap[original_architect_old]}"
				p.building.original_architect = hashmap[original_architect_old]
				p.save
				counter = counter + 1
		end
	end
	
	counter
end

# 'Fold' all duplicate values for planning authority
def cleanplanauth(pjs,hashmap)
	counter = 0
	
	# check each project in array
	for p in pjs
	plan = p.building.planning_authority
	
		# check database for entries same as hashmap
		if hashmap.include?(plan)
			puts "#{p.project_number}: #{plan} => #{hashmap[plan]}"
			p.building.planning_authority = hashmap[plan]
			p.save
			counter = counter + 1
		end
	end
	counter
end

# 'Fold' all duplicate values for attribution
def cleanattri(pjs,hashmap)
	counter = 0
	
	# check each project in array
	for p in pjs
	attri = p.building.attribution
	
		# check database for entries same as hashmap
		if hashmap.include?(attri)
			puts "#{p.project_number}: #{attri} => #{hashmap[attri]}"
			p.building.attribution = hashmap[attri]
			p.save
			counter = counter + 1
		end
	end
	counter
end
