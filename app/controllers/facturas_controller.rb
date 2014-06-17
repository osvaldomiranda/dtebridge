class FacturasController < ApplicationController
  before_action :set_factura, only: [:show, :edit, :update, :destroy]

  # GET /facturas
  # GET /facturas.json
  def index
    @facturas = Factura.all
  end

  # GET /facturas/1
  # GET /facturas/1.json
  def show
  end

  # GET /facturas/new
  def new
    @factura = Factura.new
  end

  # GET /facturas/1/edit
  def edit
  end

  # POST /facturas
  # POST /facturas.json
  def create
    @factura = Factura.new(factura_params)

    respond_to do |format|
      if @factura.save
        format.html { redirect_to @factura, notice: 'Factura was successfully created.' }
        format.json { render action: 'show', status: :created, location: @factura }
      else
        format.html { render action: 'new' }
        format.json { render json: @factura.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /facturas/1
  # PATCH/PUT /facturas/1.json
  def update
    respond_to do |format|
      if @factura.update(factura_params)
        format.html { redirect_to @factura, notice: 'Factura was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @factura.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facturas/1
  # DELETE /facturas/1.json
  def destroy
    @factura.destroy
    respond_to do |format|
      format.html { redirect_to facturas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_factura
      @factura = Factura.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def factura_params
      params.require(:factura).permit(:Version, :TipoDte, :Folio, :FchEmis, :TipoDespacho, :IndServicio, :MntBruto, :FmaPago, :FchCancel, :MntCancel, :SaldoInsol, :FchPago, :MntPago, :GlosaPagos, :PeriodoDesde, :PeriodoHasta, :MedioPago, :TipoCtaPAgo, :NumCtaPago, :BcoPago, :TermPagoCdg, :TermPAgoGlosa, :TermPagoDias, :FchVenc, :RUTEmisor, :RznSoc, :GiroEmis, :Telefono, :CorreoEmisor, :Acteco, :Sucursal, :CdgSIISucur, :DirOrigen, :CmnaOrigen, :CiudadOrigen, :CdgVendedor, :RutMandante, :RUTReceptor, :CdgIntRecep, :RznSocRecep, :NumId, :Nacionalidad, :GiroRecep, :Contacto, :CorreoRecep, :DirRecep, :CmnaRecep, :CiudadRecep, :DirPostal, :CmnaPostal, :CiudadPostal, :RUTSolicita, :Patente, :RUTTRans, :RUTChofer, :NombreChofer, :DirDest, :CmnaDest, :CiudadDest, :MntNeto, :MntExe, :MntBase, :MntMargenCom, :TasaIVA, :IVA, :IVAProp, :IVATerc, :TipoImp, :TasaImp, :MontoImp, :CredEC, :GmtDep, :MntTotal, :MontoNF, :MontoPeriodo, :SaldoAnterior, :VlrPagar, :TpoMoneda, :TpoCambio, :MntNetoOtrMnda, :MntExeOtrMnda, :MntFaeCarneOtrMnda, :MntMargComOtrMnda, :IVAOtrMnda, :TipoImpOtrMnda, :TasaImpOtrMnda, :VlrImpOtrMnda, :MntTotOtrMnda, :NroSti, :integer, :GlosaSti, :text, :OrdenSti, :integer, :SubTotNetoSti, :float, :SubTotIVASti, :float, :SubTotAdicSti, :float, :SubTotExeSti, :float, :ValSubTotSti, :float, :LineasDeta, :integer, :NroLinDr, :TpoMov, :GlosaDr, :TpoValor, :ValorDr, :ValorDrOtrMnda, :IndExeDr, :NroLinRef, :TpoDocRef, :IndGlobal, :FolioRef, :FchRef, :CodRef, :RazonRef, :X509Certificate, :SignatureValue, :Tmstfirma)
    end
end
