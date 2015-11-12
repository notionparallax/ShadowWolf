# find users that have non-blank Experience and return array of all these people
def peepsWithExp(ppl, flag)
	peeps = []
	exps = []
	
	# check each person in array ppl
	for p in ppl
		# check each experience in array of project_experiences
		for ex in p.employee.project_experiences
			# check if experience is not nil
			if !(ex.name.nil? && ex.firm.nil? && ex.role.nil? && ex.stage.nil? && ex.start_date.nil? && ex.end_date.nil? && ex.url.nil?)
                # check if experience is not empty
				if !(ex.name.to_s.empty? && ex.firm.to_s.empty? && ex.role.to_s.empty? && ex.stage.to_s.empty? && ex.start_date.to_s.empty? && ex.end_date.to_s.empty? && ex.url.to_s.empty?)
					# Add people to array of people with non-empty experience if flag == 0
					if flag == 0
					peeps << p
					elsif flag == 1
					# Add experiences to array if flag == 1
					exps << ex
					end
				end
			end
        end

    end

	if flag == 0
		return peeps
	elsif flag == 1
		return exps
	end
end