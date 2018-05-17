class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  skip_before_action :authorize, only: [:new, :create, :index]


  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user[:friends]=[]

    respond_to do |format|
      if @user.save
        format.html { redirect_to login_url, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def profile

  end

  def remove_friend
    username=params['usname']
    @u=User.find(session[:user_id])
    @arr=@u[:friends]
    @arr.delete(username)
    @u[:friends]= @arr
    @u.save
    redirect_to User.find_by(usname: username)
  end
  def add_friend
    username=params['usname']
    @u=User.find(session[:user_id])
    @arr=@u[:friends]
    if @arr.include?(username)
    else
      @arr.push(username)
    end
    @u[:friends]= @arr
    @u.save
    redirect_to User.find_by(usname: username)
  end

  def search
    username=params['usname']
    @user=User.find_by(usname: username)
    if @user
      redirect_to user_url(@user)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end




    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:usname, :password, :password_confirmation, :image, :remove_image)
    end
end

#if params[:password].length<8
#  redirect_to login_url, alert: "Password too short (Minimum 8 chars)"
#end
