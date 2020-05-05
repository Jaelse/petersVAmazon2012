% Plaintiff Jo Ellen Peters became an Amazon "seller" in October, 2012. 
seller(peters, date(2012, 10, 01)).

% Peters sold DVDs order on October 15, 2012. 
% sold(SELLER, ORDER, BUYER,  AMOUNT, DATE).
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

% Amazon did not initiate instructions to transmit Plaintiff Peters’
% money to her until November 5, 2012,
% On date 2012, 11, 06 amazon initiated credit to Peters for the dvds order for some_amount.
amazon_initiated_credit(date(2012, 11, 06), peters, date(2012, 10,15), order(dvds), some_amount).

% money got available into Peters bank account on November 7, 2012.
account_got_deposited(some_amount, peters, date(2012, 11, 06)).