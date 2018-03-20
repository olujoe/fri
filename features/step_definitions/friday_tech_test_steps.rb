Given(/^I navigate to the nuffieldhealth website$/) do
	@page = NuffieldHomePage.new
	@page.load
	@page.displayed?
end

When(/^I search for "(.*?)"$/) do |string|
	@page.searchFor(string)
end

Then(/^I should see a result with "(.*?)" produce "(.*?)"$/) do |string, result|
	@page.verifyPageContains(string, result)
end