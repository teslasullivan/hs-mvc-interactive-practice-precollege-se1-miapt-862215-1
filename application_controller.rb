require 'bundler'
Bundler.require
require 'rubygems' # not necessary with ruby 1.9 but included for completeness 
require 'twilio-ruby' 

class MyApp < Sinatra::Base
  
  # put your own credentials here 
account_sid = 'AC06b0221d5531ccdac6be6fd3796bc6e3' 
auth_token = '4884e02ce8278776089525f3af5d945f' 

  get '/' do
    erb :index
  end

 
  post '/results' do
    @number=params[:number]
    @message=params[:message]
 
 
    # set up a client to talk to the Twilio REST API 
    @client = Twilio::REST::Client.new account_sid, auth_token 

    @client.account.messages.create({
    :from => +12692056881, 
    :to => @number,
    :body => @message 
    })
    
   erb :results
    
  end
end