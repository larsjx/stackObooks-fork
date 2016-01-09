get '/login' do
  erb :'/login', :layout => :'alt_layout'
end

post '/login' do
  @user = User.find_by(username: params[:username])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect :"/users/#{@user.id}"
  else
    redirect :'/'
  end
end

get '/logout' do
  session.delete(:user_id)
  redirect '/'
end

get '/session' do
  session.inspect
end
