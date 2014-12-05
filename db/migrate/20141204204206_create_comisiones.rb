class CreateComisiones < ActiveRecord::Migration
  def change
    create_table :comisiones do |t|
      t.string :NroLinCom
      t.string :integer
      t.string :TipoMovim
      t.string :string
      t.string :Glosa
      t.string :string
      t.string :ValComNeto
      t.string :integer
      t.string :ValComExe
      t.string :integer
      t.string :ValComIVA
      t.string :integer
      t.references :documento, index: true

      t.timestamps
    end
  end
end
