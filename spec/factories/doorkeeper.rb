FactoryBot.define do
  factory :application, class: 'Doorkeeper::Application' do
    name { Faker::App.name }
    redirect_uri { '' }
    uid { SecureRandom.hex(16) }
    secret { SecureRandom.hex(32) }
  end
end
