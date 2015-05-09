class EntityCreator
  def initialize(chunk)
    @chunk      = chunk
    annotations = Nabatheon.annotate(chunk.content)
    @naba       = Nabatheon.relevant_searches_for(annotations)
  end

  def persist!
    @naba.each do |entity|
      next unless allowed_type?(entity.type)

      entity_record = Entity.create!(chunk: @chunk, value_type: entity.type, value: entity.value)
      SearchCreator.new(@chunk, entity_record).persist!
    end
  end

  def allowed_type?(type)
    ['PERSON', 'ORGANIZATION', 'LOCATION'].include?(type)
  end
end
