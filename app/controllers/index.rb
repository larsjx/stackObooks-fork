get '/' do
  redirect :'/posts'
end

get '/posts' do
  if current_user != nil
    @user = current_user.id
  end
  @posts = Post.all
  erb :'/posts/index'
end
