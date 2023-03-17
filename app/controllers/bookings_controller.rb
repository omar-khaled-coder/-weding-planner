class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show edit update destroy ]

  # GET /bookings or /bookings.json
  def index
    @bookings = Booking.all
  end

  # GET /bookings/new
  def new
    @booking = Booking.new
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings or /bookings.json
  def create
    @booking = Booking.new
    @booking.user_id = current_user.id

    @listing = Listing.find(params[:listing_id])
    if @listing.capacity.positive?
      @listing.capacity -= 1
      @listing.save

      @booking.listing = @listing
      @booking.status = "unconfirmed"
      @booking.save
      redirect_to dashboard_path
    else
      flash.now[:error] = "Bananas, its fully booked!"
      render "listings/show", status: :unprocessable_entity
    end

  end

  def show
    @booking = Booking.find(params[:id])
    @listing = Listing.find(params[:listing_id])
  end

  def update
    @booking = Booking.find(params[:id])

  if params[:status] == "confirmed"
    @booking.status = "confirmed"
    @booking.save
    redirect_to requests_path
  elsif params[:status] == "declined"
    @booking.status = "declined"
    @booking.save
    redirect_to requests_path
  end


  end

  # DELETE /bookings/1 or /bookings/1.json
  def destroy
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to bookings_url, notice: "Booking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      @booking = Booking.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:date, :user_id, :listing_id)
    end
end
