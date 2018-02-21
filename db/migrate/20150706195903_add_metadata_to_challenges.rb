class AddMetadataToChallenges < ActiveRecord::Migration[4.2]
  def change
    add_column :challenges, :metadata, :json
  end
end
