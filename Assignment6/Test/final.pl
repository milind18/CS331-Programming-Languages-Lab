:- dynamic start/1.
:- dynamic finish/1.
:- dynamic faultynode/1.
:- dynamic parent/2.
:- discontiguous finish/1.
:- discontiguous parent/2.
:-include('../Mazedata.pl').
reverse([],L,L).
reverse([X|XS],L,R) :- reverse(XS,L,[X|R]).

merge([],Merged,Merged).
merge([X|XS],Y,[X|XSY]):- append(XS,Y,XSY).

change_start(X):-retractall(start(_)), assert(start(X)).

change_finish(X):-retractall(finish(_)), assert(finish(X)).

add_faulty_node(X):- assert(faultynode(X)).

remove_faulty_node(Y):- retract(faultynode(Y)).

notmazelink(X,Y):- mazelink(X,Y).
query_sp(Start, Finish, Path):- retractall(parent(_)), change_start(Start), change_finish(Finish), bfs([],[Start]), create_path(Start,Finish,[Finish],Path).


create_path(Start,Start,Path,Path).
create_path(Start,Finish,CurrPath,Path):- parent(Finish,P), create_path(Start,P,[P|CurrPath],Path).

bfs(_,[]).

bfs(_, [Front|_]):- finish(Front),!.

bfs(Visited, [Front|Rest]):-
\+bagof(Neighbour, (mazelink(Front,Neighbour), \+faultynode(Neighbour), \+member(Neighbour,Visited), assert(parent(Neighbour,Front)) ),_),
bfs(Visited,Rest).

bfs(Visited, [Front|Rest]):- 
bagof(
    Neighbour, 
    (mazelink(Front,Neighbour), \+faultynode(Neighbour), \+member(Neighbour,Visited), assert(parent(Front,Neighbour)) ),
    Neighbours),

merge(Rest,Neighbours,New_Queue),
merge(Visited,Neighbours,New_Visited),
bfs(New_Visited,New_Queue).