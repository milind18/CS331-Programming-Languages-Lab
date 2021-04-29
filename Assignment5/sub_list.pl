sub_list([],[]).
sub_list([X|Y1],[X|Y2]):- sub_list(Y1,Y2).
sub_list(Y1,[_|Y2]):-sub_list(Y1,Y2).