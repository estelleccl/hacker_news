get '/submit' do
	if !login?
    redirect '/signup_and_login'
	else
	  erb :submit
	end
end

post '/submit' do
	if !login?
    redirect '/signup_and_login'
	else
	   user = User.find_by( username: session[:username] )
	   Post.create(title: params[:title], url: params[:url], text: params[:text], user_id: user.id)
	   @posts = Post.all.order('id desc').take(30)
	  erb :newest
	end
end

get '/newest' do
	if !login?
    redirect '/signup_and_login'
	else
		@posts = Post.all.order('id desc').take(30)
	  erb :newest
	end
end