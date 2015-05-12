class Docmanual < ActiveRecord::Base
  require 'csv'

  has_many :otrosimpmanuals, dependent: :destroy

  attr_reader :nombre_doc
  def nombre_doc
    tipo = Tipodte.where(tipo: self.tipodoc).first 
    return (tipo.nil? ? self.tipodoc : tipo.nombre)
  end

  def self.import(file)
    CSV.foreach(file.path, col_sep: ';', headers: true) do |row|
      rowHash = row.to_hash

      doc = Docmanual.new(rowHash)


      if doc.rutrecep.index('-').nil?  
        doc.rutrecep = doc.rutrecep.insert(8, '-') 
      end  
      if doc.tipodoc == 1
        doc.tipodoc = 30
      end
      if doc.tipodoc == 7
        doc.tipodoc = 35
      end  
      doc.save

      impto10 = rowHash["impto10"].to_f
      impto18 = rowHash["impto18"].to_f
      impto25 = rowHash["impto25"].to_f
      impto30 = rowHash["impto30"].to_f

      if impto10>0
        imptoH = Hash.new 
        imptoH["TipoImp"] = 10   
        imptoH["TasaImp"] = 10 
        imptoH["MontoImp"] = impto10 
        imptoH["docmanual_id"] = doc.id
        Otrosimpmanual.create! imptoH
      end  
      if impto18>0
        imptoH = Hash.new 
        imptoH["TipoImp"] = 18   
        imptoH["TasaImp"] = 18 
        imptoH["MontoImp"] =impto18 
        imptoH["docmanual_id"] =doc.id
        Otrosimpmanual.create! imptoH
      end  
      if impto25>0
        imptoH = Hash.new 
        imptoH["TipoImp"] = 25   
        imptoH["TasaImp"] = 25 
        imptoH["MontoImp"] = impto25 
        imptoH["docmanual_id"] = doc.id
        Otrosimpmanual.create! imptoH
      end  
      if impto30>0
        imptoH = Hash.new 
        imptoH["TipoImp"] = 30   
        imptoH["TasaImp"] = 30 
        imptoH["MontoImp"] = impto30 
        imptoH["docmanual_id"] = doc.id
        Otrosimpmanual.create! imptoH
      end  
      doc.otrosimpto = impto10 + impto18 + impto25 + impto30
      doc.save
    end
  end
end
