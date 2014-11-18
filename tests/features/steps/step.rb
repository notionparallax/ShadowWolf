require 'uri'
require 'json'
require 'cucumber'
require 'capybara'
require 'capybara/cucumber'
require 'capybara/poltergeist'

ENV['RAILS_ENV'] = 'test'
require '../server/config/environment' # load the rails app

Capybara.default_driver = :poltergeist
Capybara.javascript_driver = :poltergeist
OmniAuth.config.test_mode = true

def create_from_hash klass, hash
  if klass.eql? Person
    Person.create do |p|
      p.name = PersonName.new
      p.name.preferred_first = hash['first_name']
      p.name.preferred_last = hash['last_name']
      p.employee = Employee.new
      p.employee.login = hash['login']
      p.employee.contact = EmployeeContact.new
      p.employee.contact.studio = hash['studio']
    end
  elsif klass.eql? Project
    Project.create(project_number: hash['project_number']) do |p|
      p.building = Building.new
      phase = Phase.new
      phase.project_name = hash['project_name']
      p.building.phases << phase
    end
  else raise 'create_from_hash: no such class ' + klass.to_s
  end
end

Before do
  Person.destroy_all
  Project.destroy_all
end

Given /I am a logged in user/ do
  grunt_address = ENV['GRUNT_PORT'].gsub(/^tcp/,'http')
  grunt_address += '/#/callback?'
  rails_address = ENV['RAILS_PORT'].gsub(/^tcp/,'http')
  rails_address += '/people/auth/ldap?redirect_uri='
  rails_address += URI.encode grunt_address
  visit rails_address
  sleep 1
end

Given /the following (.*):/ do |model,objects|
  klass = model.singularize.classify.constantize
  objects.hashes.each do |object|
    create_from_hash klass, object
  end
end

Given /there are (\d+) (.*) in the database/ do |n,model|
  FactoryGirl.create_list model.singularize.to_sym, n.to_i
end

Given /there is 1 project in the database with only 1 press attentions/ do
  p = FactoryGirl.create :project
  attention = Attention.new
  press = BuildingPress.new
  press.attentions = [attention]
  p.building.presses = [ press ]
  p.save
end

When /I visit the (.*) (.*) index/ do |service,path|
  service_address =
    ENV["#{service.upcase}_PORT"].gsub(/^tcp/,'http')
  visit service_address + path
  sleep 2
  visit service_address + path
  sleep 2
end

When /I click the '(.*)' (.*) tag/ do |text,element|
  find( element, text: text ).trigger 'click'
end

When /I type '(.*)' into the (.*)/ do |text,element|
  fill_in element, with: text
end

When /I click on the first project's display box/ do
  all( '.demo' ).first.all( 'a' ).last.click
  sleep 5
end
When /I click on the project press tab/ do
  find( '.nav-tabs' ).find( 'a', text: 'Press' ).click
end
When /I click on the add attentions button/ do
  raise 'error'
end

Then /there should be (\d+) display box/ do |n|
  sleep 1
  count = all('.info-box').count 
  if count != n.to_i 
    raise "Expected #{n} display boxes, found: #{count}"
  end
end

Then /the '(.*)' (.*) tag should( not)? be present/ do |text,element,negate|
  if negate
    assert_no_selector element, text: text
  else
    assert_selector element, text: text
  end
end

Then /there should be (\d+) json (.*)/ do |n,model|
  klass = model.singularize.classify.constantize
  object_ids = JSON.parse(find('pre').text).map do |p|
    p['id']['$oid'] 
  end
  objects_in_db = klass.find object_ids
  raise "#{n} #{model.pluralize} not found" unless objects_in_db.count == n.to_i
end

Then /the search bar should have focus/ do
  if evaluate_script('document.activeElement.id') != 'searchBar'
    raise 'Search bar should be focused'
  end
end

When /I click the add attentions button/ do
  all( '[ng-repeat="attention in press.attentions"]' )
    .last
    .find( 'a', text: 'Add' )
    .click
end

Then /there should be 2 press attention editable groups/ do
  count = all( '[ng-repeat="attention in press.attentions"]' ).count
  raise 'Expected 2 press attention editable groups, found: ' + count.to_s if count != 2
end

