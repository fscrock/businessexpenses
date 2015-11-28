class Corporation
  include MongoMapper::Document

  key :name, String
  key :is_private, Boolean
  key :owner_ids, Array

end
