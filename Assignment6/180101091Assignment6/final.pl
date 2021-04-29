
:- dynamic(start/1).
:- dynamic(finish/1).
:- dynamic(faultynode/1).
:- dynamic(parent/2).
:- discontiguous(finish/1).
:- discontiguous(parent/2).

%Including the facts in the generated file.
:-include('./Mazedata.pl').

%merge(A,B,C) is true if C = AB where A and B are two lists
merge([],Merged,Merged).
merge([X|XS],Y,[X|XSY]):- append(XS,Y,XSY).

%Rule to change the start vertex
change_start(X):-retractall(start(_)), asserta(start(X)).

%Rule to change the finish vertex
change_finish(X):-retractall(finish(_)), asserta(finish(X)).

%Rule to add faulty node
add_faulty_node(X):- asserta(faultynode(X)).

%Rule to remove faulty node
remove_faulty_node(Y):- retract(faultynode(Y)).

%Rule to query shortest path between Start and Finish
query_sp(Start, Finish, Path):- retractall(parent(_,_)), change_start(Start), change_finish(Finish), bfs([],[Start]), create_path(Start,Finish,[Finish],Path).

%Once the BFS tree is constructed, create path can be used to construct the path from start to finish.
create_path(Start,Start,Path,Path).
create_path(Start,Finish,CurrPath,Path):- parent(P,Finish), create_path(Start,P,[P|CurrPath],Path).

%bfs(Visited_List, Bfs_Queue) : Breadth first search rule 

%If the entire graph is explored terminated bfs.
bfs(_,[]).

%If the finish node is found terminate bfs.
bfs(_, [Front|_]):- finish(Front),!.

%If the front node in the queue has no neighbours continue.
bfs(Visited, [Front|Rest]):-
\+bagof(Neighbour, (mazelink(Front,Neighbour), \+faultynode(Neighbour), \+member(Neighbour,Visited) ),_),
bfs(Visited,Rest).

%If the front node in the queue has at least one neighbour update
% (i) the visited list (ii) the queue and (iii) the bfs tree by adding parent facts.
% Then recursively call bfs on the updated queue and visited list.

bfs(Visited, [Front|Rest]):- 
bagof(
    Neighbour, 
    (mazelink(Front,Neighbour), \+faultynode(Neighbour), \+member(Neighbour,Visited), asserta(parent(Front,Neighbour)) ),
    Neighbours),

merge(Rest,Neighbours,New_Queue),
merge(Visited,Neighbours,New_Visited),
bfs(New_Visited,New_Queue).
