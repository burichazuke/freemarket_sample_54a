FactoryBot.define do

  price = Faker::Number.within(300..9999999)

  factory :item do
    association :category
    association :seller, factory: :user
    name              { Faker::Name.name }
    description       {"説明"}
    size              {"s"}
    condition         {"新品"}
    shipping_fee      {"送料込み"}
    shipping_method   {"らくらくメルカリ便"}
    prefecture        {"東京都"}
    shipping_date     {"二日"}
    price             { price }
    profit            { price * 0.9 }
    status            {0}
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
  end

end