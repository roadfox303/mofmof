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
    @button = button
    if @property.stations.size < 2
      @property.stations.build
      @number = 2
    else
      @number = 1
    end
  end

end
