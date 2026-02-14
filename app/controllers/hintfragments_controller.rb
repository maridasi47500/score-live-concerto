class HintfragmentsController < ApplicationController
  before_action :set_hintfragment, only: %i[ show edit update destroy ]

  # GET /hintfragments or /hintfragments.json
  def index
    @hintfragments = Hintfragment.all
  end

  # GET /hintfragments/1 or /hintfragments/1.json
  def show
  end

  # GET /hintfragments/new
  def new
    @hintfragment = Hintfragment.new
  end

  # GET /hintfragments/1/edit
  def edit
  end

  # POST /hintfragments or /hintfragments.json
  def create
    @hintfragment = Hintfragment.new(hintfragment_params)

    respond_to do |format|
      if @hintfragment.save
        format.html { redirect_to @hintfragment.clip.fragment, notice: "Hintfragment was successfully created." }
        format.json { render :show, status: :created, location: @hintfragment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hintfragment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hintfragments/1 or /hintfragments/1.json
  def update
    respond_to do |format|
      if @hintfragment.update(hintfragment_params)
        format.html { redirect_to @hintfragment.clip.fragment, notice: "Hintfragment was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @hintfragment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hintfragment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hintfragments/1 or /hintfragments/1.json
  def destroy
    @hintfragment.destroy!

    respond_to do |format|
      format.html { redirect_to hintfragments_path, notice: "Hintfragment was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hintfragment
      @hintfragment = Hintfragment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hintfragment_params
      params.require(:hintfragment).permit(:time, :key, :title, :content, :clip_id, :comment)
    end
end
