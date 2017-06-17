class AttractionsController < ApplicationController
  before_action :set_attraction!, only: [:show, :edit, :update]

  def new
    @attraction = Attraction.new
  end

  def create
    @attraction = Attraction.new(attraction_params)

    if @attraction.save
      redirect_to @attraction, notice: "Attraction successfully created."
    else
      render :new
    end
  end

  def edit
  end

  def update
    @attraction.update(attraction_params)

    if @attraction.save
      redirect_to @attraction, notice: "Attraction successfully updated."
    else
      render :edit
    end
  end

  def index
    @attractions = Attraction.all
  end

  def show
  end

  private
    def set_attraction!
      @attraction = Attraction.find(params[:id])
    end

    def attraction_params
      params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end
end
