FactoryBot.define do
  factory :api_manager do
    association :user, factory: :confirmed_user

    scopes { ["Quote"] }
    api_counts { [0] }

    factory :api_manager_two do
      after(:create) do |api_manager|
        user = create(:confirmed_user)
        api_manager.user_id = user.id
      end
    end
  end
end
