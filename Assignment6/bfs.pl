:- discontiguous faultynode/1.
:- dynamic faultynode/1.
:-include('Mazedata.pl').

faultynode(4).
retract(faultynode(3)).




