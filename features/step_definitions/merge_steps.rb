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

Given /^I created an account for (.*)$/ do |user_type|
	if user_type == "publisher"
		user_type_id = 2
		user_email = "publisher@snow.com"
	elsif user_type == "contributor"
		user_type_id = 3
		user_email = "contributor@snow.com"
	else 
		raise "Can't create an account for invalid user type."
	end
	User.create!({:login => user_type,
                :password => 'aaaaaaaa',
                :email => user_email,
                :profile_id => user_type_id,
                :name => user_type,
                :state => 'active'})
end

Given /^I am logged in as (.*)$/ do |user_type|
	visit '/accounts/login'
	fill_in 'user_login', :with => user_type
	fill_in 'user_password', :with => 'aaaaaaaa'
	click_button 'Login'
	if page.respond_to? :should
		page.should have_content('Login successful')
	else
		assert page.has_content?('Login successful')
	end
end


Then /^I should (not )?see "(.*)" button$/ do |should_not, button|
	if should_not.nil?
		page.should have_selector("input[type=submit][value='Merge']")
	else
		page.should have_no_selector("input[type=submit][value='Merge']")
	end
end
