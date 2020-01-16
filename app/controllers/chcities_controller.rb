class ChcitiesController < ApplicationController
  def index
  end
  
  def search
    @chcity_simplified = Chcity.where('simplified LIKE(?)', "%#{params[:keyword]}%").limit(6)
    @chcity_pinyin = Chcity.where('pinyin LIKE(?)', "%#{params[:keyword]}%").limit(6)
    if @chcity_simplified != []
      @chcities = @chcity_simplified
    else @chcity_pinyin != []
      @chcities = @chcity_pinyin
    end
    respond_to do |format|
     format.html
     format.json{render json:@chcities}
    end
  end

  def search_result
    if Chcity.find_by(simplified: params[:keyword]).nil?
      redirect_to controller: :chcities, action: :search
      flash[:notice] = "很抱歉！该城市的数据目前没有"
    else 
      @chcity = Chcity.find_by(simplified: params[:keyword])
      @jpcities = Jpcity2.where(latitude_id: @chcity.chcity2.latitude_id-5..@chcity.chcity2.latitude_id+5)
      @selected_jpcities = []
        @jpcities.each do |data|
        difference_lati = (data.lati - @chcity.chcity2.lati).abs
        @selected_jpcities << [data.jpcity_id, difference_lati]
        end
     @ordered_jpcities = []
     @ordered_jpcities = @selected_jpcities.sort_by!{|a,b|b}.map{|k,v| k}.map.with_index{|v,i|[v,i]}
     gon.ordered_jpcities = @ordered_jpcities
    end
    @search_pattern = "纬度"
  end
   
  def show 
  end 
 
 private
 def chcity_params
  params.permit(:simplified,:pinyin)
 end
end