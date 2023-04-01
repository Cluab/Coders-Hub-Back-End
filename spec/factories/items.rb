FactoryBot.define do
    factory :item do
      name { 'MyString' }
      photo { 'https://avatars.githubusercontent.com/' }
      description { 'This is the last class item' }
      price { nil }
      duration { nil }
      mentor_name { nil }
    end
  end
  