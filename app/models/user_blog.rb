class UserBlog < ActiveRecord::Base
 
  belongs_to :user 
  belongs_to :blog

  validates_presence_of :blog
  validates_presence_of :user

end
