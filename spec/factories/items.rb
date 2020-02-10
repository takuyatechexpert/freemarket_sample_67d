FactoryBot.define do

  factory :item do
    name              {"商品の名前"}
    description       {"商品説明"}
    size              {"商品のサイズ"}
    price             {300}
    status_id        {3}
    postage_id        {1}
    region_id         {1}
    shipping_date_id  {1}
    buyer_id          {2}
    seller_id         {1}
  end

end