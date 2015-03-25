Feature: Create categories for articles

As an admin
In order to organize my articles based on category
I want to create categories for articles

Background:
	Given the blog is set up
	And I am logged into the admin panel

Scenario: Following categories link on admin dashboard
	When I follow "Categories"
	Then I should be on the categories page