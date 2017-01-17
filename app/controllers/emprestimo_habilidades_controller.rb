class EmprestimoHabilidadesController < ApplicationController
  before_action :verify_user_login
  before_action :set_emprestimo_habilidade, only: [:show, :edit, :update, :destroy]

  # GET /emprestimo_habilidades
  # GET /emprestimo_habilidades.json
  def index
    @emprestimo_habilidades = EmprestimoHabilidade.all
  end

  # GET /emprestimo_habilidades/1
  # GET /emprestimo_habilidades/1.json
  def show
  end

  # GET /emprestimo_habilidades/new
  def new
    @emprestimo_habilidade = EmprestimoHabilidade.new
    @habilidades = Habilidade.all.reject{|h| h.usuario_id == logged_user.id}
  end

  # GET /emprestimo_habilidades/1/edit
  def edit
  end

  # POST /emprestimo_habilidades
  # POST /emprestimo_habilidades.json
  def create
    @emprestimo_habilidade = EmprestimoHabilidade.new(emprestimo_habilidade_params)
    @emprestimo_habilidade.usuario_id = logged_user.id
    respond_to do |format|
      if @emprestimo_habilidade.save
        format.html { redirect_to @emprestimo_habilidade, notice: 'Emprestimo habilidade was successfully created.' }
        format.json { render :show, status: :created, location: @emprestimo_habilidade }
      else
        format.html { render :new }
        format.json { render json: @emprestimo_habilidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emprestimo_habilidades/1
  # PATCH/PUT /emprestimo_habilidades/1.json
  def update
    respond_to do |format|
      if @emprestimo_habilidade.update(emprestimo_habilidade_params)
        format.html { redirect_to @emprestimo_habilidade, notice: 'Emprestimo habilidade was successfully updated.' }
        format.json { render :show, status: :ok, location: @emprestimo_habilidade }
      else
        format.html { render :edit }
        format.json { render json: @emprestimo_habilidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emprestimo_habilidades/1
  # DELETE /emprestimo_habilidades/1.json
  def destroy
    @emprestimo_habilidade.destroy
    respond_to do |format|
      format.html { redirect_to emprestimo_habilidades_url, notice: 'Emprestimo habilidade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emprestimo_habilidade
      @emprestimo_habilidade = EmprestimoHabilidade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def emprestimo_habilidade_params
      params.require(:emprestimo_habilidade).permit(:habilidade_id)
    end
end
