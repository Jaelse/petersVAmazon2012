% In the Participation Agreement, 
% Amazon claims to have the right to "initiate a credit to Seller's Account 
% on a rolling 14-day cycle.".
% However, Amazon then claims the right to an additional five business days 
% for the funds to actually be credited to the seller's account. 
% Even taking into account this liberally and unilaterally extended 
% period for payment, Amazon routinely fails to credit sellers’ accounts timely.

% with generosity included
amazon_failed_to_timely_pay(DEPOSIT_DATE, SELLER, CONFIRMATION_DATE, ORDER) :- 
    amazon_shall_initiate_credit(PAYMENT_DATE, SELLER, CONFIRMATION_DATE, ORDER, _), 
    date_add(PAYMENT_DATE, 5 days, GD),
    business_date(Generosity_date, GD),
    account_got_deposited(_, SELLER, DEPOSIT_DATE), 
    date_difference(DEPOSIT_DATE, Generosity_date, D),
    [YEARS,_,DAYS] = D,
    YEARS \= -1 years,
    format("Seller ~p got her account deposited on ~p.\n", [SELLER, DEPOSIT_DATE]),
    format("Taking in account liberally and unilaterally that Amazon would credit the account by 5 business days after ~p that is on the ~p.\n", [PAYMENT_DATE, Generosity_date]),
    format("Amazon still failed to timely pay ~p by being late for ~p. \n\n\n", [SELLER,  DAYS]).

% amazon_failed_to_timely_pay(DEPOSIT_DATE, SELLER, CONFIRMATION_DATE, ORDER, SHIPMENT_DATE, YEAR) :- 
%     confirmed_shipment(SELLER, CONFIRMATION_DATE, ORDER, _, SHIPMENT_DATE),
%     amazon_shall_initiate_credit(PAYMENT_DATE, SELLER, CONFIRMATION_DATE, ORDER, _), 
%     date_add(PAYMENT_DATE, 5 days, GD),
%     business_date(Generosity_date, GD),
%     account_got_deposited(_, SELLER, DEPOSIT_DATE), 
%     date_difference(Generosity_date,DEPOSIT_DATE, D),
%     [YEAR,_,_] = D,
%     YEAR = -1 years.

% amazon_failed_to_timely_pay(INITIATION_DATE, SELLER, CONFIRMATION_DATE, ORDER, SHIPMENT_DATE) :- 
%     confirmed_shipment(SELLER, CONFIRMATION_DATE, ORDER, _, SHIPMENT_DATE),
%     amazon_shall_initiate_credit(PAYMENT_DATE, SELLER, CONFIRMATION_DATE, ORDER, _), 
%     amazon_initiated_credit(INITIATION_DATE, SELLER, CONFIRMATION_DATE, ORDER,_), 
%     date_difference(INITIATION_DATE, PAYMENT_DATE, D),
%     [_,_,DAYS] = D,
%     DAYS \= '0 days'.

% amazon_failed_to_timely_pay(DEPOSIT_DATE, INITIATION_DAYE, SELLER, CONFIRMATION_DATE, ORDER, SHIPMENT_DATE) :- 
%     confirmed_shipment(SELLER, CONFIRMATION_DATE, ORDER, _, SHIPMENT_DATE),
%     seller_account_shall_get_credited(DEPOSIT_DATE, PAYMENT_DATE, SELLER, ORDER),
    
%     date_difference(INITIATION_DATE, PAYMENT_DATE, D),
%     [_,_,DAYS] = D,
%     DAYS \= '0 days'.

% To find how many days amazon failed to timely pay
% amazon_failed_to_timely_pay(DAYS, INITIATION_DATE, SELLER, CONFIRMATION_DATE, ORDER, SHIPMENT_DATE) :- 
%     confirmed_shipment(SELLER, CONFIRMATION_DATE, ORDER, _, SHIPMENT_DATE),
%     amazon_shall_initiate_credit(PAYMENT_DATE, SELLER, CONFIRMATION_DATE, ORDER, _), 
%     amazon_initiated_credit(INITIATION_DATE, SELLER, CONFIRMATION_DATE, ORDER,_), 
%     date_difference(INITIATION_DATE, PAYMENT_DATE, D),
%     [_,_,DAYS] = D,
%     DAYS \= '0 days'.