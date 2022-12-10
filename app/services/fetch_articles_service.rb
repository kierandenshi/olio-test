# frozen_string_literal: true

require 'net/http'

class FetchArticlesService
  BASE_URL = 'https://s3-eu-west-1.amazonaws.com/olio-staging-images/developer/test-articles-v4.json'

  def call
    url
      .then { |url_string| URI(url_string) }
      .then { |uri| Net::HTTP.get_response(uri).body || '{}' }
      .then { |json| JSON.parse(json) }
      .then { |json| collection(json) }
  end

  private

  def url
    BASE_URL
  end

  def collection(json)
    json.map { |element| Article.new(element) }
  end
end
