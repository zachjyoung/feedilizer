class BlogCategorization < ActiveRecord::Base
  belongs_to :blog, inverse_of: :blog_categorizations
  belongs_to :category, inverse_of: :blog_categorizations
end
