class EmprestimoFerramentasController < ApplicationController
  before_action :verify_user_login
  before_action :set_emprestimo_ferramenta, only: [:show, :edit, :update, :destroy]

  # GET /emprestimo_ferramentas
  # GET /emprestimo_ferramentas.json
  def index
    @emprestimo_ferramentas = EmprestimoFerramenta.all
  end

  # GET /emprestimo_ferramentas/1
  # GET /emprestimo_ferramentas/1.json
  def show
  end

  # GET /emprestimo_ferramentas/new
  def new
    @emprestimo_ferramenta = EmprestimoFerramenta.new
    @ferramentas = Ferramenta.all.reject{|e| e.usuario_id == logged_user.id}
  end

  # GET /emprestimo_ferramentas/1/edit
  def edit
  end

  # POST /emprestimo_ferramentas
  # POST /emprestimo_ferramentas.json
  def create
    @emprestimo_ferramenta = EmprestimoFerramenta.new(emprestimo_ferramenta_params)
    @emprestimo_ferramenta.usuario_id = logged_user.id
    respond_to do |format|
      if @emprestimo_ferramenta.save
        format.html { redirect_to @emprestimo_ferramenta, notice: 'Emprestimo ferramenta was successfully created.' }
        format.json { render :show, status: :created, location: @emprestimo_ferramenta }
      else
        format.html { render :new }
        format.json { render json: @emprestimo_ferramenta.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /emprestimo_ferramentas/1
  # PATCH/PUT /emprestimo_ferramentas/1.json
  def update
    respond_to do |format|
      if @emprestimo_ferramenta.update(emprestimo_ferramenta_params)
        format.html { redirect_to @emprestimo_ferramenta, notice: 'Emprestimo ferramenta was successfully updated.' }
        format.json { render :show, status: :ok, location: @emprestimo_ferramenta }
      else
        format.html { render :edit }
        format.json { render json: @emprestimo_ferramenta.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /emprestimo_ferramentas/1
  # DELETE /emprestimo_ferramentas/1.json
  def destroy
    @emprestimo_ferramenta.destroy
    respond_to do |format|
      format.html { redirect_to emprestimo_ferramentas_url, notice: 'Emprestimo ferramenta was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emprestimo_ferramenta
      @emprestimo_ferramenta = EmprestimoFerramenta.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def emprestimo_ferramenta_params
      params.require(:emprestimo_ferramenta).permit(:ferramenta_id)
    end
end
