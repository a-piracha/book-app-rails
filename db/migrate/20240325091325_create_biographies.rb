class CreateBiographies < ActiveRecord::Migration[7.0]
  def change
    create_table :biographies do |t|
      t.integer :age
      t.string :cnic
      t.date :dob
      t.string :bio
      t.references :author, null: false, foreign_key: true

      t.timestamps
    end
  end
end
