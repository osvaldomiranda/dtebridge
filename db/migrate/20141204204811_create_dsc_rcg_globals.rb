class CreateDscRcgGlobals < ActiveRecord::Migration
  def change
    create_table :dsc_rcg_globals do |t|
      t.string :NroLinDR
      t.string :integer
      t.string :TpoMov
      t.string :string
      t.string :GlosaDR
      t.string :string
      t.string :TpoValor
      t.string :string
      t.string :ValorDR
      t.string :integer
      t.string :IndExeDR
      t.string :integer
      t.references :documento, index: true

      t.timestamps
    end
  end
end
