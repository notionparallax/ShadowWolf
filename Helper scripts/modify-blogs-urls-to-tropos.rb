# pjs is a variable containing an array of all projects
def search_for_blogs prj
    if prj.building.press.attentions

        for press in prj.building.press.attentions do
          if press.url and press.url.include? 'http://blogs.bvn.com.au/tropos/files/'
            #puts press.url
            press.url = press.url.gsub('http://blogs.bvn.com.au/tropos/files/', 'http://tropos.bvn.com.au/wp-content/uploads/')
            #puts press.url + " wooooo! url"
            press.save
            puts prj.project_number
          end

          if press.scan_or_screengrab and press.scan_or_screengrab.include? 'http://blogs.bvn.com.au/tropos/files/'
            #puts press.scan_or_screengrab
            press.scan_or_screengrab = press.scan_or_screengrab.gsub!('http://blogs.bvn.com.au/tropos/files/', 'http://tropos.bvn.com.au/wp-content/uploads/')
            puts press.scan_or_screengrab + " wooooo! scan_or_screengrab"
            press.save
            puts prj.project_number
          end

        end
    end
    return prj
end


def search_for_all_blogs 
  Project.all.each {|p|  
    search_for_blogs p }
end