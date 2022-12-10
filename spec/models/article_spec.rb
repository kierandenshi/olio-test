# frozen_string_literal: true

require 'rails_helper'

describe Article do
  context 'with validations' do
    subject { build(:article) }

    it { is_expected.to validate_presence_of :external_id }
    it { is_expected.to validate_uniqueness_of :external_id }
  end
end
