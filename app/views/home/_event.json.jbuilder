json.extract! event, :id, :name, :date, :location, :details, :created_at, :updated_at
json.url event_url(event, format: :json)