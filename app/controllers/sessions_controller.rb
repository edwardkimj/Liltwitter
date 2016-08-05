get '/session/follow' do
  @follow = Relationship.poster.find_by(subscriber: session[:id])
  erb :'follow'
end

