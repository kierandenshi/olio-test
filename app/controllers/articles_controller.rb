# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index
    @articles = FetchArticlesService.new.call
    @food_articles = @articles.filter { |article| article.section == 'food' }
    @non_food_articles = @articles.filter { |article| article.section != 'food' }
  end
end
