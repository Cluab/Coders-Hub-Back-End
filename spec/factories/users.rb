FactoryBot.define do
  factory :user do
    username { 'MyString' }
    role { 'user' }
    email { 'johndoe@example.com' }
    password { 'password' }
    
  end
end
