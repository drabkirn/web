FactoryBot.define do
  factory :user do
    first_name { Faker::Lorem.characters(number: 10).capitalize }
    last_name { Faker::Lorem.characters(number: 10).capitalize }
    email { Faker::Internet.email }
    username { Faker::Internet.username(specifier: 3..10, separators: %w(_)) }

    password { "12345678" }
    password_confirmation { "12345678" }
    admin { false }

    factory :confirmed_user do
      after(:create) do |user|
        user.confirm
      end
    end

    factory :admin_user do
      before(:create) do |user|
        user.admin = true
      end
    end

    factory :github_omniauth_user do
      before(:create) do |user|
        user.provider = "github"
        user.uid = "12345"
      end

      after(:create) do |user|
        user.confirm
      end
    end

    factory :google_oauth2_omniauth_user do
      before(:create) do |user|
        user.provider = "google_oauth2"
        user.uid = "56789"
      end

      after(:create) do |user|
        user.confirm
      end
    end

    factory :twitter_omniauth_user do
      before(:create) do |user|
        user.provider = "twitter"
        user.uid = "54321"
      end

      after(:create) do |user|
        user.confirm
      end
    end
  end
end
