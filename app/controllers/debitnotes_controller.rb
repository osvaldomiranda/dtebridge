class DebitnotesController < ApplicationController
  before_action :set_debitnote, only: [:show, :edit, :update, :destroy]

  # GET /debitnotes
  # GET /debitnotes.json
  def index
    @debitnotes = Debitnote.all
  end

  # GET /debitnotes/1
  # GET /debitnotes/1.json
  def show
  end

  # GET /debitnotes/new
  def new
    @debitnote = Debitnote.new
  end

  # GET /debitnotes/1/edit
  def edit
  end

  # POST /debitnotes
  # POST /debitnotes.json
  def create
    @debitnote = Debitnote.new(debitnote_params)

    respond_to do |format|
      if @debitnote.save
        format.html { redirect_to @debitnote, notice: 'Debitnote was successfully created.' }
        format.json { render action: 'show', status: :created, location: @debitnote }
      else
        format.html { render action: 'new' }
        format.json { render json: @debitnote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /debitnotes/1
  # PATCH/PUT /debitnotes/1.json
  def update
    respond_to do |format|
      if @debitnote.update(debitnote_params)
        format.html { redirect_to @debitnote, notice: 'Debitnote was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @debitnote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /debitnotes/1
  # DELETE /debitnotes/1.json
  def destroy
    @debitnote.destroy
    respond_to do |format|
      format.html { redirect_to debitnotes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_debitnote
      @debitnote = Debitnote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def debitnote_params
      params.require(:debitnote).permit(:Version, :TipoDTE, :Folio, :FchEmis, :IndServicio, :MntBruto, :FmaPago, :FchCancel, :MntCancel, :SaldoInsol, :FchPago, :MntPago, :GlosaPagos, :PeriodoDesde, :PeriodoHasta, :MedioPago, :TipoCtaPago, :NumCtaPago, :BcoPago, :TermPagoCdg, :TermPagoGlosa, :TermPagoDias, :FchVenc, :RUTEmisor, :RznSoc, :GiroEmis, :Telefono, :CorreoEmisor, :Acteco, :Sucursal, :CdgSIISucur, :DirOrigen, :CmnaOrigen, :CiudadOrigen, :CdgVendedor, :RUTMandante, :RUTRecep, :CdgIntRecep, :RznSocRecep, :NumId, :Nacionalidad, :GiroRecep, :Contacto, :CorreoRecep, :DirRecep, :CmnaRecep, :CiudadRecep, :DirPostal, :CmnaPostal, :CiudadPostal, :RUTSolicita, :RUTChofer, :NombreChofer, :DirDest, :CmnaDest, :CiudadDest, :MntNeto, :MntExe, :MntBase, :MntMargenCom, :TasaIVA, :IVA, :IVAProp, :IVATerc, :TipoImp, :TasaImp, :MontoImp, :IVANoRet, :CredEC, :GrntDep, :ValComNeto, :ValComExe, :ValComIVA, :MntTotal, :MontoNF, :MontoPeriodo, :SaldoAnterior, :VlrPagar, :TpoMoneda, :TpoCambio, :MntNetoOtrMnda, :MntExeOtrMnda, :MntFaeCarneOtrMnda, :MntMargComOtrMnda, :IVAOtrMnda, :ImpRetOtrMnda, :TipoImpOtrMnda, :TasaImpOtrMnda, :VlrImpOtrMnda, :IVANoRetOtrMnda, :MntTotOtrMnda, :NroSti, :GlosaSti, :OrdenSti, :SubTotNetoSti, :SubTotIVASti, :SubTotAdicSti, :SubTotExeSti, :ValSubTotSti, :LineasDeta, :NroLinDr, :TpoMov, :GlosaDr, :TpoValor, :ValorDr, :ValorDrOtrMnda, :IndExeDr, :NroLinRef, :TpoDocRef, :IndGlobal, :FolioRef, :RUTOtr, :FchRef, :CodRef, :RazonRef, :NroLinCom, :TipoMovim, :Glosa, :TasaComision, :ValComNeto, :ValComExe, :ValComIVA, :X509Certificate, :SignatureValue, :Tmstfirma)
    end
end
