class RemoveTextFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :text, :integer
  end
end
