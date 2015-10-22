def find_duplicates elements
    encountered = {}

    # Examine all elements in the array
    elements.each do |e|
    	# Throw away nil values
    	if e.nil?
    		# Do Nothing
    	# If the element is in the hash, it is a duplicate
    	elsif encountered[e]
    		puts "Dupe exists for: " << e
    	else
    		# REcord that the element was encountered
    		encountered[e] = 1
    	end
    end
end

# Use the example method.
#   elements = ["bird", "dog", "bird", "cat"]
#   find_duplicates(elements)

def match_projnums_to_attrib (attributions, prjs)
	for eachattr in attributions
        # Print out Attribution and then all project numbers below it
		puts eachattr
		# serch for and print all project numbers with a given attribute
		for pr in prjs
			if pr.building.attribution == eachattr
				puts pr.project_number
			end
		end

	end
	puts prjs[0]
end

# Method to replace any substring within attributions with another
# ignores nulls.
def rplcAttribs(pattern, replacement, prjs, updte)
    for p in prjs
        if p.building.attribution.nil?
            # Do nothing
        elsif p.building.attribution.include? pattern
            print p.project_number + " : " + p.building.attribution
            print " => "
            newAttr = p.building.attribution.gsub(pattern, replacement)
            puts newAttr
            if updte 
                p.building.attribution = newAttr
                p.save
            end
        end
    end
end

# method to count the total number of projects for each 
# attribution and display on screen
def countAtts (attribution, prjs)
    count = 0
    nums = []
    for eachattr in attribution
        for p in prjs
            if p.building.attribution == eachattr
                count = count + 1
                if count < 10
                    nums << p.project_number
                end
            end
        end
        print eachattr
        print " | "
        if count <= 10
            for i in 0..nums.count - 2
               print nums[i]
               print ", "
            end
            puts nums[nums.count-1]
        else 
            print "("
            print count
            puts ")"
        end
        count = 0
        nums = []
    end
end