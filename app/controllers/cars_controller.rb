class CarsController < ApplicationController

  before_action :set_car, only: %i[ show edit update destroy ]

  def index
    @cars = Car.all
  end

  def show
  end

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      redirect_to car_path(@car),  notice: 'Car was successfully created'
    else
      render :new, notice: 'An error occured while adding a car!'
    end
  end

  def edit
  end

  def update
    if @car.update(car_params)
      redirect_to car_path(@car), notice: "Car was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @car.destroy
    redirect_to cars_path, notice: 'Car has been successfully destroyed'
  end

  def costly_cars
    @costly_cars = Car.where(car_pr)

  private

  def set_car
    @car = Car.find(params[:id])
  end

  def car_params
    params.require(:car).permit(:mfg_company, :car_model, :mfg_year, :car_description, :horse_power, :top_speed, images: [])
  end
end