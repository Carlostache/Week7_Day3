class SessionsController < ApplicationController

    def create
        # debugger
        user = User.find_by_credentials(
            params[:user][:email],
            params[:user][:password]
        )

        if user.nil?
            flash.now[:errors] = ["Incorrect username and or password"]
            render :new
        else
            login_user!(user)
            redirect_to user_url(user)
        end
    end

    def new
        # debugger
        render :new
    end

    def destroy
        # debugger
        logout_user!
        redirect_to new_session_url
    end

end