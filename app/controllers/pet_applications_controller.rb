class PetApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id]) 
    @pet_application = PetApplication.find(params[:id])
  end

  def create 
    PetApplication.create(application_id: params[:application_id], pet_id: params[:pet_id])

    redirect_to "/applications/#{params[:application_id]}"
  end
end