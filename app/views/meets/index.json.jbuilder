json.array!(@meets) do |meet|
  json.extract! meet, :id, :employee_name, :headshot, :duration, :about
  json.url meet_url(meet, format: :json)
end
