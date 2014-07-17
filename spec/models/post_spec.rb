require 'rails_helper'

RSpec.describe Post, type: :model do
	it 'should have attributes :user_id, :content, :id, :time' do
		expect(subject.attributes).to include('user_id', 'content', 'id', 'time')
	end

	it 'should have validate content & user_id presence' do
		expect(Post.new).not_to be_valid
		expect(Post.new(content: "heheh", user_id: "1")).to be_valid
	end

	it 'should has many comments' do
		t= Post.reflect_on_association(:comments)
		expect(t.macro).to equal :has_many
	end

	it 'should belongs to user' do
		t= Post.reflect_on_association(:user)
		expect(t.macro).to equal :belongs_to
	end


	#Rozni sie sekundami....
	it 'should have working :set_time callback before_create' do
		p = Post.create(content: 'tt', user_id: 1)
		expect(p.time.strftime("%Y-%m-%d %H:%M")).to include(Time.now.strftime("%Y-%m-%d %H:%M"))
	end


end