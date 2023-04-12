FactoryBot.define do
  factory :user do
    username { 'MyString' }
    role { 'admin' }
    email { 'johndoe@example.com' }
    password { 'password' }
  end
end
