class TwitterAccountsController < ApplicationController
    before_action :logged_in

    def index
        @twitter_accounts = current_user.twitter_accounts
    end

    def new
        @twitter_account = current_user.twitter_accounts.build
    end

    def create
        @twitter_account = current_user.twitter_accounts.build(twitter_account_params)

        configFile = YAML.load(File.open('config.yml').read)
        puts configFile

        client = Twitter::REST::Client.new do |config|
            config.consumer_key = configFile["twitter"]["consumer_key"]
            config.consumer_secret = configFile["twitter"]["consumer_secret"]
            config.access_token = @twitter_account.access_token
            config.access_token_secret = @twitter_account.access_token_secret
        end

        begin
            client.friends
            if @twitter_account.save
                flash[:success] = "Twitter account created"
                redirect_to posts_path
            else
                render 'new'
            end
        rescue Twitter::Error::Forbidden, Twitter::Error::Unauthorized
            puts "Captured twitter exception"
            @twitter_account.errors.add(:base, "Twitter credentials not valid.")
            render 'new'
        end
    end

    def destroy
        @twitter_account = current_user.twitter_accounts.find(params[:id])
        @twitter_account.destroy
        redirect_to twitter_accounts_path, status: :see_other
    end

    private

    def twitter_account_params
        params.require(:twitter_account).permit(:name, :access_token, :access_token_secret)
    end
end
