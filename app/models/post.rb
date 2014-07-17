#coding UTF-8

class Post < ActiveRecord::Base
	
	# user_id, content, time, id
	
	belongs_to :user
	has_many :comments
	before_create :set_time

	validates :content,:user_id, presence: true
	
	protected
	def set_time
		self.time=Time.now	
	end
end