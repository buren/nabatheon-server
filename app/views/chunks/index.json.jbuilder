json.array!(@chunks) do |chunk|
  json.extract! chunk, :id, :content
  json.url chunk_url(chunk, format: :json)
end
