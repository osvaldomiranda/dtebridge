class CreateImptoRetens < ActiveRecord::Migration
  def change
    create_table :impto_retens do |t|
      t.string :TipoImp
      t.string :string
      t.string :TasaImp
      t.string :float
      t.string :MontoImp
      t.string :integer
      t.references :documento, index: true

      t.timestamps
    end
  end
end
