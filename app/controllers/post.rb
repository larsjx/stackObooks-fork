get '/posts/new' do
  if session[:user_id]
    erb :"posts/new", :layout => :'alt_layout'
  else
    redirect '/login'
  end
end

get '/posts/:id' do
  @post = Post.find(params[:id])
  @responses = @post.responses
  erb :"posts/show", :layout => :'alt_layout'
end

post '/posts' do
  @post = Post.new(params[:post].merge(user_id: session[:user_id]))
  if @post.save
    redirect '/posts'
  else
    "error"
  end
end

get '/posts/:id/edit' do
  @post = Post.find(params[:id])
  erb :"posts/edit", :layout => :'alt_layout'
end

put '/posts/:id' do
  Post.find(params[:id]).update(params[:post])
  redirect "/posts/#{params[:id]}"
end

delete '/posts/:id' do
  post = Post.find(params[:id])
  post.destroy
  redirect "/posts"
end


