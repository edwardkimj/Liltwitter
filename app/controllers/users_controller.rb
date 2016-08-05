get '/users' do
   @all_users = User.all
   erb :'users/index'
 end

 get '/users/new' do
  erb :'users/new'
 end

 get '/users/profile' do
   @user = current_user
   @num_subscribers = @user.subscribers.count
   @subscribing_to = @user.subscribing_to.count
   @posts = @user.posts
   erb :'users/show'
 end

 # get '/user/:id/edit' do
 # @user = User.find(params[:id])
 # erb :'users/edit'
 # end

 post '/users' do
  p params
  @user = User.new(params[:user])
  if @user.save
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  else
    # @errors = @user.errors.full_messages
    erb :'users/new'
  end
 end

get '/users/followers' do
  @user = current_user
  @subscribers =  current_user.subscribers
  erb :'users/followers'
end

get '/users/following' do
  @user = current_user
  @subscribers =  current_user.subscribing_to
  erb :'users/following'
end

post '/users/profile' do
  @user = current_user
  Post.create(content: params[:content], user_id: @user.id)
  redirect to('users/profile')
end
 # put '/users' do
 # @user = User.find(params[:id])
 # @user.update(params[:user)
 # redirect to("/user/#{@user.id}")
 # end

 # delete '/users' do
 # @user = User.find(params[:id])
 # @user.destroy
 # redirect to('/user')
 # end
