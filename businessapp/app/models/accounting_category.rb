class AccountingCategory
  include MongoMapper::Document

  key :name, String
  timestamps!
end
