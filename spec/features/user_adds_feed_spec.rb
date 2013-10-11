require 'spec_helper'

feature 'User can add a feed to their blogs', %Q{
  As a user 
  I want to create a feed 
  So that I can view my feed
}do 

# #When feed is added it pulls in 10 of the newest entries
# Must have a name 
# Optional description 
# User must be signed in to create a feed 
# Feed can be empty 
# User can add a category 
# Feed must be valid xml or rss. 

let(:user) { FactoryGirl.create(:user) }
let(:blog) { FactoryGirl.build(:blog) }

  scenario "user adds a feed to site" do 
    VCR.use_cassette('valid_feed') do 
      login_user(user)
      click_on "Add blog"
      fill_in "URL", with: blog.url
      click_on "Submit"
      expect(page).to have_content("Kyle's blog has been added to your feed.")
    end  
  end
end


