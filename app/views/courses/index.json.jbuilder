json.array!(@courses) do |course|
  json.extract! course, :id, :name, :grade_id, :teacher_id
  json.url course_url(course, format: :json)
end
