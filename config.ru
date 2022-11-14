# This file is used by Rack-based servers to start the application.
# Rails.application.config.hosts << /[a-z0-9-.]+\.ngrok\.io/
require_relative "config/environment"
run Rails.application

require 'rack/cors'
use Rack::Cors do

  # allow all origins in development
  allow do
    origins 'http://localhost:3000/'
    resource '*', 
        :headers => :any, 
        :methods => [:get, :post, :delete, :put, :options]
  end
end

Rails.application.load_server
