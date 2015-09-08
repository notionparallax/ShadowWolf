require 'net/http'

def working_url?(url_str)
  url = URI.parse(url_str)
  Net::HTTP.start(url.host, url.port) do |http|
    http.head(url.request_uri).code == '200'
  end
rescue
  false
end
# dom = "http://cv.bvn.com.au/image?login=drisch&photo_type=photoBW"
# elsa= "https://fbcdn-sphotos-c-a.akamaihd.net/hphotos-ak-xfa1/v/t1.0-9/s720x720/1920482_292227947613059_2939719102297845552_n.jpg?oh=45b8c2c3c327c687570fcc3fdb022b5b&oe=556BC2E6&__gda__=1429252232_ae4116b4ec12fdcf366a110e3cb8c971"
# puts working_url? dom
# puts working_url? elsa

def list_people_with_no_photo people
  people.each do |p|
    if p.currentCondition == "active"
    	unless working_url? p.employee.photo.bw
    		puts "to: " + p.employee.contact.work_email
    	end
    end
  end
end
