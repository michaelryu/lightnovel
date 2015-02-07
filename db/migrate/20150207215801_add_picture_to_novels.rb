class AddPictureToNovels < ActiveRecord::Migration
  def change
    add_column :novels, :picture, :string
  end
end
