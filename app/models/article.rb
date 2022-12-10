# frozen_string_literal: true

class Article
  def initialize(data)
    @data = data.with_indifferent_access
    @id = @data[:id]
    @title = @data[:title]
    @description = @data[:description]
    @section = @data[:section]
  end

  attr_reader :data, :id, :title, :description, :section

  def image
    @data[:photos].first[:files][:small]
  end
end
