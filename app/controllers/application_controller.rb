class ApplicationController < ActionController::Base
    include Authentication

    def logged_in
        redirect_to root_path unless logged_in?
    end
end
