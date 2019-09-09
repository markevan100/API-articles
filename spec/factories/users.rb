FactoryBot.define do
  factory :user do
    sequence(:login) { |n| "jsmith#{n}" }
    name { "John Smith" }
    url { "http://mysite.com" }
    avatar_url { "http://mysite.com/avatar" }
    provider { "github" }
  end
end
