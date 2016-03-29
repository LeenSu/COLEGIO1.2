class AddStudentGradeAssoc < ActiveRecord::Migration
  def up
    create_table :grades_students, id: false do |t|
      t.belongs_to :grade, index: true
      t.belongs_to :student, index: true
    end
  end

  def down
    drop_table :grades_students
  end
end
