class AccountingStatement
  include MongoMapper::Document

  key :is_income, Boolean
  key :net_amount, Float
  key :vat_amount, Float
  key :frontpage_data, Binary
  key :backpage_data, Binary
  key :frontpage_content_type, String
  key :backpage_content_type, String
  key :backpage_filename, String
  key :frontpage_filename, String
  key :bill_number, String
  key :issuedate, Date
  key :payment_date, Date
  key :description, String
  key :physical_location, String
  key :receiver_or_issuer_name, String
  key :accounting_category_id, ObjectId
  key :corporation_id, ObjectId
end
