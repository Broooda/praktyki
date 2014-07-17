require 'rails_helper'


RSpec.describe CommentsController, type: :controller do

	before(:each) do
		@user=User.create(email: "test@mail.pl", password: "razdwatrzycztery")
		sign_in @user
	end

	describe "GET #show" do
		it "should respond successfully with status 200" do
			comment1=Comment.create(content: 'content commenta', user_id: 1, post_id: 1)
			get :show, id: comment1.id
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end

		it "should generate show template" do
			comment1=Comment.create(content: 'content commenta', user_id: 1, post_id: 1)
			get :show, id: comment1.id
			expect(response).to render_template('show')
		end

		it 'should have comment' do
			comment1=Comment.create(content: 'content commenta', user_id: 1, post_id: 1)
			get :show, id: comment1.id
			expect(assigns(:comment)).to match(comment1)
		end
	end

	describe "POST #create" do
		it 'should redirect after create to posts_path' do
			post :create, comment: {content: 'content posta', user_id: 1, post_id: 1}
			expect(response).to redirect_to(posts_path)
		end
	end
	
	describe "DELETE #destroy" do
		it 'should redirect after delete to post_path:post s id' do
			comment1=Comment.create(content: 'content posta', user_id: @user.id, post_id: 1)
			delete :destroy, id: comment1.id
			expect(response).to redirect_to(post_path(comment1.post_id))
		end
	end

end