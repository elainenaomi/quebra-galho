class HabilidadesController < ApplicationController
  before_action :verify_user_login
  before_action :set_habilidade, only: [:show, :edit, :update, :destroy]

  # GET /habilidades
  # GET /habilidades.json
  def index
    @criadas = logged_user.habilidades
    @solicitei = EmprestimoHabilidade.select{|e| e.usuario_id == logged_user.id}.map{|e| e.habilidade}
  end

  # GET /habilidades/1
  # GET /habilidades/1.json
  def show
  end

  # GET /habilidades/new
  def new
    @habilidade = Habilidade.new
  end

  # GET /habilidades/1/edit
  def edit
  end

  # POST /habilidades
  # POST /habilidades.json
  def create
    @habilidade = Habilidade.new(habilidade_params)
    @habilidade.usuario_id = logged_user.id
    respond_to do |format|
      if @habilidade.save
        format.html { redirect_to @habilidade, notice: 'Habilidade was successfully created.' }
        format.json { render :show, status: :created, location: @habilidade }
      else
        format.html { render :new }
        format.json { render json: @habilidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /habilidades/1
  # PATCH/PUT /habilidades/1.json
  def update
    respond_to do |format|
      if @habilidade.update(habilidade_params)
        format.html { redirect_to @habilidade, notice: 'Habilidade was successfully updated.' }
        format.json { render :show, status: :ok, location: @habilidade }
      else
        format.html { render :edit }
        format.json { render json: @habilidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /habilidades/1
  # DELETE /habilidades/1.json
  def destroy
    @habilidade.destroy
    respond_to do |format|
      format.html { redirect_to habilidades_url, notice: 'Habilidade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_habilidade
      @habilidade = Habilidade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def habilidade_params
      params.require(:habilidade).permit(:nome, :disponibilidade, :descricao, :possuo_ferramenta, :valor, :categoria_id)
    end
end
