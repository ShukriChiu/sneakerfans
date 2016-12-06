class Api::V1::BrandsController < Api::V1::BaseController
  # havent done anything yet
  def getAll
    @brands = Brand.all
  end
  
end
