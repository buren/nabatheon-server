class AddEntityToSearches < ActiveRecord::Migration
  def change
    add_reference :searches, :entity, index: true
    add_foreign_key :searches, :entities
  end
end
