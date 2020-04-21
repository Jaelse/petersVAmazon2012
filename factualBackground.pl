% Plaintiff Jo Ellen Peters became an Amazon "seller" in October, 2012. 
seller(peters).

% Peters sold hard to find DVDs October 15, 2012. 
% sold(SELLER, BUYER, ORDER, AMOUNT, DATE).
sold(peters,
    order(dvds),
    some_buyer, 
    some_amount,
    date(2012,10,15)).

% Peters shipped dvd orders on October 15, 2012. 
% shipment(SELLER, ORDER, BUYER, SHIPTMENT_DATE).
shipped(peters, order(dvds), some_buyer, date(2012,10,15)).

% ORIGINAL
% Peters notified Amazon that the DVD shipped on October 15, 2012.

% INTERPRETED
% Peters informed amazon of shipment on October 15, 2012 
% that the dvds order was shipped to some_buyer on the date 2012, 10,15.

% inform_amazon_of_shipment(SELLER, SHIPTMENT_DATE, ORDER, BUYER,  CONFIRMATION_DATE).
inform_amazon_of_shipment(peters, date(2012,10,15), order(dvds), some_buyer, date(2012,10,15)).

% On date 2012, 11, 12 amazon initiated credit to Peters for the dvds order for some_amount.
amazon_initiated_credit(date(2012, 11, 05), peters, date(2012, 10,15), order(dvds), some_amount).

% money got deposited into Peters bank account on November 7, 2012.
deposited_to_account(some_amount, peters, date(2012, 11, 06)).