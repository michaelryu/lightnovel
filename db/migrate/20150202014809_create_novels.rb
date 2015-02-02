class CreateNovels < ActiveRecord::Migration
  def change
    create_table :novels do |t|
      t.string :title
      t.text :summary
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :novels, :users
  end
end
