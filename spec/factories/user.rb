FactoryBot.define do
  factory :user do
    username { 'MyString' }
    role { 'admin' }
    email { 'MrC@example.com' }
    password { 'password' }
  end
end
