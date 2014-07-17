#coding UTF-8

class PostsController < ApplicationController
	before_action :make_sure_its_mine, only: [:edit, :destroy]

	def index
		@posts=Post.all
	end
	def show
		@post=Post.find(params[:id])
	end

	def destroy
		@post=Post.find(params[:id])
		if@post.destroy
			redirect_to posts_path, notice:"Post zniszczony"
		else
			redirect_to posts_path, notice: "Blad usuniecia"
		end
	end

	def new
		@post=Post.new
	end

	def create
		@post=Post.new(post_params)
		 if @post.save
			redirect_to posts_path, notice:"Post stworzony"
		else
			render "new"
		end 
	end

	def edit
		@post=Post.find(params[:id])
	end

	def update
		 @post=Post.find(params[:id])
		if @post.update(post_params)
			redirect_to posts_path, notice:"Post zedytowany"
		else
			render :edit
		end 
	end
	
	private
	def post_params
		params.require(:post).permit(:content, :post_id, :user_id)
	end

	 private
    def make_sure_its_mine
      unless current_user.id==Post.find(params[:id]).user.id
        redirect_to posts_path, notice: "To nie Twoj post!"
      end
      true
    end
end

