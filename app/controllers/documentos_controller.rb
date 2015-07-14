class DocumentosController < ApplicationController
  before_filter :authenticate_user!

  def index
    @documentos = Documento.order(created_at: :desc).paginate(:page => params[:page], :per_page => 15 )
    @empresas = Empresa.all
    @sucursales = Sucursal.all

    respond_to do |format|
      format.html { render action: 'index' }
      format.xls { send_data @documentos.to_csv(col_sep: "\t") }
    end
  end

  def find
    @empresas = Empresa.all
    @sucursales = Sucursal.all

    empresa = Empresa.find_by_rznsocial(params[:empresa]) || Empresa.last
    rut = empresa.rut

    sucursal = Sucursal.find_by_nombre(params[:sucursal]) || Sucursal.last
    suc = sucursal.cdgsiisucur

    if params[:sucursal]==""
      if params[:Folio]== ""
        @documentos = Documento.where(RUTEmisor: rut).order(created_at: :desc).paginate(:page => params[:page], :per_page => 2000 )
      else  
        @documentos = Documento.where(Folio: params[:Folio]).paginate(:page => params[:page], :per_page => 2000 )
      end
    else
      if params[:Folio]== ""
        @documentos = Documento.where(CdgSIISucur: suc).order(created_at: :desc).paginate(:page => params[:page], :per_page => 2000)       
      else  
        @documentos = Documento.where(Folio: params[:Folio]).paginate(:page => params[:page], :per_page => 2000 )
      end
    end

    if params[:empresa] == "" && params[:sucursal]=="" && params[:Folio]=="" 
      respond_to do |format|
        format.html { redirect_to "/documentos" }
        format.xls { send_data @documentos.to_csv(col_sep: "\t") }
      end
    else
      respond_to do |format|
        format.html { render action: 'index' }
        format.xls { send_data @documentos.to_csv(col_sep: "\t") }
      end
    end  
  end


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
      params.require(:documento).permit(:fileEnvio, :pdft, :pdfs, :TipoDTE, :Folio, :FchEmis, :IndNoRebaja, :TipoDespacho, :IndTraslado, :TpoImpresion, :IndServicio, :MntBruto, :FmaPago, :FchVenc, :RUTEmisor, :RznSoc, :GiroEmis, :Telefono, :CorreoEmisor, :Acteco, :CdgTraslado, :FolioAut, :FchAut, :Sucursal, :CdgSIISucur, :CodAdicSucur, :DirOrigen, :CmnaOrigen, :CiudadOrigen, :CdgVendedor, :IdAdicEmisor, :RUTMandante, :RUTRecep, :CdgIntRecep, :RznSocRecep, :NumId, :Nacionalidad, :IdAdicRecep, :GiroRecep, :Contacto, :CorreoRecep, :DirRecep, :CmnaRecep, :CiudadRecep, :DirPostal, :CmnaPostal, :CiudadPostal, :RUTSolicita, :Patente, :RUTTrans, :RUTChofer, :NombreChofer, :DirDest, :CmnaDest, :CiudadDest, :CodModVenta, :CodClauVenta, :TotClauVenta, :CodViaTransp, :NombreTransp, :RUTCiaTransp, :NomCiaTransp, :IdAdicTransp, :Booking, :Operador, :CodPtoEmbarque, :IdAdicPtoEmb, :CodPtoDesemb, :IdAdicPtoDesemb, :Tara, :CodUnidMedTara, :PesoBruto, :CodUnidPesoBruto, :PesoNeto, :CodUnidPesoNeto, :TotItems, :TotBultos, :TpoMoneda, :MntNeto, :MntExe, :MntBase, :MntMargenCom, :TasaIVA, :IVA, :IVAProp, :IVATerc, :IVANoRet, :CredEC, :GrntDep, :ValComNeto, :ValComExe, :ValComIVA, :MntTotal, :MontoNF)
    end
end
