class AddColumnToDocsemail < ActiveRecord::Migration
  def change
    add_column :docsemails, :mailid, :string
  end
end
