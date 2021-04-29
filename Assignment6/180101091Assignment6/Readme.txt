Name: Milind B Prabhu
Roll: 1810101091
Assignment 6

Files included: final.pl

1. First generate the Mazedata.pl and place it in this folder (an example "Mazedata.pl" is already in the folder).
2. Compile final.pl using the following command:
$ gplc final.pl

3. Then execute it:
$ ./final

4. There are three types of queries you can make:
i) Querying for the shortest path: query_sp(Start,Finish,Path). For example:
| ?- query_sp(11,99,Path).

Path = [11,12,13,33,53,54,55,75,76,77,97,98,99] ? 

(5 ms) yes

If the path does not exist the output is no.
| ?- query_sp(21,99,P). 

no


ii) Adding a faulty node: add_faulty_node(Node). For example:
| ?- add_faulty_node(76).

yes

iii) Remove a faulty node: remove_faulty_node(Node). For example:
| ?- remove_faulty_node(3).

(1 ms) yes




