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

  def coordinates
    return unless exists?

    lat  = page.coordinates[0]
    long = page.coordinates[1]
    {
      lat:  lat,
      long: long
    }
  end

  def exists?
    !page.categories.nil?    
  end
end
