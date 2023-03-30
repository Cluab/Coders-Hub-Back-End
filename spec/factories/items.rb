# New Factory for item
FactoryBot.define do
  factory :item do
    name { 'FRONTEND MASTER' }
    description { 'Clear your doubts in front end developement' }
    photo { 'Photo' }
    price { 20 }
    mentor_name { 'John Doe' }
    duration { '2hours' }
  end
end
