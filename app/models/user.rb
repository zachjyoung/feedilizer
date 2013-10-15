class User < ActiveRecord::Base

  has_many :user_blogs, inverse_of: :user 
  has_many :blogs, through: :user_blogs, inverse_of: :user
  has_many :feed_entries, through: :blogs, inverse_of: :user
  has_many :categories, inverse_of: :user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         has_many :categories
end
