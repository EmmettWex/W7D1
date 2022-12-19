class SessionsController < ApplicationController
    def new
        @user = User.new
        render user_url
    end

    def create
        @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        # session[:session_token] = @user.reset_session_token!
        login!(@user)
        redirect_to cats_url
    end

    def destroy
        unless current_user == nil
            current_user.reset_session_token!
            session[:session_token] = nil
        end
    end
end
