# frozen_string_literal: true

class ArticlesController < ApplicationController
  def index
    @articles = Article.all
    @food_articles = @articles.filter { |article| article.section == 'food' }
    @non_food_articles = @articles.filter { |article| article.section != 'food' }
  end

  def like
    Article.find(params[:id]).like!
    redirect_to action: 'index'
  end
end
