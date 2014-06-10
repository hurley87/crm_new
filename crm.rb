require_relative 'rolodex'
require_relative 'contact'
require 'sinatra'

@@rolodex = Rolodex.new

@@rolodex.add_contact(Contact.new("Johnny", "Bravo", "johnny@bitmakerlabs.com", "Rockstar"))

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

get '/contacts/:id' do
 @contact = @@rolodex.find(params[:id].to_i)
 erb :show_contact
end

get "/contacts/:id/edit" do
	@contact = @@rolodex.find(params[:id].to_i)
  if @contact
    erb :edit
  else
    raise Sinatra::NotFound
  end
end

post "/contacts/:id/edit" do
	erb :edit
end

post '/contacts' do
  new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
  @@rolodex.add_contact(new_contact)
  redirect to('/contacts')
end