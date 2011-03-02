class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.integer :number
      t.references :user
      t.references :thing

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
