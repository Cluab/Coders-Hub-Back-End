# Define a new factory for user
# In future can be added more attributes for authentication.
FactoryBot.define do
  factory :user1, class: User do
    username { 'Alex' }
  end
end
