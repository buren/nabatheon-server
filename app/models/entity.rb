class Entity < ActiveRecord::Base
  belongs_to :chunk

  validates_presence_of :type, :value, :chunk
end
