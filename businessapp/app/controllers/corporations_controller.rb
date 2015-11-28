class CorporationsController < ApplicationController
  before_action :set_corporation, only: [:show, :edit, :update, :destroy]

  # GET /corporations
  def index
    @corporations = Corporation.all
  end

  # GET /corporations/1
  def show
  end

  # GET /corporations/new
  def new
    @corporation = Corporation.new
  end

  # GET /corporations/1/edit
  def edit
  end

  # POST /corporations
  def create
    @corporation = Corporation.new(corporation_params)

    if @corporation.save
      redirect_to @corporation, notice: 'Corporation was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /corporations/1
  def update
    new_params = {}
    corporation_params.keys.each do |corporation_param_key|
      if corporation_param_key == "owner_ids"
        new_params[:owner_ids] = corporation_params[corporation_param_key].split(",")
      else
        new_params[corporation_param_key] = corporation_params[corporation_param_key]
      end
    end
    if @corporation.update_attributes(new_params)
      redirect_to @corporation, notice: 'Corporation was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /corporations/1
  def destroy
    @corporation.destroy
    redirect_to corporations_url, notice: 'Corporation was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_corporation
      @corporation = Corporation.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def corporation_params
      params.require(:corporation).permit(:name, :is_private, :owner_ids)
    end
end
