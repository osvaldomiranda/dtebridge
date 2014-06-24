class CreditnotesController < ApplicationController
  before_action :set_creditnote, only: [:show, :edit, :update, :destroy]

  # GET /creditnotes
  # GET /creditnotes.json
  def index
    @creditnotes = Creditnote.all
  end

  # GET /creditnotes/1
  # GET /creditnotes/1.json
  def show
  end

  # GET /creditnotes/new
  def new
    @creditnote = Creditnote.new
  end

  # GET /creditnotes/1/edit
  def edit
  end

  # POST /creditnotes
  # POST /creditnotes.json
  def create
    @creditnote = Creditnote.new(creditnote_params)

    respond_to do |format|
      if @creditnote.save
        format.html { redirect_to @creditnote, notice: 'Creditnote was successfully created.' }
        format.json { render action: 'show', status: :created, location: @creditnote }
      else
        format.html { render action: 'new' }
        format.json { render json: @creditnote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /creditnotes/1
  # PATCH/PUT /creditnotes/1.json
  def update
    respond_to do |format|
      if @creditnote.update(creditnote_params)
        format.html { redirect_to @creditnote, notice: 'Creditnote was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @creditnote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /creditnotes/1
  # DELETE /creditnotes/1.json
  def destroy
    @creditnote.destroy
    respond_to do |format|
      format.html { redirect_to creditnotes_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_creditnote
      @creditnote = Creditnote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def creditnote_params
      params.require(:creditnote).permit(:Version, :TipoDTE, :Folio, :FchEmis, :IndNoRebaja, :IndServicio, :MntBruto, :FmaPago, :FchCancel, :MntCancel, :SaldoInsol, :FchPago, :MntPago, :GlosaPagos, :PeriodoDesde, :PeriodoHasta, :MedioPago, :TipoCtaPago, :NumCtaPago, :BcoPago, :TermPagoCdg, :TermPagoGlosa, :TermPagoDias, :FchVenc, :RUTEmisor, :RznSoc, :GiroEmis, :Telefono, :CorreoEmisor, :Acteco, :Sucursal, :CdgSIISucur, :DirOrigen, :CmnaOrigen, :CiudadOrigen, :CdgVendedor, :RUTMandante, :RUTRecep, :CdgIntRecep, :RznSocRecep, :NumId, :Nacionalidad, :GiroRecep, :Contacto, :CorreoRecep, :DirRecep, :CmnaRecep, :CiudadRecep, :DirPostal, :CmnaPostal, :CiudadPostal, :RUTSolicita, :RUTChofer, :NombreChofer, :DirDest, :CmnaDest, :CiudadDest, :MntNeto, :MntExe, :MntBase, :MntMargenCom, :TasaIVA, :IVA, :IVAProp, :IVATerc, :TipoImp, :TasaImp, :MontoImp, :IVANoRet, :CredEC, :GrntDep, :ValComNeto, :ValComExe, :ValComIVA, :MntTotal, :MontoNF, :MontoPeriodo, :SaldoAnterior, :VlrPagar, :TpoMoneda, :TpoCambio, :MntNetoOtrMnda, :MntExeOtrMnda, :MntFaeCarneOtrMnda, :MntMargComOtrMnda, :IVAOtrMnda, :TipoImpOtrMnda, :TasaImpOtrMnda, :VlrImpOtrMnda, :IVANoRetOtrMnda, :MntTotOtrMnda, :NroSti, :GlosaSti, :OrdenSti, :SubTotNetoSti, :SubTotIVASti, :SubTotAdicSti, :SubTotExeSti, :ValSubTotSti, :LineasDeta, :NroLinDr, :TpoMov, :GlosaDr, :TpoValor, :ValorDr, :ValorDrOtrMnda, :IndExeDr, :NroLinRef, :TpoDocRef, :IndGlobal, :FolioRef, :RUTOtr, :FchRef, :CodRef, :RazonRef, :NroLinCom, :TipoMovim, :Glosa, :TasaComision, :ValComNeto, :ValComExe, :ValComIVA, :X509Certificate, :SignatureValue, :Tmstfirma)
    end
end
