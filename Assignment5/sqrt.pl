binary_search(L,R,X,Accuracy,Result):- R-L =< Accuracy,Result is L.
binary_search(L,R,X,Accuracy,Result):- Mid is (L+R)/2,Estimate is Mid*Mid, Estimate =< X, binary_search(Mid,R,X,Accuracy,Result).
binary_search(L,R,X,Accuracy,Result):- Mid is (L+R)/2,Estimate is Mid*Mid, Estimate >= X, binary_search(L,Mid,X,Accuracy,Result).
sq_root(X,Result,Accuracy):-  binary_search(1,X,X,Accuracy,Result1), Result is Result1.