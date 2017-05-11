class ReleaseMainsController < ApplicationController
  before_action :set_release_main, only: [:show, :edit, :update, :destroy]

  # GET /release_mains
  # GET /release_mains.json
  def index
    @release_mains = ReleaseMain.all
  end

  # GET /release_mains/1
  # GET /release_mains/1.json
  def show
  end

  # GET /release_mains/new
  def new
    @release_main = ReleaseMain.new
  end

  # GET /release_mains/1/edit
  def edit
  end

  # POST /release_mains
  # POST /release_mains.json
  def create
    @release_main = ReleaseMain.new(release_main_params)

    respond_to do |format|
      if @release_main.save
        format.html { redirect_to @release_main, notice: 'Release main was successfully created.' }
        format.json { render :show, status: :created, location: @release_main }
      else
        format.html { render :new }
        format.json { render json: @release_main.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /release_mains/1
  # PATCH/PUT /release_mains/1.json
  def update
    respond_to do |format|
      if @release_main.update(release_main_params)
        format.html { redirect_to @release_main, notice: 'Release main was successfully updated.' }
        format.json { render :show, status: :ok, location: @release_main }
      else
        format.html { render :edit }
        format.json { render json: @release_main.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /release_mains/1
  # DELETE /release_mains/1.json
  def destroy
    @release_main.destroy
    respond_to do |format|
      format.html { redirect_to release_mains_url, notice: 'Release main was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_release_main
      @release_main = ReleaseMain.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def release_main_params
      params.fetch(:release_main, {})
    end
end
