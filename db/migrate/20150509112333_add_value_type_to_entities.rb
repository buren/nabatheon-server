class AddValueTypeToEntities < ActiveRecord::Migration
  def change
    add_column :entities, :value_type, :string
  end
end
