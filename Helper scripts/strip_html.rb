# Use this to strip HTML tags from strings in Ruby
# PS - this work is not my own, but comes from Mastering Regular Expressions by Jeffrey E.F.Frield as quoted at http://snippets.aktagon.com/snippets/192-removing-html-tags-from-a-string-in-ruby, accessed 26/8/2015
def  remove_html_tags inputString
    re = /<("[^"]*"|'[^']*'|[^'">])*>/
    outputString = inputString.gsub(re,'')
    outputString
end

# this code was made for issue 805 - https://github.com/notionparallax/ShadowWolf/issues/805
# call example
# variable prj stores the project to modify Key Brief Elements
# prj.building.brief_elements.each {|kbe| kbe.description = remove_html_tags kbe.description} ; nil
# Once you're happy with the above save each one by running the below:
# prj.building.brief_elements.each {|kbe| kbe.save}