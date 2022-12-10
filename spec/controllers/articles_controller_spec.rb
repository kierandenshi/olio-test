# frozen_string_literal: true

require 'rails_helper'

describe ArticlesController do
  describe 'GET #index' do
    before { get :index }

    it { is_expected.to respond_with :ok }
  end
end
