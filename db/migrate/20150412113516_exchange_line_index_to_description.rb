class ExchangeLineIndexToDescription < ActiveRecord::Migration
  def change
    remove_column :expenses, :line_index
    add_column :expenses, :description, :string, nullable: false
  end
end
