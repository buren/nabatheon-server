json.array!(@searches) do |search|
  json.extract! search, :id, :chunk_id, :fetched
  json.url search_url(search, format: :json)
  json.set! :type, search.entity.value_type
  json.set! :result do
    json.set! :title, search.title
    json.set! :lat, search.lat
    json.set! :long, search.long
    json.set! :map_url, search.map_url
    json.set! :image_urls, search.image_urls
    json.set! :display_url, search.display_url
    json.set! :content, strip_tags(search.result_content).to_s.truncate(200)
  end
end
