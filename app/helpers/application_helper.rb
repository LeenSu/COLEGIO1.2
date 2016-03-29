module ApplicationHelper

  def set_periods
    Period.all
  end

  def set_grades
    Grade.where(current: true)
  end

  def set_teachers
    Teacher.all
  end

  def set_students
    Student.all
  end

  def set_courses
    Course.all
  end

  def full_name(t)
    "#{t.name} #{t.last_name}"
  end

end
