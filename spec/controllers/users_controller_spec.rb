require 'rails_helper'


RSpec.describe UsersController, type: :controller do

	before(:each) do
		@user=User.create(email: "test@mail.pl", password: "razdwatrzycztery")
		sign_in @user
	end

	describe "GET #index" do
		it "should respond successfully with status 200" do
			get :index
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end

		it "should generate index template" do
			get :index
			expect(response).to render_template('index')
		end

		it 'should have @posts with all posts' do
			user2=User.create(email: "test221@mail.pl", password: "razdwatrzycztery")
			get :index
			expect(assigns(:users)).to match_array([@user,user2])
		end
	end

	describe "GET #show" do
		it "should respond successfully with status 200" do
			get :show, id: @user.id
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end

		it "should generate show template" do
			get :show, id: @user.id
			expect(response).to render_template('show')
		end

		it 'should have post with id 1' do
			get :show, id: @user.id
			expect(assigns(:user)).to match(@user)
		end
	end

end