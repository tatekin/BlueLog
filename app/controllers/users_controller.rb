class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @logs = @user.logs.page(params[:page]).per(5).order("date DESC")
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :avatar)
    end

end
