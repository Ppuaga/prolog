:-module(_,_,[fd]).
picos([Jose,Carlota,Maria,Antonio,Ramon]):-
	[Jose,Carlota,Maria,Antonio,Ramon] in 1..5,
	all_different([Jose,Carlota,Maria,Antonio,Ramon]),
	(
		Jose -1 .=. Carlota,Jose +1 .=.Maria;
		Jose -1 .=. Maria, Jose +1 .=. Carlota
	),
	(
		Antonio -1 .=. Carlota,Jose +1 .=.Ramon;
		Antonio -1 .=. Ramon, Jose +1 .=. Carlota
	),
	(
		Jose .=. 2, Carlota .=. 3;
		Jose .=. 3, Carlota .=. 2
	),
	labeling([Jose,Carlota,Maria,Antonio,Ramon]).