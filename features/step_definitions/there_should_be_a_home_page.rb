Given(/^I'm a non\-logged\-in user$/) do
end

When(/^I go to the home route$/) do
  visit('/')
end

Then(/^I see 'hello'$/) do
  page.has_content?('hello')
end
