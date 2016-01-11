class AdminController < ApplicationController

def dashboard
	most_viewed
end

def url
if request.original_url.include? "dash"
	   flash[:notice] = request.original_url
	else
		flash[:notice]="You are not in the Dashboard"
	end
end

def sale
	@status_heading = '<div class="panel-heading" style="background-color: #4CAF50 !important;">
						<h5 id="sold_veh_dash_title">
							For Sale
						</h5>
					  	<div class="panel-title white-text">
					  		<h5>Vehicles</h5>
					  	</div>
					  </div>'
	@modal_id = 'sale_modal'
	@vehicle_status = Vehicle.all.where(:status => "Sale")
end

def set_sale
	@vehicle = Vehicle.find(params[:vehicle])
    @vehicle.update_attributes(:status => "Sale")  
end

def sold
	@status_heading = '<div class="panel-heading red">
						<h5 id="sold_veh_dash_title">Sold</h5>
						<div class="panel-title white-text"><h5>Vehicles</h5></div>
					   </div>'
	@modal_id = 'sold_modal'
	@vehicle_status = Vehicle.all.where(:status => "Sold")
end

def set_sold
	@vehicle = Vehicle.find(params[:vehicle])
    @vehicle.update_attributes(:status => "Sold")  
end

def pending
	@status_heading = '<div class="panel-heading" style="background-color:#428bca;">
						<h5 style="float:right; color:white;">Pending</h5>
						<div class="panel-title" style="color:white;"><h5>Vehicles</h5></div>
					   </div>'	
	@modal_id = 'pending_modal'
	@vehicle_status = Vehicle.all.where(:status => "Pending")
end

def set_pending
	@vehicle = Vehicle.find(params[:vehicle])
    @vehicle.update_attributes(:status => "Pending")  
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
