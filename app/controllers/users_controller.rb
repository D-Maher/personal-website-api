class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  def index
    render json: User.all
  end

  # GET /users/:user_id
  def show
    render json: @user
  end

  # POST /users
  def create
    user = User.create(user_params)

    if user.save
      render json: user
    else
      render user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/:user_id
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/:user_id
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(
        :email,
        :password,
        :password_confirmation,
        :f_name,
        :l_name
      )
    end
end
