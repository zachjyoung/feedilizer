class BlogCategorization < ActiveRecord::Base
  belongs_to :blog, inverse_of: :blog_categorizations
  belongs_to :category, inverse_of: :blog_categorizations

  validates_presence_of :blog 
  validates_presence_of :category
end
