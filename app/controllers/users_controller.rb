class UsersController < Clearance::UsersController

  def create
    new_user = User.new(user_params)
    new_user.save
  end

  def edit
    @user = current_user
  end

  def update
  end

  private

  def user_params
    params[:user].permit(:email, :password, :first_name, :last_name)
  end

end
