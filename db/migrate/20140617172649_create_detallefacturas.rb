class CreateDetallefacturas < ActiveRecord::Migration
  def change
    create_table :detallefacturas do |t|
      t.integer :NroLinDet
      t.string :TipoCodigo
      t.string :VlrCodigo
      t.integer :IndExe
      t.string :IndAgente
      t.integer :MntBaseFaena
      t.integer :MntMargComer
      t.integer :PrcConsFinal
      t.string :NmbItem
      t.string :DscItem
      t.float :QtyRef
      t.string :UnmdRef
      t.integer :PrcRef
      t.float :QtyItem
      t.float :SubQty
      t.date :FchElabor
      t.date :FchVencim
      t.string :UnmdItem
      t.float :PrcItem
      t.integer :PrcOtrMon
      t.string :Moneda
      t.float :FctConv
      t.float :DctoOtrMnda
      t.float :RecargoOtrMnda
      t.float :MontoItemOtrMnda
      t.float :DescuentoPct
      t.integer :DescuentoMonto
      t.string :TipoDscto
      t.float :ValorDscto
      t.float :RecargoPct
      t.integer :RecargoMonto
      t.string :TipoRecargo
      t.integer :ValorRecargo
      t.string :CodImpAdic
      t.integer :MontoItem
      t.references :factura, index: true

      t.timestamps
    end
  end
end
