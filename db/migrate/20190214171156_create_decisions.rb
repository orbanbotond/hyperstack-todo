class CreateDecisions < ActiveRecord::Migration[5.2]
  def change
    create_table :decisions do |t|
      t.text :description
      t.text :rationale
      t.references :meeting, foreign_key: true

      t.timestamps
    end
  end
end
