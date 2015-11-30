class AccountingStatement
  include MongoMapper::Document

  key :is_income, Boolean, :default => false
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
  timestamps!
  
  #validates_presence_of :is_income            
  validates_presence_of :net_amount            
  validates_presence_of :vat_amount            
  validates_presence_of :receiver_or_issuer_name            
  validates_presence_of :corporation_id
  
  def accounting_category
    if ac = AccountingCategory.find(accounting_category_id)
      return ac.name
    else
      return ""
    end
  end
  
  def corporation
    if corp = Corporation.find(corporation_id)
      return corp.name
    else
      return ""
    end
    
  end
  
  
end
