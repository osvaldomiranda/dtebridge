class AddTrackidSiiToDocumentos < ActiveRecord::Migration
  def change
    add_column :documentos, :trackidSII, :string
  end
end
