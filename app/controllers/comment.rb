post '/comment/:postid' do
	if !login?
    redirect '/signup_and_login'
	else
		@post = Post.find_by( id: params[:postid] )
		@user = User.find_by( username: session[:username] )
		puts "post #{@post.id}"
		puts "post #{@user.id}"
		@comment = Comment.create( user_id: @user.id, post_id: @post.id, comment: params[:comment])
	  @all_comment = Comment.where( post_id: @post.id )
	  erb :'post/post'
	end
end

get '/comment/:userid' do
	if !login?
    redirect '/signup_and_login'
	else
		@comment_user = User.find_by( id: params[:userid])
		@comments = Comment.where( user_id: @comment_user.id ).order('id desc').take(30)
		@user = User.find_by( username: session[:username] )
	  erb :'user/comment'
	end
end