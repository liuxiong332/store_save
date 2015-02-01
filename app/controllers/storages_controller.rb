class StoragesController < ApplicationController
  before_action :set_storage, only: [:show, :edit, :update, :destroy]

  # GET /storages
  # GET /storages.json
  def index
    @storages = Storage.all
  end

  # GET /storages/1
  # GET /storages/1.json
  def show
  end

  # GET /storages/new
  def new
    @storage = Storage.new
  end

  # GET /storages/1/edit
  def edit
  end

  # POST /storages
  # POST /storages.json
  def create
    @storage = Storage.new(storage_params)

    respond_to do |format|
      if @storage.save
        format.html { redirect_to @storage, notice: 'Storage was successfully created.' }
        format.json { render :show, status: :created, location: @storage }
      else
        format.html { render :new }
        format.json { render json: @storage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /storages/1
  # PATCH/PUT /storages/1.json
  def update
    respond_to do |format|
      if @storage.update(storage_params)
        format.html { redirect_to @storage, notice: 'Storage was successfully updated.' }
        format.json { render :show, status: :ok, location: @storage }
      else
        format.html { render :edit }
        format.json { render json: @storage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /storages/1
  # DELETE /storages/1.json
  def destroy
    @storage.destroy
    respond_to do |format|
      format.html { redirect_to storages_url, notice: 'Storage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def create_add_item
    _add_item Item.check_create(params)
  end

  def add_item
    _add_item Item.find(params[:item_id])
  end

  def remove_item
    storage = Storage.find(params[:id])
    item = Item.find(params[:item_id]);
    current_user
    if @current_user && item
      item.storage = nil
      item.save
      HistoricalRecord.create(user: @current_user, storage: storage, item: item)
    end
    redirect_to action: :index
  end

  def get_items
    storage = Storage.find(params[:id])
    @items = storage.items
  end

  def records
    @historical_records = set_storage.historical_records
  end

  private

    def _add_item(item)
      storage = Storage.find(params[:id])
      current_user
      if @current_user && item
        item.storage = storage
        item.save
        $stdout.print 'item :', item.storage
        HistoricalRecord.create(user: @current_user, storage: storage, item: item)
      end
      redirect_to action: :index
    end

    def current_user
      @current_user ||= session[:current_user_id] && User.find(session[:current_user_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_storage
      @storage = Storage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def storage_params
      params.require(:storage).permit(:title)
    end
end
