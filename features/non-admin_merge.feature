Feature: Non-admin cannot merge articles
	As a non-admin
	In order to not merge artciles
	I want to be prevented from merging articles

Background: articles have been added to database

	Given the blog is set up
	And I have following articles in the database: Article1

Scenario: Publisiher should not see merge option
	Given I created an account for publisher
	And I am logged in as publisher
	When I am on the edit page for "Article1"
	Then I should not see "Merge" button

Scenario: Contributor should not see merge option
	Given I created an account for contributor
	And I am logged in as contributor
	When I am on the edit page for "Article1"
	Then I should not see "Merge" button

