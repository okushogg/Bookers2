class AddIntroductionToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :text, :introduction
  end
end
