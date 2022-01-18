json.array!(@calendars) do |calendar|
  json.extract! calendar, :id, :title, :body
  json.start calendar.start
  json.end calendar.end
  json.url calendar_url(calendar, format: :html)
end