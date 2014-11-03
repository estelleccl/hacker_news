enable :sessions

def login?
  if session[:username].nil?
    return false
  else
    return true
  end
end

def username
  return session[:username]
end

post '/login' do 
  @user = User.authenticate(params[:username], params[:password])
   if @user
     session[:username] = @user[:username]
     redirect '/'
   else
      @login_error_msg = "Invalid Username/Password"
      erb :'user/signup', layout: false
   end
end

get '/logout1' do
  session[:username] = nil
  session[:round] = nil
  redirect back
end

get '/signup_and_login' do
  erb :'user/signup', layout: false
end

post '/signup' do
  @user = User.create(username: params[:username], password: params[:password])
   if !@user.new_record? #Returns true if this object hasn’t been saved yet
     session[:username] = params[:username]
     redirect "/"
  else
     @error_msg = @user.errors.full_messages
     erb :'user/signup', layout: false
  end
end

get '/user/:id' do 
  if !login?
    redirect '/signup_and_login'
  else
    puts "whatever"
     @user = User.find_by( username: session[:username] )
    erb :'user/user_info'
  end
end