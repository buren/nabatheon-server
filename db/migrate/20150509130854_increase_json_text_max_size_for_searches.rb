class IncreaseJsonTextMaxSizeForSearches < ActiveRecord::Migration
  def change
    change_column :searches, :json_text, :text, limit: 4294967295
  end
end
