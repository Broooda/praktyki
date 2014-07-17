#coding UTF-8

class CommentsController < ApplicationController
	before_action :make_sure_its_mine, only: [:edit, :destroy]

	def show
		@comment=Comment.find(params[:id])
	end

	def destroy
		@comment=Comment.find(params[:id])
		post_id=@comment.post_id
		if @comment.destroy
			redirect_to post_path(post_id), notice:"Komentarz zniszczony"
		else
			redirect_to posts_path, notice: "Blad usuniecia"
		end
	end

	def new
		@comment=Comment.new
	end

	def create
		@comment=Comment.new(comment_params)
		 if @comment.save
			redirect_to posts_path, notice: "Komentarz dodany"
		else
			render 'new'
		end 
	end
#NIE MA EDYCJI
	def edit
		@comment=Comment.find(params[:id])
	end

	def update
		 @comment=Comment.find(params[:id])
		if @comment.update(comment_params)
			redirect_to post_path(params[:id]), notice: "Komentarz zedytowany"
		else
			render 'edit'
		end 
	end

	private
	def comment_params
		params.require(:comment).permit(:content, :user_id, :post_id)
	end
	def make_sure_its_mine
      unless current_user.id==Comment.find(params[:id]).user_id
        redirect_to post_path(Comment.find(params[:id]).post_id), notice: "To nie Twoj komentarz!"
      end
      true
    end
end
