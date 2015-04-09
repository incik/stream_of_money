class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def api_credentials
    {
      site:     "https://#{billapp_agenda}.billapp.cz",
      user:     billapp_user,
      password: billapp_password
    }
  end
end
