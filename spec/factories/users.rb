FactoryGirl.define do

  factory :minimal_user, class: User do
    email 'incik@incik.cz'
    password 'heslo123'
    password_confirmation 'heslo123'
  end

  factory :tomasvaisarcz, class: User do
    email 'tomas@vaisar.cz'
    name 'Tomáš'
    surname 'Vaisar'
    password 'heslo123'
    password_confirmation 'heslo123'
    billapp_user 'tomas.vaisar@gmail.com'
    billapp_password 'heslicko'
    billapp_agenda 'tomvaisar'
  end
end
