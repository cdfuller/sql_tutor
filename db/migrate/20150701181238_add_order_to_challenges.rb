class AddOrderToChallenges < ActiveRecord::Migration[4.2]
  def change
    add_column :challenges, :order, :integer
  end
end
