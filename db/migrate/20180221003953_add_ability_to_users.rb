class AddAbilityToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :ability, :string
  end
end
