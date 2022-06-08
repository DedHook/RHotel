class FriendsController < ApplicationController
  before_action :set_friend, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :correct_user, only:[:edit,:update,:destroy]
  # GET /friends or /friends.json     
  def index
    @friends = Friend.all
    @rooms = Room.all
    
  end


  # GET /friends/new
  def new
    # @friends = Friend.new
    @friends = current_user.friend.build
    @rooms = Room.all
    @rooms.each do |room|
      if room.id == $q1
        gon.we = room.price
      end
    end
  end

  # GET /friends/1/edit
  def edit
  end

  # POST /friends or /friends.json
  def create
    # @friends = Friend.new(friend_params)
      @friends = current_user.friend.build(friend_params)
    respond_to do |format|
      if @friends.save
        format.html { redirect_to friend_url(@friends), notice: "Забронировано." }
        format.json { render :show, status: :created, location: @friends }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @friends.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friends/1 or /friends/1.json
  def update
    respond_to do |format|
      if @friends.update(friend_params)
        format.html { redirect_to friend_url(@friends), notice: "Обновлено." }
        format.json { render :show, status: :ok, location: @friends}
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @friends.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friends/1 or /friends/1.json
  def destroy
    @friends.destroy

    respond_to do |format|
      format.html { redirect_to friends_url, notice: "Удалено." }
      format.json { head :no_content }
    end
  end

def correct_user
  @friends = current_user.friend.find_by(id: params[:id])
  redirect_to friends_path, notice: "Не авторизован"if @friends.nil?
end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend
      @friends = Friend.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friend_params
      params.require(:friend).permit(:first_name, :last_name, :email, :phone,:start_date,:end_date, :room_id, :user_id)
    end
end
