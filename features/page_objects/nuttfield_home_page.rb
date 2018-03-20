require 'capybara'
require 'site_prism'

class NuffieldHomePage < SitePrism::Page
	configuration = YAML.load(File.read('features/test_data/config.yml'))
	set_url configuration['home_page']

	element :search_gyms_text_box, "#location-finder__input-00000160-4eeb-de17-a579-dffb7ab70000"	
	element :cookie_banner_close, ".cookie-banner__close"

	def searchFor(searchValue)
		cookie_banner_close.click
		search_gyms_text_box.click
		search_gyms_text_box.set(searchValue)
		search_gyms_text_box.set("\n")
	end

	def verifyPageContains(string, result)
		string=string.downcase
		if (result == "pass") 
			find(:xpath, "//a[@href='/gyms/#{string}']").visible? 
			# puts "found #{string}"
		elsif (result == "fail")
			# puts "didnt find #{string}"
		end
	end
end