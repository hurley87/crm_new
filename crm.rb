
require 'sinatra'
require 'data_mapper'

DataMapper.setup(:default, "sqlite3:database.sqlite3")

class Contact
  include DataMapper::Resource

  property :id, Serial
  property :first_name, String
  property :last_name, String
  property :email, String
  property :note, String
  property :rating, String
end

DataMapper.finalize
DataMapper.auto_upgrade!


get '/' do
  @contacts = Contact.all
	erb :contacts
end

get '/contacts/new' do
	erb :new_contact
end

get '/contacts/:id' do
 @contact = Contact.get(params[:id].to_i)
 erb :show
end

put "/contacts/:id" do
  @contact = Contact.get(params[:id].to_i)
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
  @contact = Contact.get(params[:id].to_i)
  if @contact
    @contact.destroy
    redirect to("/")
  else
    raise Sinatra::NotFound
  end
end

get "/contacts/:id/edit" do
	@contact = Contact.get(params[:id].to_i)
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
  contact = Contact.create(
    :first_name => params[:first_name],
    :last_name => params[:last_name],
    :email => params[:email],
    :note => params[:note],
    :rating => params[:rating]
  )
  redirect to('/')
end