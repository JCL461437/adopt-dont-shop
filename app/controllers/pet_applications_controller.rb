class PetApplicationsController < ApplicationController
  def show
    @application = Application.find(params[:id]) 
    @pet_application = PetApplication.find(params[:id])
  end
end