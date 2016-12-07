class Api::V1::TechsController < Api::V1::BaseController
  def getTechsByBrand
    @techs = Tech.where('brand_id' => params[:brand_id])
  end
end
