require 'net/http'

class FetchArticlesService
  BASE_URL = 'https://s3-eu-west-1.amazonaws.com/olio-staging-images/developer/test-articles-v4.json'.freeze

  def initialize; end

  def call
    url
      .then { |url_string| URI(url_string) }
      .then { |uri| Net::HTTP.get_response(uri).body || '{}' }
      .then { |json| JSON.parse(json) }
  end

  private

  def url
    BASE_URL
  end
end
