require_relative 'rolodex'
require_relative 'contact'
require 'sinatra'

@@rolodex = Rolodex.new

get '/' do
	@crm_app_name = "My CRM"
	@time = Time.now.to_s
	erb :index
end

get '/contacts' do 
  erb :contacts
end

get '/contacts/new' do
	erb :new_contact
end

get 'contacts/:id' do

end

get "/contacts/:id/edit" do
	erb :edit
end