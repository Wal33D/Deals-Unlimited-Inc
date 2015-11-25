class CreditsController < ApplicationController
  def new
    @credit = Credit.new
  end

  def create
    @credit = Credit.new(params[:credit])
    @credit.request = request
    if @credit.deliver
      flash.now[:notice] = 'Thank you for your message. We will credit you soon!'
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end
  end
end