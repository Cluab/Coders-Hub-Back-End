# New Factory for item
FactoryBot.define do
  factory :item do
    name { 'FRONTEND MASTER' }
    description { 'Clear your doubts in front end developement' }
    photo { 'https://dashboard.microverse.org/assets/icon-white-6545162e585bbcd21acdfc30fbb9763ac2a42226c6a436f234a7bc370d4bf50f.png' }
    price { 20 }
    mentor_name { 'John Doe' }
    duration { '2hours' }
  end
end
FactoryBot.define do
  factory :item1 do
    name { 'MyString' }
    photo { 'https://avatars.githubusercontent.com/' }
    description { 'This is the last class item' }
    price { nil }
    duration { nil }
    mentor_name { nil }
  end
end
