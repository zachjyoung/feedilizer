class Category < ActiveRecord::Base
  validates_presence_of :name
  has_many :blogs, through: :blog_categorizations, inverse_of: :categories
end
