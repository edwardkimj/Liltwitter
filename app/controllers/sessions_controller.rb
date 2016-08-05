# get '/session/follow' do
#   @follow = Relationship.poster.find_by(subscriber: session[:id])
#   erb :'follow'
# end

get '/sessions/new' do
  erb :"sessions/new"
end

# get '/sessions/:id'
# end

post '/sessions' do
 p @user = User.find_by_email(params[:email])
  if @user && @user.authenticate(params[:password])
    session[:id] = @user.id
    redirect "/user/#{@user.id}"
  else
    @errors = ["Login incorrect, please try again!"]
    erb :"users/new"
  end
end


delete '/sessions' do
  session[:id] = nil
  redirect '/'
end

