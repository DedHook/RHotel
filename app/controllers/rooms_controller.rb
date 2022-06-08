class RoomsController < ApplicationController
  before_action :set_room, only: %i[ show edit update destroy ]
  # GET /rooms or /rooms.json
  def index
    @friends = Friend.all
    if params[:search]
      search_room
    elsif params[:sort] != "Цена:"
        @rooms = Room.all.sort_by {|room| room.tip}
    elsif params[:sort] == "Цена:"
      @rooms = Room.all.sort_by {|room| room.price}
    else
    @rooms = Room.all
    end
  end

  


  def search_room
    if params[:search].empty?
      redirect_to rooms_path()
    elsif @rooms = Room.all.find{|room| room.tip.include?(params[:search])}
          @rooms = Room.search(params[:search])
    else
      redirect_to rooms_path()
    end
  end



  # GET /rooms/1 or /rooms/1.json
  def show
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms or /rooms.json
  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to room_url(@room), notice: "Room was successfully created." }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1 or /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to room_url(@room), notice: "Room was successfully updated." }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1 or /rooms/1.json
  def destroy
    @room.destroy

    respond_to do |format|
      format.html { redirect_to rooms_url, notice: "Room was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.require(:room).permit(:tip, :price,:picture)
    end
end
