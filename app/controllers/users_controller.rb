class UsersController < Clearance::UsersController

def new
  @user = User.new
end

def create
  @user = User.new(user_params)
  respond_to do |format|
    if @user.save
      UsersSignupJob.perform_later
      format.html { redirect_to @user, notice: 'User was successfully created.' }
      # format.js   {}
      format.json { render json: @user, status: :created, location: @user }
    else
      format.html { render action: "new" }
      format.js   {}
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end
end

def show
  @user = current_user
end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end 

  private

  def user_params
    params[:user].permit(:email, :password, :first_name, :last_name)
  end
end
