class GuidesController < ApplicationController
  before_action :set_guide, only: [:show, :edit, :update, :destroy]

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
    @guide = Guide.new(guide_params)

    respond_to do |format|
      if @guide.save
        format.html { redirect_to @guide, notice: 'Guide was successfully created.' }
        format.json { render action: 'show', status: :created, location: @guide }
      else
        format.html { render action: 'new' }
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
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @guide.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guides/1
  # DELETE /guides/1.json
  def destroy
    @guide.destroy
    respond_to do |format|
      format.html { redirect_to guides_url }
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
      params.require(:guide).permit(:Version, :TipoDTE, :Folio, :FchEmis, :TipoDespacho, :IndTraslado, :TpoImpresion, :FmaPago, :FmaPagExp, :FchCancel, :MntCancel, :SaldoInsol, :FchPago, :MntPago, :GlosaPagos, :TermPagoCdg, :TermPagoGlosa, :TermPagoDias, :RUTEmisor, :RznSoc, :GiroEmis, :Telefono, :CorreoEmisor, :Acteco, :CdgTraslado, :FolioAut, :FchAut, :Sucursal, :CdgSIISucur, :DirOrigen, :CmnaOrigen, :CiudadOrigen, :CdgVendedor, :IdAdicEmisor, :RUTMandante, :RUTRecep, :CdgIntRecep, :RznSocRecep, :NumId, :Nacionalidad, :GiroRecep, :Contacto, :CorreoRecep, :DirRecep, :CmnaRecep, :CiudadRecep, :DirPostal, :CmnaPostal, :CiudadPostal, :Patente, :RUTTrans, :RUTChofer, :NombreChofer, :DirDest, :CmnaDest, :CiudadDest, :CodModVenta, :CodClauVenta, :TotClauVenta, :CodViaTransp, :NombreTransp, :RUTCiaTransp, :NomCiaTransp, :IdAdicTransp, :Booking, :Operador, :CodPtoEmbarque, :IdAdicPtoEmb, :CodPtoDesemb, :IdAdicPtoDesemb, :Tara, :CodUnidMedTara, :CodUnidPesoBruto, :PesoBruto, :PesoNeto, :CodUnidPesoNeto, :TotItems, :TotBultos, :TipoBultos, :CodTpoBultos, :CantBultos, :Marcas, :IdContainer, :Sello, :EmisorSello, :MntFlete, :MntSeguro, :CodPaisRecep, :CodPaisDestin, :MntNeto, :MntExe, :MntBase, :MntMargenCom, :TasaIVA, :IVA, :IVAProp, :IVATerc, :TipoImp, :TasaImp, :MontoImp, :CredEC, :MntTotal, :MontoNF, :MontoPeriodo, :SaldoAnterior, :VlrPagar, :TpoMoneda, :TpoCambio, :MntNetoOtrMnda, :MntExeOtrMnda, :MntFaeCarneOtr, :Mnda, :MntMargComOtr, :Mnda, :IVAOtrMnda, :TipoImpOtrMnda, :TasaImpOtrMnda, :VlrImpOtrMnda, :MntTotOtrMnda, :NroSti, :integer, :GlosaSti, :text, :OrdenSti, :integer, :SubTotNetoSti, :float, :SubTotIVASti, :float, :SubTotAdicSti, :float, :SubTotExeSti, :float, :ValSubTotSti, :float, :LineasDeta, :integer, :NroLinDr, :TpoMov, :GlosaDr, :TpoValor, :ValorDr, :ValorDrOtrMnda, :IndExeDr, :NroLinRef, :TpoDocRef, :IndGlobal, :FolioRef, :FchRef, :CodRef, :RazonRef, :X509Certificate, :SignatureValue, :Tmstfirma)
    end
end
