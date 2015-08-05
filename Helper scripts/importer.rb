def columns_to_project columns
  project_number = columns[1]
  puts project_number
  project = Project.where(project_number: project_number.upcase).first

  # common initialize
  phase = Phase.new
  budget = Budget.new
  client = Client.new
  key_date = KeyDate.new
  esd = EnvironmentalSustainableDesign.new
  initiative = Initiative.new
  location = Location.new
  address = Address.new
  geo_json = GeoJson.new
  quote = Quote.new
  testimonial = Testimonial.new
  if project.nil?
    # initialize
    project = Project.new
    building = Building.new
    project_source = ProjectSource.new
    legacy = Legacy.new
    dims = DimensionGroup.new

    # connect
    project.building = building
    building.project_source = project_source
    building.dims = dims
  else
    building = project.building
    project_source = building.project_source
    legacy = building.legacy
    dims = building.dims

  end
  # common connect
  building.phases << phase
  phase.budget = budget
  building.client = client
  phase.key_dates << key_date
  building.legacy = legacy
  legacy.esd = esd
  esd.initiatives << initiative
  building.locations << location
  location.address = address
  location.geo_json = geo_json
  legacy.quotes << quote
  legacy.testimonials << testimonial


  # set values
  phase.project_name = columns[0]
  project.project_number = columns[1]
  phase.services_scope = columns[2]
  budget.comments = columns[3]
  phase.staff_contact_login = columns[4]
  budget.initial_phase_fee_total = columns[5]
  budget.final_phase_fee_total = columns[6]
  phase.client = columns[7]
  client.main = columns[8]
  client.end_user = columns[9]
  client.main = columns[10] if building.client.main.eql? "" or building.client.main.nil?
  client.end_user = columns[11] if building.client.end_user.eql? "" or building.client.end_user.nil?
  client.direct = columns[12]
  phase.delivery_contract = columns[13]
  if project_source.competition_win.nil? or project_source.competition_win.upcase.eql? "N/A"
    project_source.competition_win = columns[14]
  end
  budget.construction_initial = columns[15]
  budget.construction_final = columns[16]
  unless columns[17].nil? or columns[17].eql? ''
    if phase.delivery_contract.nil?
      phase.delivery_contract = columns[17]
    elsif not phase.delivery_contract.eql? columns[17]
      phase.delivery_contract += columns[17]
    end
  end
  phase.dirty_finish = columns[18]
  phase.dirty_date = columns[19]
  legacy.description_200_500_words = columns[20]
  legacy.description_project_sheet = columns[21]
  unless columns[22].nil? or columns[22].eql? ''
    if columns[21].eql? '' or legacy.description_project_sheet.nil?
      legacy.description_project_sheet = columns[22]
    else
      legacy.description_project_sheet += columns[22]
    end
  end
  initiative.description = columns[23]
  phase.dirty_members = columns[24]
  address.dirty_location = columns[25]
  location.geo_json.lat = columns[26]
  location.geo_json.lon = columns[27]
  legacy.one_line_grab = columns[28]
  phase.project_name = columns[29] if phase.project_name.nil? or phase.project_name.eql? ''
  building.project_sub_catagories = columns[30].split(',') unless columns[30].nil?
  project.value = columns[31]
  quote.quote = columns[32]
  unless columns[32].nil? or columns[32].eql? ''
    if phase.project_name.nil?
      phase.project_name = columns[32]
    elsif not phase.project_name.eql? columns[32]
      phase.project_name += columns[32]
    end
  end
  phase.referee = columns[33]
  unless columns[34].nil? or columns[34].eql? ''
    if phase.services_scope.nil? or phase.services_scope.eql? ''
      phase.services_scope = columns[34]
    elsif not phase.services_scope.eql? columns[34]
      phase.services_scope += columns[34]
    end
  end
  dims.dirty_size = columns[35] if dims.dirty_size.nil?
  phase.studio = columns[36]
  testimonial.testimonial = columns[37]

  return project
end

#  need to do a join on the project number
#  require 'csv'; require './importer.rb' ; projects = []; CSV.foreach('project-data.csv', headers: true) { |row| projects << columns_to_project(row) }
