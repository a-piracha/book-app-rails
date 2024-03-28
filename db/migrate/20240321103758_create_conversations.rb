class CreateConversations < ActiveRecord::Migration[7.0]
  def change
    create_table :conversations do |t|
      # t.integer :sender_id
      # t.integer :receiver_id
      # t.references :sender, null: false, foreign_key: true 
      # t.references :receiver, null: false, foreign_key: true
      t.references :sender, null: false, foreign_key: { to_table: :users } 
      t.references :receiver, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end

