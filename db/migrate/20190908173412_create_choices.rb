class CreateChoices < ActiveRecord::Migration[6.0]
  def up
    create_table :choices do |t|
      t.integer :poll_id
      t.string :name
      t.boolean :live, default: true

      t.timestamps
    end

    add_index :choices, [:poll_id, :live]

    change_column :polls, :live, :boolean, default: true
    add_index     :polls, :live
  end

  def down
    remove_index :polls, :live
    remove_index :choices, [:poll_id, :live]
    drop_table :choices
  end
end
