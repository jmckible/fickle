class CreateRankings < ActiveRecord::Migration[6.0]
  def change
    create_table :rankings do |t|
      t.integer :ballot_id
      t.integer :choice_id
      t.integer :position

      t.timestamps
    end

    add_index :rankings, [:ballot_id, :choice_id, :position], unique: true
  end
end
