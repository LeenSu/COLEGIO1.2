class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :grade_id
      t.integer :teacher_id

      t.timestamps
    end
  end
end
