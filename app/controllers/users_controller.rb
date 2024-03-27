class UsersController < ApplicationController

  def show
    #@user = User.new
    @user = User.find(params[:id])
    #binding.pry
    @prototypes = @user.prototypes
  end

end
