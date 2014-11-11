require 'cucumber'
require 'capybara'
require 'capybara/cucumber'
require 'capybara/poltergeist'
require '../server/config/environment' # load the rails app

Capybara.default_driver = :poltergeist
Capybara.javascript_driver = :poltergeist

Given /there are 10 people in the database/ do
  Person.destroy_all
  FactoryGirl.create_list :person, 10
end

When /I visit the people index/ do
  addr = ENV['GRUNT_PORT_9000_TCP_ADDR']
  port = ENV['GRUNT_PORT_9000_TCP_PORT']
  client_server = "http://#{addr}:#{port}"
  visit client_server + '/#/people'
  visit client_server + '/#/people'
end

Then /there should be 10 display boxes/ do
  sleep 3
  count = all('.info-box').count 
  if count != 10 
    raise "Expected 10 display boxes, found: #{count}"
  end
end
