class AddCachedVotesTotalToNovels < ActiveRecord::Migration
  def change
    add_column :novels, :cached_votes_total, :integer, :default => 0
  end
end
