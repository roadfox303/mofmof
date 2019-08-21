class PropertiesController < ApplicationController
  before_action :set_id, only: [:edit,  :destroy, :update, :show]
  def index
  end

  def new
    @propertie = Property.new
  end

  def show
  end

  def create
  end

  private
  def properties_params
    params.require(:propertie).permit(:id, :name, :address, :price, :building_year, :note)
  end

  def set_id
    @properties = Property.find(params[:id])
  end

end
