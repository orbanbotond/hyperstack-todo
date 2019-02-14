class CreateMeetings < ActiveRecord::Migration[5.2]
  def change
    create_table :meetings do |t|
      t.string :name
      t.datetime :start_at
      t.integer :duration
      t.text :description
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
