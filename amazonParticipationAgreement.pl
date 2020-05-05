% Amazon Participation Agreement

% Promptly after shipment of a customer's order (or any portion of the customer's order), 
% you will accurately inform us that the order has been shipped 
% (and, in the case of a customer order that is shipped in more than one shipment, accurately inform us which portion of the order has been shipped), 
% using our standard functionality for communicating such information when we make that functionality available to you ("Confirmation of Shipment"). 

% If seller sold order O to Buyer B of some amount on some date 
% Then shipment confirmation functionality is available to the seller S for the Order O of Buyer B.
available(functionality(shipment_confirmation), SELLER, ORDER, BUYER) :- 
    sold(SELLER, ORDER, BUYER, _, _),
    format('Shipment confirmation functionality was available to ~p for the ~p sold to ~p. \n', [SELLER, ORDER, BUYER]).


% If shipment confirmation functionality is available to the seller S for the order O of buyer B.
% AND seller S shipped order O to the buyer B on date SHIPMENT_DATE
% AND seller S inform amazon of shipment on the date CONFIRMATION_DATE that the order O is shipped to buyer B on the date SHIPMENT_DATE
% Then seller S has confirmed shipment on CONFIRMATION_DATE of the order O shipped on SHIPMENT_DATE to the buyer B .
confirmed_shipment(SELLER, CONFIRMATION_DATE, ORDER, BUYER, SHIPMENT_DATE) :- 
    available(functionality(shipment_confirmation), SELLER, ORDER, BUYER),
    shipped(SELLER, ORDER, BUYER, SHIPMENT_DATE),
    inform_amazon_of_shipment(SELLER, CONFIRMATION_DATE, ORDER, BUYER, SHIPMENT_DATE),
    format('Based on Participation Agreement, ~p confirmed the shipment on ~p for the ~p sold to ~p and shipped on ~p.\n', [SELLER, CONFIRMATION_DATE, ORDER, BUYER, SHIPMENT_DATE]).
    

% If seller S make the confirmation of shipment on the date CONFIRMATION_DATE for an order ORDER
% AND CONFIRMATION_DATE will give payment date PD.
% Then 
% by the date PD Amazon shall initiate the credit for seller SELLER for shipment confirmation date CONFIRMATION_DATE for the order ORDER.
amazon_shall_initiate_credit(PD, SELLER, CONFIRMATION_DATE, ORDER, _) :- 
    confirmed_shipment(SELLER, CONFIRMATION_DATE, ORDER, _, _),
    date_add(CONFIRMATION_DATE, 2 weeks, PD),
    format('According to the Participation Agreement, by ~p Amazon shall initiate credit to ~p who made shipment confirmation on ~p for the ~p.\n', [PD, SELLER, CONFIRMATION_DATE, ORDER]).
    

% ---------------------------------------------------------------------

next_business_day_for_sat(BUSINESS_DATE,ORIGINAL_DEPOSIT_DATE) :- 
    week_day(ORIGINAL_DEPOSIT_DATE, DAY),
    DAY = 'Saturday',
    date_add(ORIGINAL_DEPOSIT_DATE, 2 days, BUSINESS_DATE).

next_business_day_for_sun(BUSINESS_DATE,ORIGINAL_DEPOSIT_DATE) :- 
    week_day(ORIGINAL_DEPOSIT_DATE, DAY),
    DAY = 'Sunday',
    date_add(ORIGINAL_DEPOSIT_DATE, 1 days, BUSINESS_DATE).

today_is_business_day(ORIGINAL_DEPOSIT_DATE) :-
    week_day(ORIGINAL_DEPOSIT_DATE, DAY),
    DAY \= 'Saturday',
    DAY \= 'Sunday'.

business_date(BUSINESS_DATE, ORIGINAL_DEPOSIT_DATE) :-
    next_business_day_for_sat(BUSINESS_DATE, ORIGINAL_DEPOSIT_DATE).

business_date(BUSINESS_DATE, ORIGINAL_DEPOSIT_DATE) :-
    next_business_day_for_sun(BUSINESS_DATE, ORIGINAL_DEPOSIT_DATE).

business_date(BUSINESS_DATE, ORIGINAL_DEPOSIT_DATE) :-
    today_is_business_day(ORIGINAL_DEPOSIT_DATE),
    BUSINESS_DATE = ORIGINAL_DEPOSIT_DATE.

account_shall_get_credited(DEPOSIT_DATE, PAYMENT_DATE, SELLER, ORDER) :-
    amazon_initiated_credit(PAYMENT_DATE,SELLER, _, ORDER, _),
    date_add(PAYMENT_DATE, 5 days, DD),
    business_date(DEPOSIT_DATE, DD).

% Where, Business Day is Monday to Friday and Business Day is not federal banking holidays and nextBusinessDay(PD) = BUSINESS DAY after PD. That means the next business day falls on the business days which is after PaymentDate(D) equal to PD.



% If Amazon initiates the payment process for amount A or credit to the seller S account Then amount A is credited to the seller S account within creditCompletionPeriod(PD)
% Where, creditCompletionPeriod(X) is greater than or equal to the PD and creditCompletionPeriod(PD) is less than or equal to the (X+5) days.

% paymentDate
