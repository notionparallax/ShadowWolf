require 'json'
require 'cucumber'
require 'capybara'
require 'capybara/cucumber'
require 'capybara/poltergeist'
require '../server/config/environment' # load the rails app

Capybara.default_driver = :poltergeist
Capybara.javascript_driver = :poltergeist

Before do
  Person.destroy_all
  Project.destroy_all
end

Given /there are 10 (.*) in the database/ do |model|
  FactoryGirl.create_list model.singularize.to_sym, 10
end

When /I visit the (.*) (.*) index/ do |service,path|
  service_address = ENV["#{service.upcase}_PORT"].gsub(/^tcp/,'http')
  visit service_address + path
  visit service_address + path
end

Then /there should be 10 display boxes/ do
  sleep 1
  count = all('.info-box').count 
  if count != 10 
    raise "Expected 10 display boxes, found: #{count}"
  end
end

Then /there should be 10 json (.*)/ do |model|
  klass = model.singularize.classify.constantize
  object_ids = JSON.parse(find('pre').text).map do |p|
    p['id']['$oid'] 
  end
  objects_in_db = klass.find object_ids
  raise "10 #{model.pluralize} not found" unless objects_in_db.count == 10
end
