class CreatePolls < ActiveRecord::Migration[6.0]
  def change
    create_table :polls do |t|
      t.integer :creator_id
      t.string :name
      t.string :slug
      t.boolean :live

      t.timestamps
    end

    add_index :polls, :creator_id
    add_index :polls, :slug, unique: true
  end
end
