# Show My Expenses
Track my expenses of different businesses,
everything what is paid cash with receipt or ordered online.

# Data Model


## AccountingStatement

* income (or_costs) 	(Boolean)
* net_amount			(Float)
* value_added_tax		(Float)
* frontpage_data		(Binary)
* backpage_data			(Binary)
* frontpage_content_type	(String)
* backpage_content_type		(String)
* backpage_filename			(String)
* frontpage_filename		(String)
* bill_number			(String)
* issue date			(Date)
* payment date			(Date)
* description			(String)
* physical_location		(String)
* receiver_or_issuer_name (Kim, airbnb, LPG, booking com, finanzamt) (String)
* accounting_category_id	(Integer)
* corporation_id			(Integer)

## AccountingCategory 
* name					(String)
	* telecomuincation
	* hardware
	* software
	* books
	* food
	* fuel
	* services (lawyer, cleaning ..)
	* insurance
	* operating cost
	* officials

## Corporation

* name (Schmuck, Gastgewerbe, IT, 2p, medications, chessential, mashdish ..)			(String)
* is_private 			(Boolean)
* owner_ids				(Array)

## Owner

```
rails g scaffold owner name:string
```



