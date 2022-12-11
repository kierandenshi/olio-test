# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    FetchArticlesService.new.call
    redirect_to articles_url
  end
end
