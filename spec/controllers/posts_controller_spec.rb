require 'rails_helper'


RSpec.describe PostsController, type: :controller do

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
			post1=Post.create(content: 'content posta', user_id: 1)
			post2=Post.create(content: 'content posta drugiego', user_id: 2)
			get :index
			expect(assigns(:posts)).to match_array([post1,post2])
		end
	end

	describe "GET #show" do
		it "should respond successfully with status 200" do
			post1=Post.create(content: 'content posta', user_id: 1)
			get :show, id: post1.id
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end

		it "should generate show template" do
			post1=Post.create(content: 'content posta', user_id: 1)
			get :show, id: post1.id
			expect(response).to render_template('show')
		end

		it 'should have post with id 1' do
			post1=Post.create(content: 'content posta', user_id: 1)
			get :show, id: post1.id
			expect(assigns(:post)).to match(post1)
		end
	end

	describe "POST #create" do
		it 'should redirect after create to posts_path' do
			post :create, post: {content: 'content posta', user_id: 1}
			expect(response).to redirect_to(posts_path)
		end
	end
	
	describe "DELETE #destroy" do
		it 'should redirect after delete to posts_path' do
			post1=Post.create(content: 'content posta', user_id: @user.id)
			delete :destroy, id: post1.id
			expect(response).to redirect_to(posts_path)
		end
	end


	describe "Patch #update" do
		it 'should redirect to posts_path after update' do
			post=Post.create(content: 'content posta', user_id: @user.id)
			patch :update, id: post.id, post: {content: 'contentasdzz', user_id: @user.id}
			expect(response).to redirect_to(posts_path)
		end
	end



end