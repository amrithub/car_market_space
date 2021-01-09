class CarsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index] # authenticates user
  before_action :set_car, only: [:show] # guest user can view the cars
  before_action :set_user_car, only: [:edit, :update, :destroy] # enable user to edit, update and delete the car from the list
  before_action :set_transmission, only: [:new, :edit] # transmission (radio) can only be in edit page and new car page
  before_action :set_air_conditioning, only: [:new, :edit] # air_conditioning  can only be in edit page and new car page
  before_action :set_lists, only: [:new, :edit] # user can add to list and edit
# A method for generating lists instance
def set_lists
    @lists = List.all
    
end

  
  # index method defined
  
  def index
    @q = Car.ransack(params[:q])
    @cars = @q.result
     
  end
 # Show method defined
  def show
    if current_user
    
      session = Stripe::Checkout::Session.create(
          payment_method_types: ['card'],
          customer_email: current_user.email,
          line_items: [{
            name: @car.model,
            description: @car.make,
            amount: @car.cost * 100,
            currency: 'aud',
            quantity: 1,
          }],
          payment_intent_data: {
              metadata: {
                  user_id: current_user.id,
                  car_id: @car.id
              }
          },
          success_url: "#{root_url}payments/success?userId=#{current_user.id}&carId=#{@car.id}",
          cancel_url: "#{root_url}cars"
      )
  
      @session_id = session.id
  end
end
  

  

  # GET /cars/new
  def new
    @car = Car.new
  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars
  # POST /cars.json
  def create
    
    
    @car = current_user.cars.create(car_params)
    respond_to do |format|
      if @car.save
        format.html { redirect_to @car, notice: 'Car was successfully created.' }
        format.json { render :show, status: :created, location: @car }
      else
        format.html { redirect_to new_car_path, notice: 'plz fill all the mandatory fields'  }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cars/1
  # PATCH/PUT /cars/1.json
  def update
    respond_to do |format|
      if @car.update(car_params)
        format.html { redirect_to @car, notice: 'Car was successfully updated.' }
        format.json { render :show, status: :ok, location: @car }
      else
        format.html { render :edit }
        format.json { render json: @car.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cars/1
  # DELETE /cars/1.json
  def destroy
    @car.destroy
    respond_to do |format|
      format.html { redirect_to cars_url, notice: 'Car was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    
    def set_transmission
      
      @transmissions = Car.transmissions.keys
  
    end
    def set_air_conditioning
      
      @air_conditionings = Car.air_conditionings.keys
  
    end
    def set_car
      @car = Car.find(params[:id])
    end
    def set_user_car
      id = params[:id]
      @car = current_user.cars.find_by_id(id)
  
      if @car == nil
          redirect_to cars_path
      end
  end
  end


    #Only allow a list of trusted parameters through.
    
  
    def car_params
      params.require(:car).permit(:date_posted, :cost, :description, :model, :kilometres, :telephone, :last_edited, :year_manufactured, :make, :body, :list_id, :transmission, :air_conditioning, :colour, :picture, :user_id)
    end

