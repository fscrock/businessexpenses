class Corporation
  include MongoMapper::Document

  key :name, String
  key :is_private, Boolean
  key :owner_ids, Array
  timestamps!
  
  validates_presence_of :name
  validates_presence_of :is_private
  validates_presence_of :owner_ids
end
