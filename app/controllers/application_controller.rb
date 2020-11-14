require './config/environment'

class ApplicationController < Sinatra::Base
    
    configure do
        set :public_folder, 'public'
        set :views, 'app/views'
        enable :sessions
        set :session_secret, "again_security"
        register Sinatra::Flash
    end

    get "/" do
    
    end 

end
