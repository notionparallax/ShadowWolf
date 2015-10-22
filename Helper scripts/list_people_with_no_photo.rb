require 'net/http'

def working_url?(url_str)
  url = URI.parse(url_str)
  Net::HTTP.start(url.host, url.port) do |http|
    http.head(url.request_uri).code == '200'
  end
rescue
  false
end
<<<<<<< HEAD

def http_response(url_str)
  url = URI.parse(url_str)
  Net::HTTP.start(url.host, url.port) do |http|
    http.head(url.request_uri).code
  end
rescue
  false
end

=======
>>>>>>> 914dbc389915916229d349682f96f77dffe90125
# dom = "http://cv.bvn.com.au/image?login=drisch&photo_type=photoBW"
# elsa= "https://fbcdn-sphotos-c-a.akamaihd.net/hphotos-ak-xfa1/v/t1.0-9/s720x720/1920482_292227947613059_2939719102297845552_n.jpg?oh=45b8c2c3c327c687570fcc3fdb022b5b&oe=556BC2E6&__gda__=1429252232_ae4116b4ec12fdcf366a110e3cb8c971"
# puts working_url? dom
# puts working_url? elsa

def list_people_with_no_photo people
<<<<<<< HEAD
 counter = 0
  fname = "/scripts/BWPhotos.csv"
  somefile = File.open(fname, "w")
  
  # put headers in csv file
  somefile.puts "Login,current_condition,work_email,bwphotoURL,http_response_code_of_URL"
  
  people.each do |p|
    if p.current_condition.name == "Active"
    	unless working_url? p.employee.photo.bw
		    counter = counter + 1
			txtrow = "#{p.employee.login},#{p.current_condition.name.to_s},#{p.employee.contact.work_email.to_s},#{p.employee.photo.bw}, #{http_response(p.employee.photo.bw)}"
    		somefile.puts txtrow
    	end
    end
  end
  somefile.close
  counter
end

def testCSVfileOut
  fname = "/scripts/BWPhotos.csv"
  somefile = File.open(fname, "w")
  
  # put headers in csv file
  somefile.puts "login,current_condition,work_email,photo_url, url_works"
  somefile.close
end

# def hasPR(ppl)
	# counter = 0
	# flag = false
	# fname = "/scripts/hasPROut.txt"
	# somefile = File.open(fname, "w")
	
	# somefile.puts "Login\tcurrent_condition\twork_email\tactivity\tdescription\turl\tdate"
	
		# # check each person in array ppl
	# for p in ppl
		# # check each professional contribution in array of professional_contributions
		# for pc in p.employee.professional_contributions
			# # only output if professional_contribution is NOT nil
			# if !(pc.activity.nil? && pc.description.nil? && pc.url.nil? && pc.date.nil?)
                # txtrow = "#{p.employee.login}\t#{p.current_condition.name.to_s}\t#{p.employee.contact.work_email.to_s}\t#{pc.activity}\t\"#{pc.description}\"\t#{pc.url}\t#{pc.date}"
				# somefile.puts txtrow
                # flag = true
            # end
        # end
        # # count the number of people with professional_contributions filled in
        # # (don't count the total number of professional_contributions, hence flag)
        # if flag
        	# counter = counter + 1
        	# flag = false
        # end
    # end
    # somefile.close
    # counter
# end
=======
  people.each do |p|
    if p.currentCondition == "active"
    	unless working_url? p.employee.photo.bw
    		puts "to: " + p.employee.contact.work_email
    	end
    end
  end
end
>>>>>>> 914dbc389915916229d349682f96f77dffe90125
