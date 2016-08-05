get '/users' do
   @all_users = User.all
   erb :'users/index'
 end

 get '/users/new' do
  erb :'users/new'
 end

 get '/users/:id' do
   @user = User.find(params[:id])
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
