class LibroVentaController < ApplicationController
  def index
    @documentos = Documento.select('"TipoDTE", sum("MntNeto") as mntneto,sum("MntExe") as mntexe, sum("IVA") as iva, sum("MntTotal") as mnttotal ').group('"TipoDTE"') 
    @otrosImps = ImpuestoReten.select('"TipoImp" as tipoimp, "TasaImp" as tasaimp, sum("MontoImp") as montoimp').group('"TipoImp","TasaImp"')
  end
end
