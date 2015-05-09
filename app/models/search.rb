class Search < ActiveRecord::Base
  belongs_to :chunk
  belongs_to :entity

  validates_presence_of :json_text, :chunk, :entity

  scope :not_seen, -> { where.not(fetched: true) }

  def format_result
    @formatted ||= OpenStruct.new(JSON.parse(json_text))
  end

  def coordinates?
    lat && long
  end

  def lat
    coord = format_result.coordinates
    return if coord.nil?

    coord['lat']
  end

  def long
    coord = format_result.coordinates
    return if coord.nil?
    
    coord['long']
  end

  def map_url
    return unless coordinates?
    "https://maps.googleapis.com/maps/api/staticmap?center=#{lat},#{long}&zoom=11&size=400x200"
  end

  def image_urls
    format_result.image_urls
  end

  def title
    format_result.title
  end

  def display_url
    map_url || image_urls.first || "http://placehold.it/400x200&text=#{CGI.escape(format_result.title.to_s)}"
  end

  def result_content
    format_result.content
  end
end
