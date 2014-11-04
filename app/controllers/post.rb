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
	   @user = User.find_by( username: session[:username] )
	   post = Post.create(title: params[:title], url: params[:url], text: params[:text], user_id: @user.id)
	   @user.posts << post
	   @posts = Post.all.order('id desc').take(30)
	  erb :newest
	end
end

get '/newest' do
	if !login?
    redirect '/signup_and_login'
	else
		@posts = Post.all.order('id desc').take(30)
		@user = User.find_by( username: session[:username] )
	  erb :newest
	end
end

get '/submitted/:userid' do
	if !login?
    redirect '/signup_and_login'
	else
		@post_user = User.find_by( id: params[:userid])
		@posts = Post.where( user_id: @post_user.id ).order('id desc').take(30)
		@user = User.find_by( username: session[:username] )
	  erb :'user/submission'
	end
end

get '/post/:id' do
	if !login?
    redirect '/signup_and_login'
	else
		@post = Post.find_by( id: params[:id] )
		@user = User.find_by( username: session[:username] )
		@all_comment = Comment.where( post_id: @post.id )
	  erb :'post/post'
	end
end