json.array!(@grades) do |grade|
  json.extract! grade, :id, :name, :period_id, :current
  json.url grade_url(grade, format: :json)
end
