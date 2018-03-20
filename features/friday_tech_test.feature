@friday_tech_test
Feature: Find the gyms nearest to a users postcode or home town
	As a user, I want to be able to visit the https://www.nuffieldhealth.com/gyms website and search for and find the gyms nearest to my location by entering a postcode or town name.
	
@happy_path
Scenario Outline: Visit nuffield health website and Find the gyms nearest to a users postcode or town
	Given I navigate to the nuffieldhealth website
	When I search for <desired_location>
	Then I should see a result with <first_location_found> produce <result>

Examples: Happy path results
	|desired_location    |first_location_found  |result  |
	|"chafford hundred"  |"Romford"             |"pass"  |
	|"w12"               |"Paddington"          |"pass"  |
	|"archway"           |"Islington"           |"pass"  |


Examples: Unhappy path results
	|desired_location    |first_location_found  |result  |
	|"chafford hundred"  |"Paddington"          |"fail"  |
	|"w12"               |"Islington"           |"fail"  |
	|"archway"           |"Romford"             |"fail"  |