class Compmanual < ActiveRecord::Base
  require 'csv'

  has_many :otrosimpcompmanuals, dependent: :destroy

  def nomtipo
    Tipodte.find_by_tipo(self.tipodoc).nombre
  end

  def self.import(file)
    # spreadsheet = open_spreadsheet(file)
    # header = spreadsheet.row(1)
    # (2..spreadsheet.last_row).each do |i|

    CSV.foreach(file.path, col_sep: ';', headers: true) do |row|

    rowHash = row.to_hash    
    # if ! rowHash.valid_encoding?
    #   rowHash = row.encode("UTF-16be", :invalid=>:replace, :replace=>"?").encode('UTF-8')
    # end

      # rowHash = Hash[[header, spreadsheet.row(i)].transpose]

      doc = Compmanual.new(rowHash)

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
        imptoH["compmanual_id"] = doc.id
        Otrosimpcompmanual.create! imptoH
      end  
      if impto18>0
        imptoH = Hash.new 
        imptoH["TipoImp"] = 18   
        imptoH["TasaImp"] = 18 
        imptoH["MontoImp"] =impto18 
        imptoH["compmanual_id"] =doc.id
        Otrosimpcompmanual.create! imptoH
      end  
      if impto25>0
        imptoH = Hash.new 
        imptoH["TipoImp"] = 25   
        imptoH["TasaImp"] = 25 
        imptoH["MontoImp"] = impto25 
        imptoH["compmanual_id"] = doc.id
        Otrosimpcompmanual.create! imptoH
      end  
      if impto30>0
        imptoH = Hash.new 
        imptoH["TipoImp"] = 30   
        imptoH["TasaImp"] = 30 
        imptoH["MontoImp"] = impto30 
        imptoH["compmanual_id"] = doc.id
        Otrosimpcompmanual.create! imptoH
      end  
      doc.otrosimpto = impto10 + impto18 + impto25 + impto30
      doc.save
    end
  end

  def self.open_spreadsheet(file)

    # puts "*******************"
    # puts file.original_filename
    # puts "*******************"

    # case File.extname(file.original_filename)
    # when '.csv' then Csv.new(file.path, nil, :ignore)
    # when '.xls' then Roo::Excel.new(file.path)
    # when '.xlsx' then Roo::Excelx.new(file.path)
    # else raise "Unknown file type: #{file.original_filename}"
    # end
  end

end
