class DocumentosController < ApplicationController
  before_action :set_documento, only: [:show, :edit, :update, :destroy]

  # GET /documentos
  # GET /documentos.json
  def index
    @documentos = Documento.all
  end

  # GET /documentos/1
  # GET /documentos/1.json
  def show
  end

  # GET /documentos/new
  def new
    @documento = Documento.new
  end

  # GET /documentos/1/edit
  def edit
  end

  # POST /documentos
  # POST /documentos.json
  def create
    @documento = Documento.new(documento_params)

    respond_to do |format|
      if @documento.save
        format.html { redirect_to @documento, notice: 'Documento was successfully created.' }
        format.json { render action: 'show', status: :created, location: @documento }
      else
        format.html { render action: 'new' }
        format.json { render json: @documento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documentos/1
  # PATCH/PUT /documentos/1.json
  def update
    respond_to do |format|
      if @documento.update(documento_params)
        format.html { redirect_to @documento, notice: 'Documento was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @documento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documentos/1
  # DELETE /documentos/1.json
  def destroy
    @documento.destroy
    respond_to do |format|
      format.html { redirect_to documentos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_documento
      @documento = Documento.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def documento_params
      params.require(:documento).permit(:TipoDTE, :integer, :Folio, :integer, :FchEmis, :string, :IndNoRebaja, :integer, :TipoDespacho, :integer, :IndTraslado, :integer, :TpoImpresion, :string, :IndServicio, :integer, :MntBruto, :integer, :FmaPago, :integer, :FchVenc, :string, :RUTEmisor, :string, :RznSoc, :string, :GiroEmis, :string, :Telefono, :string, :CorreoEmisor, :string, :Acteco, :integer, :CdgTraslado, :integer, :FolioAut, :integer, :FchAut, :string, :Sucursal, :string, :CdgSIISucur, :integer, :CodAdicSucur, :string, :DirOrigen, :string, :CmnaOrigen, :string, :CiudadOrigen, :string, :CdgVendedor, :integer, :IdAdicEmisor, :string, :RUTMandante, :string, :RUTRecep, :string, :CdgIntRecep, :string, :RznSocRecep, :string, :NumId, :string, :Nacionalidad, :string, :IdAdicRecep, :string, :GiroRecep, :string, :Contacto, :string, :CorreoRecep, :string, :DirRecep, :string, :CmnaRecep, :string, :CiudadRecep, :string, :DirPostal, :string, :CmnaPostal, :string, :CiudadPostal, :string, :RUTSolicita, :string, :Patente, :string, :RUTTrans, :string, :RUTChofer, :string, :NombreChofer, :string, :DirDest, :string, :CmnaDest, :string, :CiudadDest, :string, :CodModVenta, :integer, :CodClauVenta, :integer, :TotClauVenta, :integer, :CodViaTransp, :integer, :NombreTransp, :string, :RUTCiaTransp, :string, :NomCiaTransp, :string, :IdAdicTransp, :string, :Booking, :string, :Operador, :string, :CodPtoEmbarque, :integer, :IdAdicPtoEmb, :string, :CodPtoDesemb, :string, :IdAdicPtoDesemb, :string, :Tara, :integer, :CodUnidMedTara, :integer, :PesoBruto, :integer, :CodUnidPesoBruto, :integer, :PesoNeto, :integer, :CodUnidPesoNeto, :integer, :TotItems, :integer, :TotBultos, :integer, :TpoMoneda, :string, :MntNeto, :integer, :MntExe, :integer, :MntBase, :integer, :MntMargenCom, :integer, :TasaIVA, :float, :IVA, :integer, :IVAProp, :integer, :IVATerc, :integer, :IVANoRet, :integer, :CredEC, :integer, :GrntDep, :integer, :ValComNeto, :integer, :ValComExe, :integer, :ValComIVA, :integer, :MntTotal, :integer, :MontoNF, :integer)
    end
end
