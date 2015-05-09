class Entity < ActiveRecord::Base
  belongs_to :chunk

  validates_presence_of :value_type, :value, :chunk
end
