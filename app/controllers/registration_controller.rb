# overriding default devise registration controller so it can handle my custom parameters
class RegistrationController < Devise::RegistrationsController

  private

    def sign_up_params
      params.require(:user).permit(:name, :surname, :email, :password, :password_confirmation, :billapp_user, :billapp_password, :billapp_agenda)
    end
end