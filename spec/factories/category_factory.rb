FactoryBot.define do
    factory :category do
        name { "New Category" }
        description { "Just a short description of the current task" }

        trait :date_created do
            date_created { Date.now }
            date_created { Time.now }
        end
    end
end