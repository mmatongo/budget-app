FactoryBot.define do
  factory :payment do
    name { Faker::Commerce.product_name }
    amount { Faker::Commerce.price }
    author

    factory :payment_with_categories do
      transient do
        categories_count { 3 }
      end

      categories do
        Array.new(categories_count) { association(:category) }
      end
    end
  end
end