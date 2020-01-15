class JpclimatesController < ApplicationController
  def search_result
    if Jpcity.find_by(jpkanji: params[:keyword]).nil?
       redirect_to controller: :jpcities, action: :search
       flash[:notice] = "該当する都市のレコードがありません"
    else
      @jpcity = Jpcity.find_by(jpkanji: params[:keyword])
      if @jpcity.jpclimate.middle_temp.present? && @jpcity.jpclimate.rain_total.present?
       @chcities = Chclimate.where(middle_temp: (@jpcity.jpclimate.middle_temp-2..@jpcity.jpclimate.middle_temp+2)) || Chclimate.where(rain_total: (@jpcity.jpclimate.rain_total-150..@jpcity.jpclimate.rain_total+150))
       if @chcities.present?
        @selected_chcities = []
        @chcities.each do |data|
          difference_middle_temp = (data.middle_temp - @jpcity.jpclimate.middle_temp).abs
          difference_rain_total = (data.rain_total - @jpcity.jpclimate.rain_total).abs
          @selected_chcities << [data.chcity_id,difference_middle_temp,difference_rain_total]
        end
        @ordered_chcities = []
        @ordered_chcities = @selected_chcities.sort{|a,b| a[1]<=>b[1]}.sort{|a,b| a[2] <=> b[2]}
        gon.ordered_chcities = @ordered_chcities
       else
        redirect_to controller: :jpcities, action: :search
        flash[:notice] = "類似した気候の中国の都市のデータがありません"
       end
     else
      redirect_to controller: :jpcities, action: :search
      flash[:notice] = "入力した都市の気候のデータがありません" 
     end
  end
end

def show 
end 
 
private
 def jpcity_params
   params.permit(:pref,:jpkanji,:simplified,:hira,:alphabet)
 end
end
