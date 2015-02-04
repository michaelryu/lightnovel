class CreateChapters < ActiveRecord::Migration
  def change
    create_table :chapters do |t|
      t.string :title
      t.text :content
      t.references :novel, index: true

      t.timestamps null: false
    end
    add_foreign_key :chapters, :novels
  end
end
