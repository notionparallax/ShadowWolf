Given(/^a I'm a logged\-in user$/) do
  #i am a logged in person
end

When(/^I go to \/people/) do
  visit('/people')
end

Then(/^I see all the people in the company$/) do
  page.should have_content text
end#
