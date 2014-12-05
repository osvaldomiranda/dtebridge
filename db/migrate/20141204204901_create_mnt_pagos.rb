class CreateMntPagos < ActiveRecord::Migration
  def change
    create_table :mnt_pagos do |t|
      t.string :FchPago
      t.string :string
      t.string :MntPago
      t.string :integer
      t.references :documento, index: true

      t.timestamps
    end
  end
end
