class Api::V1::ArticlesController < Api::V1::BaseController
  def getAll
    @articles = Article.all
  end
end