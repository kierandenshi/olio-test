# frozen_string_literal: true

require 'net/http'

class FetchArticlesService
  BASE_URL = 'https://s3-eu-west-1.amazonaws.com/olio-staging-images/developer/test-articles-v4.json'

  def call
    url
      .then { |url_string| URI(url_string) }
      .then { |uri| Net::HTTP.get_response(uri).body || '{}' }
      .then { |json| JSON.parse(json) }
      .then { |json| persist(json) }
    Article.all
  end

  private

  def url
    BASE_URL
  end

  def persist(json)
    json.each do |element|
      e = element.with_indifferent_access
      Article.find_or_create_by({
        external_id: e[:id],
        title: e[:title],
        description: e[:description],
        section: e[:section],
        image_url: e[:photos].first[:files][:small]
      })
    end
  end
end
