class Chitter < Sinatra::Base
  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    @user = User.create(email: params[:email],
                        password: params[:password],
                        username: params[:username],
                        full_name: params[:full_name])
    if @user.save
      session[:user_id] = @user.id
      redirect '/peeps'
    else
      flash.now[:errors] = @user.errors.full_messages
      erb :'users/new'
    end
  end
end
