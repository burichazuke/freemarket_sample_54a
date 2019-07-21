FactoryBot.define do

  factory :user do
    email {test@test}
    encrypted_password {"123456"}
    created_at {Faker::Time.between(2.days.ago, Time.now, :all)}
  end

end