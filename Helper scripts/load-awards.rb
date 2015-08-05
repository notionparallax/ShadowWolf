require 'csv'


def sheet &block
  CSV.foreach('Process - awards.csv', headers: true, &block)
end

def process_row row
  project = get_project row['Job Number'], row['Project']
  if project
    award = make_award row['Award'], row['Year'], row['Other']
    project.save if add_award project, award
  end
end

def get_project project_number, project_name
  Project.or( {project_number: project_number},
              {project_number: project_number.upcase},
              {project_number: project_number.downcase} )
    .first rescue nil
end
def make_award award_text, award_year, other_info
  Award.new award: award_text,
    date: Date.new( award_year.to_i ),
    jury: [other_info]
end
def add_award project, award
  project.building.legacy.awards = [] if project.building.legacy.awards.nil?
  project.building.legacy.awards << award
end
