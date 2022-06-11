class CreateSpotComments < ActiveRecord::Migration[6.1]
  def change
    create_table :spot_comments do |t|
      t.integer :user_id
      t.integer :spot_id
      t.text :comment
      
      t.timestamps
    end
  end
end
