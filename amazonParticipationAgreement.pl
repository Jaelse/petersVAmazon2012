% Amazon Participation Agreement

% Promptly after shipment of a customer's order (or any portion of the customer's order), 
% you will accurately inform us that the order has been shipped 
% (and, in the case of a customer order that is shipped in more than one shipment, accurately inform us which portion of the order has been shipped), 
% using our standard functionality for communicating such information when we make that functionality available to you ("Confirmation of Shipment"). 

% If Buyer B places an order O by the help of the seller S Then order O is available for confirmation of the shipment to the seller S.
available(option(shipment_confirmation), SELLER, ORDER, BUYER) :- placed(BUYER, ORDER, _, SELLER, _).

% If order O is available for the confirmation of the shipment to the seller S 
% Then seller S can view his confirmation of the shipment for that particular order O option in his Amazon Seller Account.
confirmed_shipment(SELLER, CONFIRMATION_DATE, ORDER, BUYER, SHIPTMENT_DATE) :- 
    available(option(shipment_confirmation), SELLER, ORDER, BUYER),
    shipped(SELLER, ORDER, BUYER, SHIPTMENT_DATE),
    inform_amazon_of_shipment(SELLER, ORDER, BUYER, SHIPTMENT_DATE, CONFIRMATION_DATE).

% If seller S make the confirmation of shipment on the date D for an order O mentioned above for amount A Then 
% Amazon initiates the credit for the amount A after taking all its charges to seller S on the date named as function PaymentDate(D).

amazon_initiates_credit(CONFIRMATION_DATE, SELLER, ORDER, _) :- 
    confirmed_shipment(SELLER, CONFIRMATION_DATE, ORDER, _, _).


add_day(TIME_STAMP, DAYS_IN_TIME_STAMP, NEW_TIME_STAMP) :- NEW_TIME_STAMP is TIME_STAMP + (DAYS_IN_TIME_STAMP * 24 * 60 * 62 ).

payment_date(INITATION_DATE, PAYMENT_DATE) :- 
    date_time_stamp(INITATION_DATE, TIME_STAMP),
    add_day(TIME_STAMP, 14, PAYMENT_DATE_TIME_STAMP),
    stamp_date_time(PAYMENT_DATE_TIME_STAMP, PAYMENT_DATE, 0).

% If the confirmation of shipment date D plus 14 days of stipulated period is less than or equal to Registration Date namely REGD of seller S plus 14 days 
% Then PaymentDate(D) is obtained by addition of REGD plus 14 days Else PaymentDate(D) is obtained by addition confirmation of shipment date D plus 14 days.
% Let us call PaymentDate(D) as PD.
% If PD is not a business day Then PD is nextBusinessDay(PD)


% Where, Business Day is Monday to Friday and Business Day is not federal banking holidays and nextBusinessDay(PD) = BUSINESS DAY after PD. That means the next business day falls on the business days which is after PaymentDate(D) equal to PD.



% If Amazon initiates the payment process for amount A or credit to the seller S account Then amount A is credited to the seller S account within creditCompletionPeriod(PD)
% Where, creditCompletionPeriod(X) is greater than or equal to the PD and creditCompletionPeriod(PD) is less than or equal to the (X+5) days.

% paymentDate