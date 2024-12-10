% Parent relationships
parent(twana, balen).        
parent(twana, asma).       
parent(twana, lania).      
parent(przha, balen).      
parent(przha, asma).       
parent(przha, lania).      

parent(balen, payam).      
parent(balen, ahmad).      
parent(saya, payam).     
parent(saya, ahmad).     

parent(asma, lano).      
parent(dyako, lano).     

parent(lania, haryad).   
parent(lania, hanar).    
parent(meer, haryad).     
parent(meer, hanar).      


% Spouse relationships
spouse(twana, przha).        
spouse(przha, twana).

spouse(balen, saya).      
spouse(saya, balen).

spouse(asma, dyako).      
spouse(dyako, asma).

spouse(lania, meer).      
spouse(meer, lania).


% Male individuals
male(twana).
male(balen).
male(ahmad).
male(dyako).
male(meer).
male(haryad).

% Female individuals
female(przha).
female(asma).
female(lania).
female(saya).
female(payam).
female(lano).
female(hanar).


% Who owns a house
has_house(twana).        
has_house(asma).       

% Job-related facts
job(twana, engineer).  
job(przha, teacher).   
job(balen, doctor).    
job(saya, lawyer).    
job(dyako, architect).
job(lania, nurse).    

% Pets
owns_pet(twana, max). 
owns_pet(asma, bella).


% parent rules
mother(X, Y) :- parent(X, Y), female(X).
father(X, Y) :- parent(X, Y), male(X).  


% sibling rules
brother(X, Y) :- parent(Z, X), parent(Z, Y), male(X), X \= Y.  
sister(X, Y) :- parent(Z, X), parent(Z, Y), female(X), X \= Y. 


% child rules
son(X, Y) :- parent(Y, X), male(X).       
daughter(X, Y) :- parent(Y, X), female(X).



uncle(X, Y) :- parent(Z, Y), brother(X, Z). 
aunt(X, Y) :- parent(Z, Y), sister(X, Z).  

grandparent(X, Y) :- parent(X, Z), parent(Z, Y).  
grandfather(X, Y) :- grandparent(X, Y), male(X).   
grandmother(X, Y) :- grandparent(X, Y), female(X).

cousin(X, Y) :- parent(Z, X), parent(W, Y), (brother(Z, W); sister(Z, W)), X \= Y.


% married
husband(X, Y) :- spouse(X, Y), male(X). 
wife(X, Y) :- spouse(X, Y), female(X). 



% Who owns a house
homeowner(X) :- has_house(X).           

% Check if someone owns a pet
pet_owner(X) :- owns_pet(X, _).           

