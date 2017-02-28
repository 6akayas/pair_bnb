class UsersController < Clearance::UsersController

def new
  @user = User.new
end

def create
  @user = User.new(user_params)

    if @user.save
        UserMailer.welcome_email(@user).deliver_now
        @next = root_url
        @msg = "User created - confirm or edit details..."
    else
        @next = root_url
        @msg = "Something went wrong :("
    end
    sign_in(@user)
    redirect_to @next, :info => @msg
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
