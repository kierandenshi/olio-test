# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    external_id { 123 }
    title { 'Some title' }
    description { 'Some description' }
    section { 'food' }
    image_url { 'https://some_image.jpg' }
    likes { 1 }
  end
end
