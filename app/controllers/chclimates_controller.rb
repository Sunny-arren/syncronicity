class ChclimatesController < ApplicationController
  def search_result
    @chcity = Chcity.find_by(simplified: params[:keyword])
    if @chcity.chclimate.middle_temp.present? && @chcity.chclimate.rain_total.present?
      @jpcities = Jpclimate.where(middle_temp: @chcity.chclimate.middle_temp-2..@chcity.chclimate.middle_temp+2) || Jpclimate.where(rain_total:@chcity.chclimate.rain_total-150..@chcity.chclimate.rain_total+150)
      if @jpcities.present?
        @selected_jpcities = []
        @jpcities.each do |data|
          difference_middle_temp = (data.middle_temp - @chcity.chclimate.middle_temp).abs
          difference_rain_total = (data.rain_total - @chcity.chclimate.rain_total).abs
          @selected_jpcities << [data.jpcity_id,difference_middle_temp,difference_rain_total]
        end
        @ordered_jpcities = []
        @ordered_jpcities = @selected_jpcities.sort{|a,b| a[1]<=>b[1]}.sort{|a,b| a[2] <=> b[2]}
        gon.ordered_jpcities = @ordered_jpcities
      else
        render template: "chcities/search/"       
      end
    else
      render template: "chcities/search/"
    end
  end  
  def show 
  end 
 
 private
  def chcity_params
   params.permit(:simplified,:pinyin)
  end
end
