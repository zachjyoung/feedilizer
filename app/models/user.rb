class User < ActiveRecord::Base

  has_many :user_blogs, inverse_of: :users
  has_many :blogs, through: :user_blogs, inverse_of: :users
  has_many :blog_entries, through: :blogs, inverse_of: :users
  has_many :categories, inverse_of: :user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
