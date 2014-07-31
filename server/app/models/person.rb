class Person
  include Mongoid::Document
  include Mongoid::Timestamps
  include ParamReader

  devise :omniauthable, :trackable, omniauth_providers: [:ldap]

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  embeds_one :applicant

  accepts_nested_attributes_for :applicant

  embeds_one :contact, class_name: 'PersonContact'

  accepts_nested_attributes_for :contact

  embeds_many :conditions

  accepts_nested_attributes_for :conditions

  embeds_one :employee

  accepts_nested_attributes_for :employee

  embeds_one :name, class_name: 'PersonName'

  accepts_nested_attributes_for :name

  def current_condition
    self.conditions.sort_by { |c| c.start_date }.last
  end

  def admin?
    false
  end

  def self.update_from_params person_params
    puts person_params
  end

  before_create :default_subobjects

  private
  def default_subobjects
    self.applicant                                     =   Applicant.new                 if  self.applicant.nil?
    self.employee                                      =   Employee.new                  if  self.employee.nil?
    self.employee.photo                                =   Photo.new                     if  self.employee.photo.nil?
    self.employee.contact                              =   EmployeeContact.new           if  self.employee.contact.nil?
    self.employee.contact.mobile                       =   Mobile.new                    if  self.employee.contact.mobile.nil?
    self.employee.office_culture                       =   OfficeCulture.new             if  self.employee.office_culture.nil?
    self.employee.employee_press                       =   EmployeePress.new             if  self.employee.employee_press.nil?
    self.contact                                       =   PersonContact.new             if  self.contact.nil?
    self.contact.social                                =   Social.new                    if  self.contact.social.nil?
    self.name                                          =   PersonName.new                if  self.name.nil?
    self.employee.travel                               =   Travel.new                    if  self.employee.travel.nil?

    self.employee.professional_contributions           <<  ProfessionalContribution.new  if  self.employee.professional_contributions.length           ==  0
    self.employee.personal_awards                      <<  PersonalAward.new             if  self.employee.personal_awards.length                      ==  0
    self.employee.security_clearances                  <<  SecurityClearance.new         if  self.employee.security_clearances.length                  ==  0
    self.employee.memberships                          <<  Membership.new                if  self.employee.memberships.length                          ==  0
    self.employee.registrations                        <<  Registration.new              if  self.employee.registrations.length                        ==  0
    self.employee.qualifications                       <<  Qualification.new             if  self.employee.qualifications.length                       ==  0
    self.employee.project_experiences                  <<  ProjectExperience.new         if  self.employee.project_experiences.length                  ==  0
    self.employee.office_culture.event_participations  <<  EventParticipation.new        if  self.employee.office_culture.event_participations.length  ==  0
    self.employee.employee_press.attentions            <<  Attention.new                 if  self.employee.employee_press.attentions.length            ==  0
    self.employee.travel.passports                     <<  Passport.new                  if  self.employee.travel.passports.length                     == 0
    self.employee.travel.frequent_flier_programs       <<  FrequentFlierProgram.new      if  self.employee.travel.frequent_flier_programs.length       == 0
  end
end
