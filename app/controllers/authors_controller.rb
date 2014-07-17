#coding UTF-8

class AuthorsController < ApplicationController
	def index
		@authors=Author.all
	end

	def destroy
		@author=Author.find(params[:id])
		@author.destroy
		redirect_to authors_path, notice:"Uzytkownik zniszczony"
	end

	def new
		@author=Author.new
	end

	def create
		@author=Author.new(authors_params)
		 if @author.save
			redirect_to authors_path, notice:"Uzytkownik stworzony"
		else
			render 'new'
		end 
	end

	def edit
		@author=Author.find(params[:id])
	end

	def update
		 @author=Author.find(params[:id])
		if @author.update(authors_params)
			redirect_to authors_path, notice:"Uzytkownik zedytowany"
		else
			render 'edit'
		end 
	end

	private
	def authors_params
		params.require(:author).permit(:name, :surname, :sex, :birthdate)
	end
end