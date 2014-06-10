require 'sinatra'

get '/' do
	@crm_app_name = "My CRM"
	@time = Time.now.to_s
	erb :index
end

