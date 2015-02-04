class AddUserToChapters < ActiveRecord::Migration
  def change
    add_reference :chapters, :user, index: true
    add_foreign_key :chapters, :users
  end
end
