class Api::V1::ArticlesController < Api::V1::BaseController
  def show
    if (@article = Article.find(params[:id]))
    else
      render json: nil, :status => 404
    end
  end
  def getAll
    @articles = Article.all
    render :status => 200 
  end
end
