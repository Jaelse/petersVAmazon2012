% Peters marketed, sold, and shipped hard to find DVDs listed for sale on the Amazon.com website. 
% Her first sale occurred on or about October 15, 2012, and she notified Amazon that the DVD shipped on October 15, 2012. 

seller(peters).

% place(BUYER, ORDER, AMOUNT, SELLER, DATE).
placed(some_buyer,
    order(dvds), 
    50,
    peters,
    date(2012,10,15)).

% shipment(SELLER, ORDER, BUYER, SHIPTMENT_DATE).
shipped(peters, order(dvds), some_buyer, date(2012,10,15)).

% inform_amazon_of_shipment(SELLER, ORDER, BUYER, SHIPTMENT_DATE, CONFIRMATION_DATE).
inform_amazon_of_shipment(peters, order(dvds), some_buyer, date(2012,10,15), date(2012,10,15)).

amazon_initiated_credit(date(2012, 11, 12), peters, order(dvds), 50).