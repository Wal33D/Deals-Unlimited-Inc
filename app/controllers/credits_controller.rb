class CreditsController < ApplicationController
  def new
    @credit = Credit.new
  end

  def create
    @credit = Credit.new(params[:credit])
    @credit.request = request
    if @credit.deliver
      flash.now[:notice] = 'Thank you for your application, We will contact you soon!'
    else
      flash.now[:error] = 'Cannot send message. Please try again later or call us at 269-324-4285'
      render :new
    end
  end
end