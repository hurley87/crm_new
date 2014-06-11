require_relative 'rolodex'
require_relative 'contact'
require 'sinatra'

@@rolodex = Rolodex.new

get '/' do
	erb :contacts
end

get '/contacts/new' do
	erb :new_contact
end

get '/contacts/:id' do
 @contact = @@rolodex.find(params[:id].to_i)
 erb :show
end

put "/contacts/:id" do
  @contact = @@rolodex.find(params[:id].to_i)
  if @contact
    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.note = params[:note]
    @contact.rating = params[:rating]

    redirect to("/")
  else
    raise Sinatra::NotFound
  end
end

delete '/contacts/:id' do
  @contact = @@rolodex.find(params[:id].to_i)
  if @contact
    @@rolodex.remove_contact(@contact)
    redirect to("/")
  else
    raise Sinatra::NotFound
  end
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
  new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note], params[:rating])
  @@rolodex.add_contact(new_contact)
  redirect to('/')
end