module ApiCommunicator
  extend ActiveSupport::Concern

  included do
     before_action :set_api_credentials
  end

  def set_api_credentials
    Invoice.set_api_credentials(current_user.api_credentials)
  end
end
