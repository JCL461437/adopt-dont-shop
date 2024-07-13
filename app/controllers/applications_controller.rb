class ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id])
  end

  def new

  end

  def create
    application = Application.create({id: params[:id], name: params[:name], street_address: params[:street_address], city: params[:city], state: params[:state], zip_code: params[:zip_code], description: params[:description], status: 'In Progress'})
    
    redirect_to "/applications/#{application.id}"
  end

  private 
  
  # def application_params 
  #   params.permit(params[:id], params[:name], params[:street_address], params[:city], params[:state], params[:zip_code], params[:description])
  # end
end
