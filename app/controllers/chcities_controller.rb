class ChcitiesController < ApplicationController
  def index
  end
  
  def search
    @chcity = Chcity.where('name LIKE(?)', "%#{params[:keyword]}%").limit(6)
  end

  # def chcity_params
  #   params.require(:chcity).permit(
  #     :jpkanji,
  #     :hira,
  #     :simplified,
  #     :pinyin,
  #     :prov,
  #     chcity2_attributes:[
  #     :latitude,
  #     :longitude,
  #     :income,
  #     :r_price,
  #     :popul,
  #     :size,
  #     :dense,
  #     :chcity_id,
  #     :latitude_id
  #     ]
  #   )
  # end
end