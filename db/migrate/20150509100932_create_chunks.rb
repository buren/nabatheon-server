class CreateChunks < ActiveRecord::Migration
  def change
    create_table :chunks do |t|
      t.text :content

      t.timestamps null: false
    end
  end
end
