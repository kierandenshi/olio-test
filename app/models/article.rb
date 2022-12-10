# frozen_string_literal: true

class Article < ApplicationRecord
  validates :external_id, presence: true, uniqueness: true

  def like!
    increment :likes, 1
    save
  end
end
