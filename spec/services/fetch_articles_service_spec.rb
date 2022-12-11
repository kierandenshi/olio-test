# frozen_string_literal: true

require 'rails_helper'

describe FetchArticlesService do
  # rubocop:disable Security/Open
  let(:json) { open(Rails.root.join('spec/test-articles-v4.json')).read }
  # rubocop:enable Security/Open
  let(:url) { described_class::BASE_URL }
  let(:service) { described_class.new }

  describe '#call' do
    before do
      stub_request(:any, url).to_return(status: 200, body: json)
      allow(service).to receive(:persist)
    end

    it 'does a thing' do
      service.call
      expect(service).to have_received(:persist).with(JSON.parse(json))
    end
  end

  describe '#persist' do
    context 'with an empty database' do
      it 'persists all articles from json data' do
        service.persist(JSON.parse(json))
        expect(Article.count).to eq 25
      end
    end

    context 'with a populated database' do
      it 'persists new articles from json data' do
        create_list(:article, 5)
        service.persist(JSON.parse(json))
        expect(Article.count).to eq 30
      end

      it 'does not persist exsisting articles' do
        create(:article, external_id: 3_899_631)

        service.persist(JSON.parse(json))
        expect(Article.count).to eq 25
      end
    end
  end
end
