class JpcitiesController < ApplicationController
  # before_action :search_result, except: [:index, :search]
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
    @chcities = Chcity2.where(latitude_id: @jpcity.jpcity2.latitude_id-5..@jpcity.jpcity2.latitude_id+5)
    @selected_chcities = []
    @chcities.each do |data|
      difference_lati = (data.lati - @jpcity.jpcity2.lati).abs
      @selected_chcities << [data.chcity_id, difference_lati]
    end
    @ordered_chcities = []
    @ordered_chcities = @selected_chcities.sort_by!{|a,b|b}.map{|k,v| k}.map.with_index{|v,i|[v,i]}
    gon.ordered_chcities = @ordered_chcities
  end

  def show 
  end 
 
 private
 def jpcity_params
  params.permit(:pref,:jpkanji,:simplified,:hira,:alphabet)
 end
end