relative_require 'contact'
require 'sinatra'

get '/' do
	@crm_app_name = "My CRM"
	@time = Time.now.to_s
	erb :index
end

get '/contacts' do 
	"what up"
end

get '/contacts/new' do
	erb :new_contact
end

get 'contacts/:id' do

end

get "/contacts/:id/edit" do
	erb :edit
end