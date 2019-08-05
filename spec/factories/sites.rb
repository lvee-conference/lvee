# Read about factories at https://github.com/thoughtbot/factory_bot

FactoryBot.define do
  factory :site do
    name {"test"}
    default {false}
    file {fixture_file_upload('files/test.zip','application/zip')}
  end
end
