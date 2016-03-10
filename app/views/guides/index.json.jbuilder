json.array!(@guides) do |guide|
  json.extract! guide, :id, :place, :date, :time, :language
  json.url guide_url(guide, format: :json)
end
