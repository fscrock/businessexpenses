# Show My Expenses
Track my expenses of different businesses,
everything what is paid cash with receipt or ordered online.

# Data Model

```
rails g scaffold accounting_category name:string
rails g scaffold corporation name:string is_private:boolean owner_ids:array
rails g scaffold owner name:string
rails g scaffold accounting_statement is_income:boolean net_amount:float vat_amount:float frontpage_data:binary backpage_data:binary frontpage_content_type:string backpage_content_type:string backpage_filename:string frontpage_filename:string bill_number:string issuedate:date payment_date:date description:string physical_location:string receiver_or_issuer_name:string accounting_category_id:object_id corporation_id:object_id
```




 

