class UsersController < Clearance::UsersController

def new
  @user = User.new
end

def create_from_omniauth
    auth_hash = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) || Authentication.create_with_omniauth(auth_hash)
    if authentication.user
        user = authentication.user
        authentication.update_token(auth_hash)
        @next = root_url
        @msg = "Signed in!"
    else
        user = User.create_with_auth_and_hash(authentication, auth_hash)
        @next = edit_user_path(user)
        @msg = "User created - confirm or edit details..."
    end
    sign_in(user)
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
