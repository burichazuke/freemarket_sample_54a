FactoryBot.define do

  factory :user do
    # email {test@test}
    # encrypted_password {"123456"}
    # created_at {Faker::Time.between(2.days.ago, Time.now, :all)}

    email { Faker::Internet.free_email }
    password {Faker::Internet.password(8)}
    nickname { Faker::Name.name }
    last_name { Faker::Name.last_name }
    first_name { Faker::Name.first_name }
    last_name_kana {"ヤマダ"}
    first_name_kana {"ヤマミ"}
    birthday  { Faker::Time.between(18.years.ago, Date.today, :all)}
    created_at {Faker::Time.between(2.days.ago, Time.now, :all)}
  end

end