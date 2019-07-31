FactoryBot.define do
  factory :category do

    name {"レディース"}
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }

  end
end
