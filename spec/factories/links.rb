FactoryBot.define do
  factory :link do
    original_url { 'https://example.com' }
    lookup_code { SecureRandom.uuid[0..6] }
    name { 'Example Link' }
    user { nil }
  end
end
