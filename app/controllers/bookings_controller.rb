class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :correct_user, only:[:edit,:update,:destroy]

  # GET /bookings or /bookings.json
  def index
    @bookings = Booking.all
    @rooms = Room.all
  end

  # GET /bookings/1 or /bookings/1.json
  def show
    @bookings = Booking.all
  end

  # GET /bookings/new
  def new
    @bookings = Booking.all
    @booking = current_user.booking.build
    @rooms = Room.all
    startDate =[];
    endDate = []; 
    @bookings.each do |booking|
      if booking.room_id == $q1
        startDate.push(booking.start_date)
        endDate.push(booking.end_date)
      end 
    gon.end_date = endDate;
    gon.start_date = startDate;
    end
    @rooms.each do |room|
      if room.id == $q1
        gon.we = room.price
      end
    end

  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings or /bookings.json
  def create
    # @booking = Booking.new(booking_params)
    @booking = current_user.booking.build(booking_params)


    respond_to do |format|
      if @booking.save
        format.html { redirect_to booking_url(@booking), notice: "Забронировано." }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1 or /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to booking_url(@booking), notice: "Обновлено." }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1 or /bookings/1.json
  def destroy
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to bookings_url, notice: "Удалено." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @booking = current_user.booking.find_by(id: params[:id])
    redirect_to bookings_path, notice: "Не авторизован"if @booking.nil?
  end

  # def checkRoom
  #  if @bookings = Booking.all.find{ |booking| booking.start_date.include?(params[:start_date])}
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:first_name, :last_name, :phone, :start_date, :end_date, :room_id, :user_id)
    end
end
