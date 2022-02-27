class ApplicationController < ActionController::Base
    include SessionsHelper

    def logged_in
        redirect_to root_path unless logged_in?
    end
end
