class AddLastChapterAtToNovels < ActiveRecord::Migration
  def change
    add_column :novels, :last_chapter_at, :datetime
  end
end
