class Project
  include Mongoid::Document
  include Mongoid::Timestamps
  include ParamReader

  embeds_one :building

  accepts_nested_attributes_for :building

  embeds_one :non_building

  accepts_nested_attributes_for :non_building
  field :project_number, type: String
  field :img, type: String
  field :value, type: String

  before_create :default_subobjects

  private
  def default_subobjects
    self.non_building                        =  NonBuilding.new                    if self.non_building.nil?
    self.building                            =  Building.new                       if self.building.nil?
    self.building.client                     =  Client.new                         if self.building.client.nil?
    self.building.client.referees            << Referee.new                        if self.building.client.referees.length           == 0
    self.building.project_source             =  ProjectSource.new                  if self.building.project_source.nil?
    self.building.project_source.referred_by =  ReferredBy.new                     if self.building.project_source.referred_by.nil?
    self.building.legacy                     =  Legacy.new                         if self.building.legacy.nil?
    self.building.legacy.awards              << Award.new                          if self.building.legacy.awards.length             == 0
    self.building.legacy.esd                 =  EnvironmentalSustainableDesign.new if self.building.legacy.esd.nil?
    self.building.legacy.esd.certifications  << Certification.new                  if self.building.legacy.esd.certifications.length == 0
    self.building.legacy.esd.initiatives     << Initiative.new                     if self.building.legacy.esd.initiatives.length    == 0
    self.building.legacy.quotes              << Quote.new                          if self.building.legacy.quotes.length             == 0
    self.building.legacy.testimonials        << Testimonial.new                    if self.building.legacy.testimonials.length       == 0
    self.building.legacy.photography         =  Photography.new                    if self.building.legacy.photography.nil?
    self.building.relationship_description   =  RelationshipDescription.new        if self.building.relationship_description.nil?
    self.building.dims                       << Dimension.new                      if self.building.dims.length                      == 0
    self.building.qas                        << QualityAssurance.new               if self.building.qas.length                       == 0
    self.building.locations                  << Location.new                       if self.building.locations.length                 == 0
    self.building.locations[0].address       =  Address.new                        if self.building.locations[0].address.nil?
    self.building.locations[0].geo_json      =  GeoJson.new                        if self.building.locations[0].geo_json.nil?
    self.building.phases                     << Phase.new                          if self.building.phases.length                    == 0
    self.building.phases[0].budget           =  Budget.new                         if self.building.phases[0].budget.nil?
    self.building.phases[0].key_dates        << KeyDate.new                        if self.building.phases[0].key_dates.length       == 0
    self.building.presses                    << BuildingPress.new                  if self.building.presses.length                   == 0
    self.building.presses[0].attentions      << Attention.new                      if self.building.presses[0].attentions.length     == 0
    self.building.presses[0].campaigns       << Campaign.new                       if self.building.presses[0].campaigns.length      == 0
    
  end
end
