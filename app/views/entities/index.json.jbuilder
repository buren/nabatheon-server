json.array!(@entities) do |entity|
  json.extract! entity, :id, :type, :value, :chunk_id
  json.url entity_url(entity, format: :json)
end
