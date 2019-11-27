class JpcitiesController < ApplicationController
  def index
  end
  
  def search
    @jpcity = Jpcity.where('name LIKE(?)', "%#{params[:keyword]}%").limit(6)
  end
  
  def jpcity_params
    params.require(:jpcity).permit(
      :name, 
      :pref,
      :chinese,
      :temp,
      :precip,
      :latitude
    )
  end
end