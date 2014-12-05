class CreateDetalles < ActiveRecord::Migration
  def change
    create_table :detalles do |t|
      t.string :NroLinDet
      t.string :integer
      t.string :TpoCodigo
      t.string :string
      t.string :VlrCodigo
      t.string :string
      t.string :TpoDocLiq
      t.string :string
      t.string :IndExe
      t.string :string
      t.string :IndAgente
      t.string :string
      t.string :MntBaseFaena
      t.string :integer
      t.string :MntMargComer
      t.string :integer
      t.string :PrcConsFinal
      t.string :integer
      t.string :NmbItem
      t.string :integer
      t.string :DscItem
      t.string :string
      t.string :QtyRef
      t.string :integer
      t.string :UnmdRef
      t.string :string
      t.string :PrcRef
      t.string :float
      t.string :QtyItem
      t.string :float
      t.string :FchElabor
      t.string :string
      t.string :FchVencim
      t.string :string
      t.string :UnmdItem
      t.string :string
      t.float :PrcItem
      t.float :DescuentoPct
      t.string :DescuentoMonto
      t.string :integer
      t.string :CodImpAdic
      t.string :string
      t.string :MontoItem
      t.string :integer
      t.references :documento, index: true

      t.timestamps
    end
  end
end
