require 'json'
require 'cucumber'
require 'capybara'
require 'capybara/cucumber'
require 'capybara/poltergeist'
require '../server/config/environment' # load the rails app

Capybara.default_driver = :poltergeist
Capybara.javascript_driver = :poltergeist

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

Given /the following (.*):/ do |model,objects|
  klass = model.singularize.classify.constantize
  objects.hashes.each do |object|
    create_from_hash klass, object
  end
end

Given /there are 10 (.*) in the database/ do |model|
  FactoryGirl.create_list model.singularize.to_sym, 10
end

When /I visit the (.*) (.*) index/ do |service,path|
  service_address = ENV["#{service.upcase}_PORT"].gsub(/^tcp/,'http')
  visit service_address + path
  visit service_address + path
end

When /I type '(.*)' into the (.*)/ do |text,element|
  fill_in element, with: text
end

Then /there should be (\d+) display box/ do |n|
  sleep 1
  count = all('.info-box').count 
  if count != n.to_i 
    raise "Expected #{n} display boxes, found: #{count}"
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
