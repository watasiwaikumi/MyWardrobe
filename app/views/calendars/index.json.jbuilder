json.array!(@calendars) do |calendar|
  json.extract! calendar, :id, :title, :body
  json.start calendar.start_date
  json.end calendar.end_date
  json.url calendar_url(calendar, format: :html)
end