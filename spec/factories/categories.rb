FactoryBot.define do
  factory :category do
    name { Faker::Company.name }
    icon { Faker::Company.logo }
    user

    factory :category_with_payments do
      transient do
        payments_count { 3 }
      end

      after do
        Array.new(payments_count) { association(:payment) }
      end
    end
  end
end