class Chunk < ActiveRecord::Base
  has_many :entities
  
  validates_presence_of :content
end
