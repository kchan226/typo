Feature: Admin can merge articles
	As an admin
	In order to merge similar artciles
	I want to be able to merge two articles

Background: articles have been added to database

	Given I have following articles in the database: "Article1", "Article2"
	And I am an admin
	And I am on the edit page for "Article1"

Scenario: Admin should see merge option
	I should see "Merge" button

Scenario: the merged article should contain the text and comments of both articles and the title and author of either article
 	And I fill in "Article ID" with Article2 ID"
 	And I press "Merge"
 	Then I should see the body of "Article1" and "Article2"
 	And I should see the comments of "Article1" and "Article2"
 	And I should see the title of "Article1" or "Article2"
 	And I should see the author of either "Article1" or "Article2"

Sceneario: Admin should not be able to merge an article with non-existing article
 	And I fill in "Article ID" with Article3 ID"
 	And I press "Merge"
 	Then I should be on the edit page for "Article1"
 	And I should see "Article does not exist"






