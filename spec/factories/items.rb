<<<<<<< HEAD
#New Factory for item
FactoryBot.define do
  factory :item do
    name { "FRONTEND MASTER" }
    description { "Clear your doubts in front end developement" } 
    photo { "Photo" }
    price {20}
    mentor_name { "John Doe" }
    duration { "2hours" }
  end
end
=======
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
  
>>>>>>> development
