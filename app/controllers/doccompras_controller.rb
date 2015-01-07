class DoccomprasController < ApplicationController
  before_action :set_doccompra, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @doccompras = Doccompra.where(estado: nil)
  end

  # def show
  #   respond_with(@doccompra)
  # end

  # def new
  #   @doccompra = Doccompra.new
  #   respond_with(@doccompra)
  # end

  # def edit
  # end

  # def create
  #   @doccompra = Doccompra.new(doccompra_params)
  #   @doccompra.save
  #   respond_with(@doccompra)
  # end

  # def update
  #   @doccompra.update(doccompra_params)
  #   respond_with(@doccompra)
  # end

  # def destroy
  #   @doccompra.destroy
  #   respond_with(@doccompra)
  # end

  def rechazar
    d = Doccompra.find(params[:id])
    d.estado = "RECHAZADO"
    d.save

    @doccompras = Doccompra.where(estado: nil)
    respond_to do |format|
        format.html { render action: 'index'}
    end    
  end

  def aprobar
    d = Doccompra.find(params[:id])
    d.estado = "APROBADO"
    d.save

    @doccompras = Doccompra.where(estado: nil)
    respond_to do |format|
        format.html { render action: 'index'}
    end  
  end  


  private
    def set_doccompra
      @doccompra = Doccompra.find(params[:id])
    end

    def doccompra_params
      params.require(:doccompra).permit(:TipoDTE, :Folio, :FchEmis, :IndNoRebaja, :TipoDespacho, :IndTraslado, :TpoImpresion, :IndServicio, :MntBruto, :FmaPago, :FchVenc, :RUTEmisor, :RznSoc, :GiroEmis, :Telefono, :CorreoEmisor, :Acteco, :CdgTraslado, :FolioAut, :FchAut, :Sucursal, :CdgSIISucur, :CodAdicSucur, :DirOrigen, :CmnaOrigen, :CiudadOrigen, :CdgVendedor, :IdAdicEmisor, :RUTMandante, :RUTRecep, :CdgIntRecep, :RznSocRecep, :NumId, :Nacionalidad, :IdAdicRecep, :GiroRecep, :Contacto, :CorreoRecep, :DirRecep, :CmnaRecep, :CiudadRecep, :DirPostal, :CmnaPostal, :CiudadPostal, :RUTSolicita, :Patente, :RUTTrans, :RUTChofer, :NombreChofer, :DirDest, :CmnaDest, :CiudadDest, :CodModVenta, :CodClauVenta, :TotClauVenta, :CodViaTransp, :NombreTransp, :RUTCiaTransp, :NomCiaTransp, :IdAdicTransp, :Booking, :Operador, :CodPtoEmbarque, :IdAdicPtoEmb, :CodPtoDesemb, :IdAdicPtoDesemb, :Tara, :CodUnidMedTara, :PesoBruto, :CodUnidPesoBruto, :PesoNeto, :CodUnidPesoNeto, :TotItems, :TotBultos, :TpoMoneda, :MntNeto, :MntExe, :MntBase, :MntMargenCom, :TasaIVA, :IVA, :IVAProp, :IVATerc, :IVANoRet, :CredEC, :GrntDep, :ValComNeto, :ValComExe, :ValComIVA, :MntTotal, :MontoNF, :xmlrecibido, :estado)
    end
end
