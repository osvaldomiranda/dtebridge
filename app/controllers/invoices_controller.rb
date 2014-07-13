class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  # GET /invoices
  # GET /invoices.json
  def index
    @invoices = Invoice.search(params[:search]).paginate(:per_page => 4, :page => params[:page])
  end

  def search
    @search = Invoice.search(params[:search])
    @invoices = @search.all   # or @search.relation to lazy load in view
  end

  # GET /invoices/1
  # GET /invoices/1.json
  def show
  end

  # GET /invoices/new
  def new
    @invoice = Invoice.new
  end

  # GET /invoices/1/edit
  def edit
  end

  # POST /invoices
  # POST /invoices.json
  def create
    @invoice = Invoice.new(invoice_params)

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render action: 'show', status: :created, location: @invoice }
      else
        format.html { render action: 'new' }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /invoices/1
  # PATCH/PUT /invoices/1.json
  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /invoices/1
  # DELETE /invoices/1.json
  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invoice_params
      params.require(:invoice).permit(:Version, :TipoDte, :Folio, :FchEmis, :TipoDespacho, :IndServicio, :MntBruto, :FmaPago, :FchCancel, :MntCancel, :SaldoInsol, :FchPago, :MntPago, :GlosaPagos, :PeriodoDesde, :PeriodoHasta, :MedioPago, :TipoCtaPAgo, :NumCtaPago, :BcoPago, :TermPagoCdg, :TermPAgoGlosa, :TermPagoDias, :FchVenc, :RUTEmisor, :RznSoc, :GiroEmis, :Telefono, :CorreoEmisor, :Acteco, :Sucursal, :CdgSIISucur, :DirOrigen, :CmnaOrigen, :CiudadOrigen, :CdgVendedor, :RutMandante, :RUTReceptor, :CdgIntRecep, :RznSocRecep, :NumId, :Nacionalidad, :GiroRecep, :Contacto, :CorreoRecep, :DirRecep, :CmnaRecep, :CiudadRecep, :DirPostal, :CmnaPostal, :CiudadPostal, :RUTSolicita, :Patente, :RUTTRans, :RUTChofer, :NombreChofer, :DirDest, :CmnaDest, :CiudadDest, :MntNeto, :MntExe, :MntBase, :MntMargenCom, :TasaIVA, :IVA, :IVAProp, :IVATerc, :TipoImp, :TasaImp, :MontoImp, :CredEC, :GmtDep, :MntTotal, :MontoNF, :MontoPeriodo, :SaldoAnterior, :VlrPagar, :TpoMoneda, :TpoCambio, :MntNetoOtrMnda, :MntExeOtrMnda, :MntFaeCarneOtrMnda, :MntMargComOtrMnda, :IVAOtrMnda, :TipoImpOtrMnda, :TasaImpOtrMnda, :VlrImpOtrMnda, :MntTotOtrMnda, :NroSti, :integer, :GlosaSti, :text, :OrdenSti, :integer, :SubTotNetoSti, :float, :SubTotIVASti, :float, :SubTotAdicSti, :float, :SubTotExeSti, :float, :ValSubTotSti, :float, :LineasDeta, :integer, :NroLinDr, :TpoMov, :GlosaDr, :TpoValor, :ValorDr, :ValorDrOtrMnda, :IndExeDr, :NroLinRef, :TpoDocRef, :IndGlobal, :FolioRef, :FchRef, :CodRef, :RazonRef, :X509Certificate, :SignatureValue, :Tmstfirma)
    end
end
