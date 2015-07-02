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

require 'rubygems' # not necessary with ruby 1.9 but included for completeness 
require 'twilio-ruby' 
 
# put your own credentials here 
account_sid = 'AC06b0221d5531ccdac6be6fd3796bc6e3' 
auth_token = '[AuthToken]' 
 
# set up a client to talk to the Twilio REST API 
@client = Twilio::REST::Client.new account_sid, auth_token 
 
@client.account.messages.create({
	:from => '+12692056881', 
	:to => '3054694168', 
	:body => 'Hi ',  
})