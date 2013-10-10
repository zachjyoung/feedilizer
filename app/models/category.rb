class Category < ActiveRecord::Base
  has_many :blogs, through: :blog_categorizations, inverse_of: :categories
end
