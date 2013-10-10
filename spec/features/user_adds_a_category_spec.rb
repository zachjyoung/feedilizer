require 'spec_helper'

feature 'Add a Category', %Q{As a user
I want to create a category
So I can view blogs associated with that category
} do

end

# ACCEPTANCE
#User must be signed in
#Category only belongs to the user

 # scenario 'Valid user adds a category' do

 #  prev_count = Category.count

 #  visit '/categories/new'
 #  fill_in 'Name', with: 'Funny'
 #  click_button 'Record'
 #  expect(page).to have_content('Category recorded.')
 #  expect(Category.count).to eql(prev_count + 1)
 #  end

