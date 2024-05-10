class UsersController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :set_user, only: %i[show update destroy]

	def index
		@users = User.all 
		render json: @users
	end
	def create
		@user = User.create!(user_params)
		render json: @user
	end

	def show
		render json: @user.as_json(include: :images).merge(
			images: @user.images.map { |image| url_for(image) }
			)
	end


	def update
		@user = User.update!(user_params)
		render json: @user
	end

	

	def destroy
		if @user.destroy
			render json: { messages: "User destroyed successfully", user: @user }
		else
			render json: { messages: "User could not be destroyed" }, status: :unprocessable_entity
		end
	end

	private

	def set_user
		if @user = User.find_by_id(params[:id])	
		else
			render json: {messages: " Id Not present "}
    end
	end

	def user_params
		params.require(:user).permit(:name, :age, :address, images: [])
	end

end
