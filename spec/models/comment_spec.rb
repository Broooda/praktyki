require 'rails_helper'

RSpec.describe Comment, type: :model do
	it 'should have attributes :user_id, :content, :id, :post_id' do
		expect(subject.attributes).to include('user_id', 'content', 'id', 'post_id')
	end

	it 'should have validate content & user_id & post_id presence' do
		expect(Comment.new).not_to be_valid
		expect(Comment.new(content: "heheh", user_id: "1", post_id: "2")).to be_valid
	end

	it 'should belongs to post' do
		t= Comment.reflect_on_association(:post)
		expect(t.macro).to equal :belongs_to
	end

	it 'should belongs to user' do
		t= Comment.reflect_on_association(:user)
		expect(t.macro).to equal :belongs_to
	end


end