class Owner
  include MongoMapper::Document

  key :name, String
  timestamps!
end
