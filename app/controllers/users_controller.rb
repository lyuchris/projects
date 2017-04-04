class UsersController < ApplicationController
	before_action :authenticate_user!
	def  my_portfolio
		@user_stocks = current_user.user_stocks
		@user = current_user
	end
end
