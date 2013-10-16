require 'spec_helper'

feature "user sees user's own feed", %Q{
  As a user
  I want to see a feed of blog entries from blogs I have added
  So that I can keep up with my blogs
  } do 

  # Acceptance criteria
  # * A list of blog entries from blogs the viewer has added is visible on the site
  # * The user can see his/her own feed but not other people's feeds

  let!(:user) { FactoryGirl.create(:user) }
  let!(:user2) { FactoryGirl.create(:user) }
  let!(:blog) { FactoryGirl.create(:blog) }
  let!(:blog2) { FactoryGirl.create(:blog) }
  let!(:blog3) { FactoryGirl.create(:blog) }
  let!(:blog_entry) { FactoryGirl.create(:blog_entry, blog: blog) }
  let!(:blog_entry2) { FactoryGirl.create(:blog_entry, blog: blog2) }
  let!(:blog_entry3) { FactoryGirl.create(:blog_entry, blog: blog3) }
  let!(:user_blog) { FactoryGirl.create(:user_blog, blog: blog, user: user) }
  let!(:user_blog2) { FactoryGirl.create(:user_blog, blog: blog2, user: user2) }
  let!(:user_blog3) { FactoryGirl.create(:user_blog, blog: blog3, user: user) }
  let!(:user_blog4) { FactoryGirl.create(:user_blog, blog: blog3, user: user2) } 

  scenario 'user views her feed' do
    login_user(user)
    visit blog_entries_path
    expect(page).to have_content(blog_entry.name, blog_entry3.name)
    expect(page).to have_no_content(blog_entry2.name)
  end
end
