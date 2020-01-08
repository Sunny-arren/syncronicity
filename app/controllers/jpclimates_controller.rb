class JpclimatesController < ApplicationController
  def search_result
    @jpcity = Jpcity.find_by(jpkanji: params[:keyword])
    @chcities = Chclimate.where(middle_temp: (@jpcity.jpclimate.middle_temp-2..@jpcity.jpclimate.middle_temp+2)) || Chclimate.where(rain_total: (@jpcity.jpclimate.rain_total-150..@jpcity.jpclimate.rain_total+150))
    @selected_chcities = []
    @chcities.each do |data|
      difference_middle_temp = (data.middle_temp - @jpcity.jpclimate.middle_temp).abs
      difference_rain_total = (data.rain_total - @jpcity.jpclimate.rain_total).abs
      @selected_chcities << [data.chcity_id,difference_middle_temp,difference_rain_total]
    end
    @ordered_chcities = []
    @ordered_chcities = @selected_chcities.sort{|a,b| a[1]<=>b[1]}.sort{|a,b| a[2] <=> b[2]}
    gon.ordered_chcities = @ordered_chcities
  end

  def show 
  end 
 
 private
  def jpcity_params
   params.permit(:pref,:jpkanji,:simplified,:hira,:alphabet)
  end
end
