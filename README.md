# Peters v. Amazon 2012 (Prolog code) 
This is the prolog code for the first claim case of Peters v. Amazon 2012.

The files are organized as follows:

- Amazon Participation Agreement:
Prolog rules derived from the relevant clauses from the contract on the basis of which the plaintiffs made their claim.
- Factual Background :
The relevant facts from the case.
- Claims:
The rules for derived from the claims of the plaintiffs.

## Amazon Participation Agreement

Below are the relevant clauses from the Amazon Participation Agreement. First we derive IF THEN statements from these 
clauses and then make prolog rules from it.

### First clause

Promptly after shipment of a customer's order (or any portion of the customer's order),
you will accurately inform us that the order has been shipped
(and, in the case of a customer order that is shipped in more than one shipment,
accurately inform us which portion of the order has been shipped),
using our standard functionality for communicating such information when we make that functionality available to you 
("Confirmation of Shipment"). 

This clause tells the seller to inform amazon once the shipment for the customer's order is made. 
Amazon urge that the seller inform them accurately about the orders that is shipped. 
Further amazon tells to inform using the standard functionality when amazon makes it available. According to this,
it is understood that when the seller makes a sale then only the standard functionality will be available to the seller.


IF seller sold order O to Buyer B of some amount on some date 
Then shipment confirmation option is available to the seller S for the Order O of Buyer B.


```prolog
available(option(shipment_confirmation), SELLER, ORDER, BUYER) :- sold(SELLER, ORDER, BUYER, _, _).
```
Example output: <br />
```prolog
?- available(option(shipment_confirmation), SELLER, ORDER, BUYER).
SELLER = peters,
ORDER = order(dvds),
BUYER = some_buyer.
```

After this, when the shipment confirmation functionality is available to the seller, then we can inform Amazon that he had made
the shipment. We can say the shipment is confirmed by the seller when the shipment confirmation option is available to the seller,
the seller has shipped the order to the buyer.

```
If shipment confirmation option is available to the seller S for the order O of buyer B
AND seller S shipped order O to the buyer B on shipment date SHIPMENT_DATE
AND seller S inform amazon of shipment on the date CONFIRMATION_DATE that the order O is shipped to buyer B on the date SHIPMENT_DAYE
THEN seller S has confirmed shipment order O of the buyer B on the date SHIPMENT_DATE.
```

```prolog
confirmed_shipment(SELLER, CONFIRMATION_DATE, ORDER, BUYER, SHIPTMENT_DATE) :- 
    available(option(shipment_confirmation), SELLER, ORDER, BUYER),
    shipped(SELLER, ORDER, BUYER, SHIPTMENT_DATE),
    inform_amazon_of_shipment(SELLER, CONFIRMATION_DATE, ORDER, BUYER, SHIPTMENT_DATE).
```
Example output:
```prolog
?- confirmed_shipment(SELLER, CONFIRMATION_DATE, ORDER, BUYER, SHIPTMENT_DATE).
SELLER = peters,
CONFIRMATION_DATE = SHIPTMENT_DATE, SHIPTMENT_DATE = date(2012, 10, 15),
ORDER = order(dvds),
BUYER = some_buyer.
```

Payment date is a term used in the Participation agree which refers to the the date which comes 14 days after the date the 
seller confirms the shipment of the order. By this (Payment Date) date amazon will initiate the credit to the seller for the
order which he has shipped to the buyer.<br />

 If seller S make the confirmation of shipment on the date CONFIRMATION_DATE for an order ORDER
 AND CONFIRMATION_DATE will give payment date PD.
 Then 
 by the date PD Amazon shall initiate the credit for seller SELLER for shipment confirmation date CONFIRMATION_DATE for the order ORDER.

```prolog
amazon_shall_initiate_credit(PD, SELLER, CONFIRMATION_DATE, ORDER, _) :- 
    confirmed_shipment(SELLER, CONFIRMATION_DATE, ORDER, _, _),
    payment_date(CONFIRMATION_DATE, PD).
```

Below rule gives the `PAYMENT_DATE` which will be the 14th day for the given `CONFIRMATION_DATE`. <br/>
```prolog
payment_date(CONFIRMATION_DATE, PAYMENT_DATE) :- 
    date_add(CONFIRMATION_DATE, 2 weeks, PAYMENT_DATE).
```
Example output:
```prolog
?- payment_date(date(2012, 10, 15), PAYMENT_DATE).
PAYMENT_DATE = date(2012, 10, 29).
```
