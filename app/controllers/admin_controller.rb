class AdminController < ApplicationController

def dashboard
 	collections
	most_viewed
	counters
end

def url_checker
if request.original_url.include? "dash"
	   flash[:notice] = request.original_url
	else
		flash[:notice]="You are not in the Dashboard"
	end
end

def counters
	@vehicles_all_count = @vehicles_all.count()
	@vehicles_sale_count = @vehicles_sale.count()
	@vehicles_pending_count = @vehicles_pending.count()
	@vehicles_sold_count = @vehicles_sold.count()
end

def collections
	@vehicles_all = Vehicle.all
	@vehicles_sale = Vehicle.all.where(:status => "Sale")
	@vehicles_pending = Vehicle.all.where(:status => "Pending")
	@vehicles_sold = Vehicle.all.where(:status => "Sold")
end

def most_viewed
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
 	if(!@popular_first)
		@popular_first = Vehicle.all.order(:countclicks => "DESC").where(:status => "Sale").first(5)
		@popular_last = Vehicle.all.order(:countclicks => "DESC").where(:status => "Sale").last(5)
end
end

end
