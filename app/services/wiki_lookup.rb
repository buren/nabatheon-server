require_dependency 'wikipedia'

class WikiLookup
  attr_reader :page

  def initialize(search_term)
    @page = Wikipedia.find(search_term)
  end

  def title
    page.title
  end

  def links
    page.extlinks
  end

  def categories
    page.categories
  end

  def image_urls
    page.image_urls
  end

  def content
    page.sanitized_content
  end

  def coordinates
    return unless exist?
    return if page.coordinates.nil?

    lat  = page.coordinates[0]
    long = page.coordinates[1]
    {
      lat:  lat,
      long: long
    }
  end

  def exist?
    !page.categories.nil?    
  end

  def to_json
    {
      title:       title,
      links:       links,
      categories:  categories,
      image_urls:  image_urls,
      coordinates: coordinates,
      content:     content
    }.to_json
  end
end
