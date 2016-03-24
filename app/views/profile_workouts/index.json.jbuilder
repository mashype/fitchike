json.array!(@profile_workouts) do |profile_workout|
  json.extract! profile_workout, :id, :rating
  json.url profile_workout_url(profile_workout, format: :json)
end
