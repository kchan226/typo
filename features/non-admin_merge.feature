Feature: Non-admin cannot merge articles
	As a non-admin
	In order to not merge artciles
	I want to be prevented from merging articles


Background: articles have been added to database
	
	Given I have following article in the databaase: "Article1"

Scenario: Publisiher should not see merge option
	Given I am a publisher
	When I am on edit page for "Article1"
	I should not see "Merge" button

Scenario: Contributor should not see merge option
	Given I am a contributor
	When I am on edit page for "Article1"
	I should not see "Merge" button