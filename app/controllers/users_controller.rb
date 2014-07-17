#coding: UTF-8

class UsersController < ApplicationController
	 before_action :make_sure_its_mine, only: [:show]
  
  def show
    @user=current_user
  end

  def index
		@users=User.all
	end

  private
    def make_sure_its_mine
      unless current_user.id==params[:id].to_i
        redirect_to root_url, notice: "To nie twoje konto!"
      end
      true
    end

	end