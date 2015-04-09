FactoryGirl.define do

  factory :user, class: User do
    password 'heslo123'
    password_confirmation 'heslo123'
    sequence :billapp_user do |n|
      "user-#{n}@gmail.com"
    end
    billapp_password 'heslo123'
    sequence :billapp_agenda do |n|
      "agenda#{n}"
    end
  end

  factory :billapp_user, class: User do
    password 'heslo123'
    password_confirmation 'heslo123'
  end

  factory :karelbagrcz, class: User do
    email 'karel@bagr.cz'
    name 'Karel'
    surname 'Bagr'
    password 'heslo123'
    password_confirmation 'heslo123'
    billapp_user 'karel@bagr.cz'
    billapp_password 'heslo'
    billapp_agenda 'karelbagr'
  end

  factory :tomasvaisarcz, class: User do
    email 'tomas@vaisar.cz'
    name 'Tomáš'
    surname 'Vaisar'
    password 'heslo123'
    password_confirmation 'heslo123'
    billapp_user 'tomas@vaisar.cz'
    billapp_password 'heslo'
    billapp_agenda 'tomvaisar'
  end
end
