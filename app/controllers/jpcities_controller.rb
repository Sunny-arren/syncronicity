class JpcitiesController < ApplicationController
  def index
  end
  
  def search
    @jpcity_name = Jpcity.where('jpkanji LIKE(?)', "%#{params[:keyword]}%").limit(6)
    @jpcity_hira = Jpcity.where('hira LIKE(?)', "%#{params[:keyword]}%").limit(6)
    @jpcity_alpha = Jpcity.where('alphabet LIKE(?)', "%#{params[:keyword]}%").limit(6)
    if @jpcity_name != []
      @jpcities = @jpcity_name
    elsif @jpcity_hira != []
      @jpcities = @jpcity_hira
    else
      @jpcities = @jpcity_alpha
    end
    respond_to do |format|
     format.html
     format.json{render json:@jpcities}
    end
  end

 def jpcity_params
    params.require(:jpcity).permit(
      :pref,
      :jpkanji,
      :simplified,
      :hira,
      :alphabet
    )
 end
 class JpcitiesController < ChcitiesController
  def show
    @jpcity = Product.find(params[:id])
    @chcity = Chcity.where(latitude: chcity.latitude <= @jpcity.latitude+ 0.5 || chcity.latitude >= @jpcity.latitude-0.5).order('latitude DESC').limit(3)
  end
 end
end