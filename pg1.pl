%     Logan Jones
%     CS 2130 – 11:31 am
%     Assignment #1
%     Dr. Huson
%     Due:05/09/25
%     Filename: pg1.pl
%     Student discussions: None
%     -------------------------------------------------------------------
%     Program is used to see if there are airline flights between cities
%     -------------------------------------------------------------------

% flight facts
flight_from_to(dgz,qyy).
flight_from_to(dgz,azi).
flight_from_to(qyy,csi).
flight_from_to(azi,tva).
flight_from_to(csi,ppg).
flight_from_to(tva,brw).
flight_from_to(brw,csi).

% flight rules
route(From,To,Stops) :- flight_from_to(From,To), Stops is 0.
route(From,To,Stops) :- flight_from_to(From, Connection), route(Connection, To, Connecting_stops),Stops is Connecting_stops + 1,
% print connections
write("\nStop "), write(Stops), write(" "), write(Connection).
