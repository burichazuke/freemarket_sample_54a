FactoryBot.define do

  factory :item do
    association :category
    association :seller, factory: :user
    name              { Faker::Games::Pokemon.name }
    description       {"#{Faker::Games::Pokemon.name}大好きです"}
    size              {"s"}
    condition         {"新品"}
    shipping_fee      {"送料込み"}
    shipping_method   {"らくらくメルカリ便"}
    prefecture        {"東京都"}
    shipping_date     {"二日"}
    price             { 1000 }
    profit            { 900 }
    status            {0}
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
  end

end