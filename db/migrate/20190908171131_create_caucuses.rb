class CreateCaucuses < ActiveRecord::Migration[6.0]
  def change
    create_table :caucuses do |t|
      t.integer :poll_id
      t.integer :user_id

      t.timestamps
    end

    add_index :caucuses, [:poll_id, :user_id], unique: true
  end
end
