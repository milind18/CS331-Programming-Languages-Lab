Name: Milind B Prabhu
Roll: 180101091
Assignment 5: Prolog

Files included: sq_root.pl, sub_list.pl
Compilation and execution on a linux machine:
1. sq_root.pl: 
	$ gplc sq_root.pl
	$./sq_root

 Example test cases:
	| ?- sq_root(2,Result,0.001).

	Result = 1.41455078125 ? 

	(1 ms) yes
	| ?- sq_root(100,Result,0.001).

	Result = 10.000038623809814 ? 

	yes
 
2. sub_list.pl: 
	$ gplc sub_list.pl
	$./sublist
Example test cases:
	| ?- sub_list([a,b],[a,c,b]).

	true ? 

	yes
	| ?- sub_list([a,b,e],[a,c,b]).

	no
	| ?- 

