class ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
  end

  def new

  end

  def create
    @application = Application.create(new_app)
    
    redirect_to "application/#{@application.id}"
  end

  private 
  
  def application_params 
    params.permit(params[:name], params[:street_address], params[:city], params[:state], params[:zip_code], params[:description])
  end
end