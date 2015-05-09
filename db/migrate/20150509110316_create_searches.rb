class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.text :json_text
      t.belongs_to :chunk, index: true

      t.timestamps null: false
    end
    add_foreign_key :searches, :chunks
  end
end
