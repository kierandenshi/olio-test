# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index
    @articles = FetchArticlesService.new.call
    raise
  end
end
