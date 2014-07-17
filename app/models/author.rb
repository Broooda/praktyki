#coding UTF-8

class Author < ActiveRecord::Base
	
	#has_many :posts
	#has_many :comments
	
	validates :name, presence: true
	validates :name, format: /[A-Z][a-z]*/
	validates :surname, presence: true
	validates :surname, format: /[A-Z][a-z]*/
	validates :sex, inclusion: {in: %w(male female)}
	end