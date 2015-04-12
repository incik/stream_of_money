require 'active_resource'

class ApiResource < ActiveResource::Base
  def self.set_api_credentials(params)
    self.site = params[:site]
    self.user = params[:user]
    self.password = params[:password]
    self.format = :xml
  end
end
