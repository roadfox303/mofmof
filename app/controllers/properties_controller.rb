class PropertiesController < ApplicationController
  before_action :set_id, only: [:edit,  :destroy, :update, :show]
  def index
    @properties = Property.all.reverse
  end

  def new
    @property = Property.new
    set_loop("登録する")
  end

  def show
    @stations = @property.stations
    @number = 0
  end

  def create
    @property = Property.new(properties_params)
    if @property.save
      flash[:success] = "登録しました"
      redirect_to properties_path
    else
      set_loop("登録する")
      render 'new'
    end
  end

  def update
    if @property.update(properties_params)
      flash[:success] = "更新しました"
      redirect_to properties_path
    else
      render 'new'
    end
  end

  def edit
    set_loop("変更する")
  end

  def destroy
    @property.destroy
    redirect_to properties_path
  end

  private
  def properties_params
    params.require(:property)
          .permit(
            :id,
            :name,
            :address,
            :price,
            :building_year,
            :note,
            stations_attributes: [
              :id,
              :line,
              :name,
              :walk_time,
              :_destroy
            ]
          )
  end

  def set_id
    @property = Property.find(params[:id])
  end

  def set_loop(button)
    max_station = 2
    record_stations = @property.stations.size
    @button = button
    @loop = 1
    if record_stations == 0
      @property.stations.build
      @loop = max_station
    elsif record_stations < max_station
      (max_station - record_stations).times do
        @property.stations.build
      end
    end
  end

end
