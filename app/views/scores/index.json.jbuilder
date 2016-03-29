json.array!(@scores) do |score|
  json.extract! score, :id, :score_one, :score_two, :score_three, :score_four, :score_test, :score_final, :student_id, :course_id
  json.url score_url(score, format: :json)
end
