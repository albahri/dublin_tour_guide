require 'guide_decorator'

class GuidesController < ApplicationController
  before_action :set_guide, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user! 
  before_filter :ensure_admin, :only =>[:edit, :destroy]

  # GET /guides
  # GET /guides.json
  def index
    @guides = Guide.all
  end

  # GET /guides/1
  # GET /guides/1.json
  def show
  end

  # GET /guides/new
  def new
    @guide = Guide.new
  end

  # GET /guides/1/edit
  def edit
  end

  # POST /guides
  # POST /guides.json
  def create
    @guide = Guide.new()

    @guide.place = params[:guide][:place] 
    @guide.date = params[:guide][:date] 
    @guide.time = params[:guide][:time]
    @guide.language = params[:guide][:language]
    
    
    #create an instance/object of a BasicGuide
    myGuide = BasicGuide.new(50, @guide.place, @guide.date, @guide.time, @guide.language )

    #add the wxtra features to the new Guide 
    if params[:guide][:audio].to_s.length > 0 then 
      myGuide = AudioGuideDecorator.new(myGuide)
    end

    #populate the cost and place details
    @guide.place = myGuide.place
    @guide.cost = myGuide.cost
    # @guide.description = myGuide.description


    respond_to do |format|
      if @guide.save
        format.html { redirect_to @guide, notice: 'Guide was successfully created.' }
        format.json { render :show, status: :created, location: @guide }
      else
        format.html { render :new }
        format.json { render json: @guide.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guides/1
  # PATCH/PUT /guides/1.json
  def update
    respond_to do |format|
      if @guide.update(guide_params)
        format.html { redirect_to @guide, notice: 'Guide was successfully updated.' }
        format.json { render :show, status: :ok, location: @guide }
      else
        format.html { render :edit }
        format.json { render json: @guide.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guides/1
  # DELETE /guides/1.json
  def destroy
    @guide.destroy
    respond_to do |format|
      format.html { redirect_to guides_url, notice: 'Guide was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guide
      @guide = Guide.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guide_params
      params.require(:guide).permit(:place, :date, :time, :language)
    end

    def ensure_admin
      unless current_user && current_user.admin?
        render :text => "Access Error Message", :status => :unauthorized
    end
  end
end
