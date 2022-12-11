# frozen_string_literal: true

require 'rails_helper'

describe Article do
  context 'with validations' do
    subject { build(:article) }

    it { is_expected.to validate_presence_of :external_id }
    it { is_expected.to validate_uniqueness_of :external_id }
  end

  context 'with #like! method' do
    let(:article) { build(:article) }

    it 'starts with zero likes' do
      expect(article.likes).to eq 0
    end

    it 'increments likes count once' do
      article.like!
      expect(article.likes).to eq 1
    end

    it 'increments likes count twice' do
      article.like!
      article.like!
      expect(article.likes).to eq 2
    end
  end
end
