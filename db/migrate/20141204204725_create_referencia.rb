class CreateReferencia < ActiveRecord::Migration
  def change
    create_table :referencia do |t|
      t.string :NroLinRef
      t.string :integer
      t.string :TpoDocRef
      t.string :string
      t.string :IndGlobal
      t.string :integer
      t.string :FolioRef
      t.string :string
      t.string :RUTOtr
      t.string :string
      t.string :IdAdicOtr
      t.string :string
      t.string :FchRef
      t.string :string
      t.string :CodRef
      t.string :integer
      t.string :RazonRef
      t.string :string
      t.references :documento, index: true

      t.timestamps
    end
  end
end
