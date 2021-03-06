class LoginController < ApplicationController
  get '/login' do 
    if logged_in?
      redirect "/tweets"
    else
      erb :'users/login'
    end
  end

  post "/login" do
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect "/tweets"
    else
      redirect '/failure'
    end
  end

  get '/failure' do
    erb :'users/failure'
  end

  get "/logout" do
    session.clear
    redirect "/login"
  end
end
