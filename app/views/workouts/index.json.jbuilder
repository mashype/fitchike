json.array!(@workouts) do |workout|
  json.extract! workout, :id, :rating
  json.url workout_url(workout, format: :json)
end
