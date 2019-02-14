class CreateLearnings < ActiveRecord::Migration[5.2]
  def change
    create_table :learnings do |t|
      t.text :description
      t.references :meeting, foreign_key: true

      t.timestamps
    end
  end
end
