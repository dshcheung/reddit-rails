class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.string :event
      t.string :voter
      t.timestamps
    end
  end
end
