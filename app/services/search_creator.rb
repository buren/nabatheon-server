class SearchCreator
  def initialize(chunk, entity)
    @chunk  = chunk
    @entity = entity
  end

  def persist!
    wiki_page = WikiLookup.new(@entity.value)
    if wiki_page.exist?
      Search.create!(
        chunk:     @chunk,
        entity:    @entity,
        json_text: wiki_page.to_json,
        fetched:   false
      )
    end
  end
end
