class CreateBallots < ActiveRecord::Migration[6.0]
  def change
    create_table :ballots do |t|
      t.integer :poll_id
      t.integer :user_id

      t.timestamps
    end

    add_index :ballots, [:poll_id, :user_id, :created_at]
  end
end
