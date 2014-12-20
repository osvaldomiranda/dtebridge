class DocumentosController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_documento, only: [:show, :edit, :update, :destroy]

  def index
    @documentos = Documento.order(created_at: :desc).paginate(:page => params[:page], :per_page => 15 )
  end

  def find
    if params[:empresa] == 'Lubba Regiones'
      rut = "77888630-8"  
    else
      rut = "77398570-7"      
    end

    sucursales = { "(Regiones) ARLEGUI 951, VINA DEL MAR" => 75047210,  
                   "(Regiones) INDEPENDENCIA 336, OVALLE" => 63635210,  
                   "(Regiones) ARTURO PRAT 665, LA SERENA" => 64409688,  
                   "(Regiones) DOMINGO CORREA 25, LA CISTERNA" => 74929736,  
                   "(Regiones) AV. JOSE MIGUEL CARRERA 8158, LA CISTERNA" => 74929741,  
                   "(Stgo) MONUMENTO 1963, MAIPU" => 41272801,  
                   "(Stgo) AV JOSE MIGUEL CARRERA 8158, LA CISTERNA" => 74878389,  
                   "(Stgo) DOMINGO CORREA 25, LA CISTERNA" => 74878390,
                   "(Stgo) 5 DE ABRIL 412-A,  MAIPU" => 78139472  
                  }


    suc = sucursales[params[:sucursal]]

    if params[:sucursal]==""
      if params[:Folio]== ""
        @documentos = Documento.where(RUTEmisor: rut).order(created_at: :desc).paginate(:page => params[:page], :per_page => 15 )
      else  
        @documentos = Documento.where(Folio: params[:Folio]).paginate(:page => params[:page], :per_page => 15 )
      end
    else
      if params[:Folio]== ""
        @documentos = Documento.where(CdgSIISucur: suc).order(created_at: :desc).paginate(:page => params[:page], :per_page => 15 )       
      else  
        @documentos = Documento.where(Folio: params[:Folio]).paginate(:page => params[:page], :per_page => 15 )
      end
    end

    if params[:empresa] == "" && params[:sucursal]==""
      @documentos = Documento.order(created_at: :desc).paginate(:page => params[:page], :per_page => 15 )
    end

    respond_to do |format|
      format.html { render action: 'index' }
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
