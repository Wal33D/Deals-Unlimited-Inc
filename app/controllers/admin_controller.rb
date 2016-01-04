class AdminController < ApplicationController
  def dashboard
		@popular = Vehicle.all.order(:countclicks => "DESC").where(:status => "Sale")
 end
end
