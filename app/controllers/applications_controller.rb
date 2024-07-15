class ApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id]) 
    @pets = Pet.find_pet_by_name(params[:name])
  end

  def new
  end

  def create
    application = Application.new({id: params[:id], name: params[:name], street_address: params[:street_address], city: params[:city], state: params[:state], zip_code: params[:zip_code], description: params[:description], status: 'In Progress'})
    
    if application.save
      redirect_to "/applications/#{application.id}"
    else 
      redirect_to "/applications/new"
      flash[:alert] = "You must fill out all the fields for the Application Form. Try Again"
    end

  end

  private 
  
  # def application_params 
  #   params.permit(params[:id], params[:name], params[:street_address], params[:city], params[:state], params[:zip_code], params[:description])
  # end
end
