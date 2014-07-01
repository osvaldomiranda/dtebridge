class AddColumnNameToInvoices < ActiveRecord::Migration
  def change
    add_column :invoices, :Pdf, :binary
    add_column :invoices, :Xml, :binary
  end
end
