sub_list([],X).
sub_list([X|Y1],[X|Y2]):- sub_list(Y1,Y2).
sub_list(X,[_|Y]):- sub_list(X,Y).
