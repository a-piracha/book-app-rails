class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.references :sender, null: false, foreign_key: { to_table: :users }
      
      t.references :conversation, null: false, foreign_key: { to_table: :conversations }

      t.text :content
      t.timestamps
    end
  end
end
