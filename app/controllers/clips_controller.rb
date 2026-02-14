class ClipsController < ApplicationController
  before_action :set_clip, only: %i[ show edit update destroy addfragment ]

  # GET /clips or /clips.json
  def index
    @clips = Clip.all
  end

  # GET /clips/1 or /clips/1.json
  def show
  end
  def addfragment
    k=@clip.fragment.as_json
    k["clip_id"]=@clip.id
    k.delete("updated_at")
    k.delete("created_at")
    k.delete("composer_id")
    @hintfragment=Hintfragment.new(k)
    render "hintfragments/new"

  end

  # GET /clips/new
  def new
    @clip = Clip.new
  end

  # GET /clips/1/edit
  def edit
  end

  # POST /clips or /clips.json
  def create
    @clip = Clip.new(clip_params)

    respond_to do |format|
      if @clip.save
        format.html { redirect_to @clip.fragment, notice: "Clip was successfully created." }
        format.json { render :show, status: :created, location: @clip }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @clip.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clips/1 or /clips/1.json
  def update
    respond_to do |format|
      if @clip.update(clip_params)
        format.html { redirect_to @clip.fragment, notice: "Clip was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @clip }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @clip.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clips/1 or /clips/1.json
  def destroy
    @clip.destroy!

    respond_to do |format|
      format.html { redirect_to clips_path, notice: "Clip was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clip
      @clip = Clip.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def clip_params
      params.require(:clip).permit(:fragment_id, :title, :link, :description, :sortie, :image, :artist, :mytime)
    end
end
