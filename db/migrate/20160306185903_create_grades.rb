class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.string :name
      t.integer :period_id
      t.boolean :current

      t.timestamps
    end
  end
end
