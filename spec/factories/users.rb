FactoryGirl.define do

  factory :user, class: User do
    password 'heslo123'
    password_confirmation 'heslo123'
    sequence :billapp_user do |n|
      "user-#{n}@gmail.com"
    end
    billapp_password 'heslicko'
    sequence :billapp_agenda do |n|
      "agenda#{n}"
    end
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
