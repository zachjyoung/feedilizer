require 'spec_helper'

feature 'Add a blog', %Q{
  As a user
  I want to add a blog to my feed
  So I can digest more blogs on my feed
}do

  scenario 'Authenticated user adds a blog to their feed' do
    visit root_path
    click_on "Add Blog"
    fill_in "RSS Feed", with: blog.url
    fill_in "Category", with: blog.category
    click_button "Submit"
    expect(page).to have_content("#{blog.title} has been created.")
  end
end
