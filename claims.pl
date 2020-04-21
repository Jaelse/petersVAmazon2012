claim1(INITIATION_DATE, PAYMENT_DATE, Diff) :- 
    amazon_shall_initiate_credit(PAYMENT_DATE, SELLER, CONFIRMAION, ORDER, _), 
    amazon_initiated_credit(INITIATION_DATE, SELLER, CONFIRMAION, ORDER,_), 
    date_difference(INITIATION_DATE, PAYMENT_DATE, D),
    [_,_,Diff] = D.