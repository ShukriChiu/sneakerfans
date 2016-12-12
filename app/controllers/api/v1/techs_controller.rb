class Api::V1::TechsController < Api::V1::BaseController
  def show
    if (@tech = Tech.find(params[:id]))
    else
      render json: nil, :status => 404
    end
  end
  def getTechsByBrand
    @techs = Tech.where('brand_id' => params[:brand_id])
  end
end
