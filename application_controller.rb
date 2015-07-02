require 'bundler'
Bundler.require

class MyApp < Sinatra::Base

  get '/' do
    erb :index
  end

 
  post '/results' do
    @number=params[:number]
    @message=params[:message]
    erb :results
  end
  
end