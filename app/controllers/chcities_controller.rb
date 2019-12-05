class ChcitiesController < ApplicationController
  def index
  end
  
  def search
    @chcity = Chcity.where('name LIKE(?)', "%#{params[:keyword]}%").limit(6)
  end

  def chcity_params
    params.require(:chcity).permit(
      :jpkanji,
      :hira,
      :simplified,
      :pinyin,
      :prov 
    ).include(:chcity2).permit(
      :latitude,
      :longitude,
      :income,
      :r_price,
      :popul,
      :size,
      :dense,
      :chcity_id
    )
  end
end