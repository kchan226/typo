Given /^I have following articles in the database: (.*)$/ do |articles|
	article_list = articles.split(", ")
	article_list.each do |article|
		a = Article.create!(:title => article, :author => article + 'author', :body => 'This is the body of ' + article)
		a.comments.create!(:author => 'comment' + article, :body => 'This is a comment on ' + article)
	end
end

Given /^I am an admin/ do
	step 'I am logged into the admin panel'
end