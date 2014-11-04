get '/' do
  @posts = Post.all.order('id desc')
  @user = User.find_by( username: session[:username] )
  erb :index
end