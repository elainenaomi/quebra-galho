class FerramentaController < ApplicationController
  before_action :set_ferramentum, only: [:show, :edit, :update, :destroy]

  # GET /ferramenta
  # GET /ferramenta.json
  def index
    @ferramenta = Ferramentum.all
  end

  # GET /ferramenta/1
  # GET /ferramenta/1.json
  def show
  end

  # GET /ferramenta/new
  def new
    @ferramentum = Ferramentum.new
  end

  # GET /ferramenta/1/edit
  def edit
  end

  # POST /ferramenta
  # POST /ferramenta.json
  def create
    @ferramentum = Ferramentum.new(ferramentum_params)

    respond_to do |format|
      if @ferramentum.save
        format.html { redirect_to @ferramentum, notice: 'Ferramentum was successfully created.' }
        format.json { render :show, status: :created, location: @ferramentum }
      else
        format.html { render :new }
        format.json { render json: @ferramentum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ferramenta/1
  # PATCH/PUT /ferramenta/1.json
  def update
    respond_to do |format|
      if @ferramentum.update(ferramentum_params)
        format.html { redirect_to @ferramentum, notice: 'Ferramentum was successfully updated.' }
        format.json { render :show, status: :ok, location: @ferramentum }
      else
        format.html { render :edit }
        format.json { render json: @ferramentum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ferramenta/1
  # DELETE /ferramenta/1.json
  def destroy
    @ferramentum.destroy
    respond_to do |format|
      format.html { redirect_to ferramenta_url, notice: 'Ferramentum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ferramentum
      @ferramentum = Ferramentum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ferramentum_params
      params.require(:ferramentum).permit(:nome, :descricao, :disponibilidade)
    end
end
