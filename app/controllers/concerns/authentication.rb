module Authentication
    extend ActiveSupport::Concern

    included do
        before_action :current_user
        helper_method :current_user
        helper_method :user_signed_in?
    end

    def login(user)
        reset_session
        session[:current_user_id] = user.id
    end

    def logout
        reset_session
    end

    def redirect_if_authenticated
        if user_signed_in?
            flash[:alert] = "You are already logged in."
            redirect_to user_path Current.user
        end
    end

    def redirect_if_unauthenticated
        if !user_signed_in?
            flash[:alert] = "You must be authenticated."
            redirect_to root_path
        end
    end

    private

    def current_user
        Current.user ||= session[:current_user_id] && User.find(session[:current_user_id])
    end

    def user_signed_in?
        Current.user.present?
    end
end
