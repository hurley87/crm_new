
require 'sinatra'
require 'data_mapper'
enable 'sessions'

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


post '/contacts' do
  @contact = Contact.create(
    :first_name => params[:first_name],
    :last_name => params[:last_name],
    :email => params[:email],
    :note => params[:note],
    :rating => params[:rating]
  )
  session['id'] = @contact.id
  redirect to('/')
end

get '/contacts/:id' do
 @contact = Contact.get(params[:id].to_i)
 erb :show
end

delete '/contacts/:id' do
  @contact = Contact.get(params[:id].to_i)
  p Contact
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

post "/contacts/:id" do
  @contact = Contact.get(params[:id].to_i)
  @contact.update(
    :first_name => params[:first_name],
    :last_name => params[:last_name],
    :email => params[:email],
    :note => params[:note]
  )
	redirect to('/')
end
