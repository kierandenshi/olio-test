# frozen_string_literal: true

require 'rails_helper'

describe HomeController do
  describe 'GET #index' do
    let(:service_mock) { instance_double(FetchArticlesService) }

    before do
      allow(FetchArticlesService).to receive(:new).and_return(service_mock)
      allow(service_mock).to receive(:call)
      get :index
    end

    it { is_expected.to respond_with :redirect }

    it 'calls the fetch articles service' do
      expect(service_mock).to have_received(:call)
    end
  end
end
