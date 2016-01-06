class AdminController < ApplicationController

  def dashboard
		objArray = Array.new
		@popular = Vehicle.all.order(:countclicks => "DESC").where(:status => "Sale")
		@popular.each do |vehicle| 
			if vehicle.countclicks.is_a? Integer
				objArray.push vehicle
			end
		end
	@popular = objArray;
 	@popular_first = objArray.first(10).each_slice(5).to_a.first
 	@popular_last=  objArray.first(10).each_slice(5).to_a.last
 end

end
