class AddFetchedToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :fetched, :boolean
  end
end
