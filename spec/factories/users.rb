FactoryBot.define do
  factory :user, aliases: [:author] do
    name { Faker::Name.unique.name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }

    factory :user_with_categories do
      transient do
        categories_count { 3 }
      end

      categories do
        Array.new(categories_count) { association(:category) }
      end

      factory :user_with_payments do
        transient do
          payments_count { 3 }
        end

        payments do
          Array.new(payments_count) { association(:payment) }
        end
      end
    end
  end
end
