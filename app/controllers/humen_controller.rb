class HumenController < ApplicationController
  before_action :set_human, only: [:show, :edit, :update, :destroy]

  # GET /humen
  # GET /humen.json
  def index
    @humen = Human.all
    respond_to do |format|
      format.json #{ render json: @humen, status: 200 }
      format.xml { render xml: @humen, status: 200 }
    end
  end

  # GET /humen/1
  # GET /humen/1.json
  def show
  end

  # GET /humen/new
  def new
    @human = Human.new
  end

  # GET /humen/1/edit
  def edit
  end

  # POST /humen
  # POST /humen.json
  def create
    @human = Human.new(human_params)

    respond_to do |format|
      if @human.save
        format.html { redirect_to @human, notice: 'Human was successfully created.' }
        format.json { render :show, status: :created, location: @human }
      else
        format.html { render :new }
        format.json { render json: @human.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /humen/1
  # PATCH/PUT /humen/1.json
  def update
    respond_to do |format|
      if @human.update(human_params)
        format.html { redirect_to @human, notice: 'Human was successfully updated.' }
        format.json { render :show, status: :ok, location: @human }
      else
        format.html { render :edit }
        format.json { render json: @human.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /humen/1
  # DELETE /humen/1.json
  def destroy
    @human.destroy
    respond_to do |format|
      format.html { redirect_to humen_url, notice: 'Human was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_human
      @human = Human.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def human_params
      params.require(:human).permit(:name, :desc)
    end
end
