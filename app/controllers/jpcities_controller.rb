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
 
 def search_result
  @jpcity = Jpcity.find_by(jpkanji: params[:keyword])
  # @jpcity = Jpcity.find_by(params[:jpkanji])
  render action: :show
 end

 def show 
    # @latitude_id = ((@jpcity.jpcity2.latitude_id+1)..(@jpcity.jpcity2.latitude_id-1))
    # @chcity = Chcity.where(params[chcity2_attributes:[latitude_id:"#{@latitude_id}"]]).order('latitude DESC').limit(3)
    # @jpcity_name = Jpcity.find(params[:id])
 end

 private

 def jpcity_params
  params.permit(:pref,:jpkanji,:simplified,:hira,:alphabet)
 end
end