require 'spec_helper'

feature 'Add a blog', %Q{
  As a user
  I want to add a blog to my feed
  So I can digest more blogs on my feed
}do

let!(:user) { FactoryGirl.create(:user) }
let(:blog) { FactoryGirl.build(:blog) }
let!(:category) { FactoryGirl.create(:category, user_id: user.id) }

  scenario 'Authenticated user adds a blog to their feed' do
    initial_blog_count = Blog.count
    initial_user_blog_count = UserBlog.count
    VCR.use_cassette('valid_feed') do
      login_user(user)
      visit root_path
      click_on "Add blog"
      fill_in "URL", with: blog.feed_url
      check(category.name)
      click_button "Submit"
      expect(page).to have_content("#{blog.title} has been added to your feed.")
    end
    expect(Blog.count).to eql(initial_blog_count + 1)
    expect(UserBlog.count).to eql(initial_user_blog_count + 1)
  end

  scenario 'Authenticated user adds a blog to their feed that someone else has already added' do
    blog.save
    initial_blog_count = Blog.count
    initial_user_blog_count = UserBlog.count
    VCR.use_cassette('valid_feed') do
      login_user(user)
      visit root_path
      click_on "Add blog"
      fill_in "URL", with: blog.feed_url
      check(category.name)
      click_button "Submit"
      expect(page).to have_content("#{blog.title} has been added to your feed.")
    end
    expect(Blog.count).to eql(initial_blog_count)
    expect(UserBlog.count).to eql(initial_user_blog_count + 1)
  end

  scenario 'Authenticated user adds a blog to their feed that someone else has already added' do
    blog.save
    initial_blog_count = Blog.count
    initial_user_blog_count = UserBlog.count
    VCR.use_cassette('valid_feed') do
      login_user(user)
      visit root_path
      click_on "Add blog"
      fill_in "URL", with: blog.feed_url
      check(category.name)
      click_button "Submit"
      expect(page).to have_content("#{blog.title} has been added to your feed.")
    end
    expect(Blog.count).to eql(initial_blog_count)
    expect(UserBlog.count).to eql(initial_user_blog_count + 1)
  end

end
