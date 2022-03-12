class PinsController < ApplicationController
  before_action :set_pin, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /pins or /pins.json
  def index
    @pins = Pin.all
  end

  # GET /pins/1 or /pins/1.json
  def show
    if !user_signed_in?
      redirect_to new_user_session_path, notice: "Please log in first"
    elsif current_user.name.nil? || current_user.email.nil?
      redirect_to edit_user_registration_path, notice: "Please fill in your name and email!" 
    end
  end

  # GET /pins/new
  def new
    @pin = current_user.pins.build
  end

  # GET /pins/1/edit
  def edit
  end

  # POST /pins or /pins.json
  def create
    if pin_params[:description].empty?
      redirect_to new_pin_path, notice: "Must have a description to upload a new pin!"
    elsif !pin_params.has_key?(:image_header)
      redirect_to new_pin_path, notice: "Must have an image to upload a new pin!"
    else  
      @pin = current_user.pins.build(pin_params)

      respond_to do |format|
        if @pin.save
          format.html { redirect_to pin_url(@pin), notice: "Pin was successfully created." }
          format.json { render :show, status: :created, location: @pin }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @pin.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /pins/1 or /pins/1.json
  def update
    respond_to do |format|
      if @pin.update(pin_params)
        format.html { redirect_to pin_url(@pin), notice: "Pin was successfully updated." }
        format.json { render :show, status: :ok, location: @pin }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pins/1 or /pins/1.json
  def destroy
    @pin.destroy

    respond_to do |format|
      format.html { redirect_to pins_url, notice: "Pin was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = Pin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pin_params
      params.require(:pin).permit(:description, :user_id, :image_header)
    end

    def correct_user
      @pin = current_user.pins.find_by(id: params[:id])
      redirect_to pins_path, notice: "Not authorized to edit this pin" if @pin.nil?
    end
end
