class ChcitiesController < ApplicationController
  def index
  end
  
  def search
    @chcity = Chcity.where('name LIKE(?)', "%#{params[:keyword]}%").limit(6)
  end

  def chcity_params
    params.require(:chcity).permit(
      :name,
      :prov_ch
      :name_sim,
      :temp,
      :precip,
      :latitude
    )
  end
end