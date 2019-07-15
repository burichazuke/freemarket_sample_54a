FactoryBot.define do

  factory :item do
    name              {"abe"}
    description       {"説明"}
    size              {"s"}
    condition         {"新品"}
    shipping_fee      {"送料込み"}
    shipping_method   {"らくらくメルカリ便"}
    prefecture        {"東京都"}
    shipping_date     {"二日"}
    price             {2000}
    profit            {200}
    status            {0}
    seller_id         {1}
    buyer_id          {2}
    created_at { Faker::Time.between(2.days.ago, Time.now, :all) }
  end

  factory :user do
    user_id {1}
    user_id {2}
  end


end