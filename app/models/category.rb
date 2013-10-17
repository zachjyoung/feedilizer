class Category < ActiveRecord::Base

  has_many :blog_categorizations, inverse_of: :category
  has_many :blogs, through: :blog_categorizations, inverse_of: :categories
  has_many :blog_entries, through: :blogs
  belongs_to :user, inverse_of: :categories

  validates_presence_of :user
  validates_presence_of :name
end
