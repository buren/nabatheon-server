class CreateEntities < ActiveRecord::Migration
  def change
    create_table :entities do |t|
      t.string :type
      t.string :value
      t.belongs_to :chunk, index: true

      t.timestamps null: false
    end
    add_foreign_key :entities, :chunks
  end
end
