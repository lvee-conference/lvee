require 'factory_bot'

FactoryBot.define do
  factory :language do
    trait :en do
      name {'en'}
      description {'English'}
      published {true}
      code3 {'eng'}
    end
  end
end
