# frozen_string_literal: true

FactoryBot.define do
  factory :article do
    sequence(:external_id) { |n| n }

    title { 'Some title' }
    description { 'Some description' }
    section { 'food' }
    image_url { 'https://some_image.jpg' }
    likes { 0 }
  end
end
