class LibroVentaController < ApplicationController
  def index
    @documentos = Documento.select('"TipoDTE", sum("MntNeto") as MntNeto,sum("MntExe") as MntExe, sum("IVA") as IVA, sum("MntTotal") as MntTotal ').group('"TipoDTE"') 
    @otrosImps = ImpuestoReten.select('"TipoImp", "TasaImp", sum("MontoImp") as MontoImp').group('"TipoImp","TasaImp"')
    puts "****************"
    puts @documentos.first.mntneto
    puts @documentos.first.mnttotal
    puts "****************"  
  end
end
