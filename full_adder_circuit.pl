%     Logan Jones
%     CS 2130
%     -------------------------------------------------------------------
%     This program implements an adder circuit
%     -------------------------------------------------------------------

% nor gate facts
myxor(0,0,0).
myxor(0,1,1).
myxor(1,0,1).
myxor(1,1,0).

% nand gate facts
mynand(0,0,1).
mynand(0,1,1).
mynand(1,0,1).
mynand(1,1,0).

% and gate facts
myand(0,0,0).
myand(0,1,0).
myand(1,0,0).
myand(1,1,1).

% or gate facts
myor(0,0,0).
myor(0,1,1).
myor(1,0,1).
myor(1,1,1).

% not gate facts
mynot(0,1).
mynot(1,0).

% example circuit - from homework 2 for reference
mycircuit(X,Y,Z,F) :- myxor(X,Y,T1),
    myxor(T1,Z,T2), mynand(T1,T2,F),
    write(X),write(' '),write( Y),write(' '),write(Z),write(' '),writeln(F).

% helper circuit - half adder
helpercircuit(X,Y,F,T2) :- myor(X,Y,T1), myand(X,Y,T2),
                  mynot(T2,T3), myand(T1,T3,F).

% full adder circuit
circuit(A1,A0,B1,B0,S1,S0,Carryout) :-
    % circuit1 - return S0 - pass Cout0 to circuit3
    helpercircuit(A0,B0,S0,Cout0),
    % circuit2 - pass Sum1 to circuit3 - pass cout0 to myor
    helpercircuit(A1,B1,Sum1,Cout1),
    % circuit3 - return S1 - pass cout2 to myor
    helpercircuit(Cout0,Sum1,S1,Cout2),
    % myor for final Carryout
    myor(Cout2, Cout1, Carryout),
    % print everything
    pmath(A1, A0, B1, B0, S1, S0, Carryout).

% ------------------------------------ Not My Code -------------------------------------------
% print method provided by Dr. Huson 
pmath(A1, A0, B1, B0, S1, S0, Cout):-  write('\t'), write(A1), write(A0), write(' + '),
                     write(B1), write(B0), write(' = '), write(Cout), write(S1), writeln(S0).
% --------------------------------------------------------------------------------------------
