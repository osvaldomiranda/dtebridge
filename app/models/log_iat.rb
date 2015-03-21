class LogIat < ActiveRecord::Base

  def empresa
    Empresa.find_by_rut(self.rut).rznsocial
  end

  def nomsucursal
    sucursal = Sucursal.find_by_cdgsiisucur(self.sucursal) 
    if sucursal.nil?
      nomsucursal = ""
    else
      nomsucursal = sucursal.nombre
    end  
    return nomsucursal
  end

end
