class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    
    def index
        render html: 'heroku deploy success'
    end
end
