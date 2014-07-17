require 'rails_helper'

RSpec.describe User, type: :model do

	it 'should has many comments' do
		t= User.reflect_on_association(:comments)
		expect(t.macro).to equal :has_many
	end

	it 'should has many posts' do
		t= User.reflect_on_association(:posts)
		expect(t.macro).to equal :has_many
	end


end