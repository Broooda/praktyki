class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable  :recoverable, :rememberable,
  devise :database_authenticatable, :registerable,
         :trackable, :validatable

    has_many :posts
	has_many :comments
end
