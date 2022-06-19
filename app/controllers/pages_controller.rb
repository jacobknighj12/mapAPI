class PagesController < ApplicationController
  def home
    @application = Doorkeeper::Application.find_by(name: "Web API")
    
    @application = {
      name: @application.name,
      client_id: @application.uid,
      client_secret: @application.secret,

    }
  end
end
