# given projects and a team member, find all the ones with a particular entity in external team
# and print out project number and matching external team to terminal window
def findexteam(prj, team)
	counter = 0
	for p in prj
		for rel in p.building.building_relationships
			if !rel.entity.nil?
				if rel.entity.upcase.include?(team.upcase)
					# Choose format of output (by commenting / uncommenting lines below or make your own)
					# puts "#{p.project_number} - #{p.building.phases[0].project_name} - #{rel.entity} (#{rel.relationship_name})"
					puts "#{p.project_number}, #{p.building.phases[0].project_name} contains #{rel.entity}"
					counter = counter + 1
				end
			end
		end
	end
	counter
end

# given projects and a client, find all the ones with a particular entity in external team
# and print out project number and matching external team to terminal window
def findclient(prj, team)
	counter = 0
	for p in prj
		if p.building.phases[0].client.to_s.upcase.include?(team.upcase)
			puts "#{p.project_number}, #{p.building.phases[0].project_name} contains #{p.building.phases[0].client}"
			counter = counter + 1
		end
	end
	counter
end
