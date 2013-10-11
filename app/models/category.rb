class Category < ActiveRecord::Base
  validates_presence_of :name
  has_many :blog_categorizations, inverse_of: :category
  has_many :blogs, through: :blog_categorizations
end
