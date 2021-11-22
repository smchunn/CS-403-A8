list(Op, Ref, List) :- (
	Op='eq', findall([X, Y, Z], (pay(X, Y, Z), Z=:=Ref), List);
	Op='ne', findall([X, Y, Z], (pay(X, Y, Z), Z=\=Ref), List);
	Op='gt', findall([X, Y, Z], (pay(X, Y, Z), Z>Ref), List);
	Op='ge', findall([X, Y, Z], (pay(X, Y, Z), Z>=Ref), List);
	Op='lt', findall([X, Y, Z], (pay(X, Y, Z), Z<Ref), List);
	Op='le', findall([X, Y, Z], (pay(X, Y, Z), Z=<Ref), List)
	).
simplelist(Op, Ref, List) :- (
	Op='eq', findall(Z, (pay(X, Y, Z), Z=:=Ref), List);
	Op='ne', findall(Z, (pay(X, Y, Z), Z=\=Ref), List);
	Op='gt', findall(Z, (pay(X, Y, Z), Z>Ref), List);
	Op='ge', findall(Z, (pay(X, Y, Z), Z>=Ref), List);
	Op='lt', findall(Z, (pay(X, Y, Z), Z<Ref), List);
	Op='le', findall(Z, (pay(X, Y, Z), Z=<Ref), List)
	).
count(Op, Ref, Count) :- simplelist(Op, Ref, List),
	length(List, Count).
min(Op, Ref, Min) :- simplelist(Op, Ref, List),
	min_list(List, Min).
max(Op, Ref, Max) :- simplelist(Op, Ref, List),
	max_list(List, Max).
total(Op, Ref, Total) :- simplelist(Op, Ref, List),
	sum_list(List, Total).
avg(Op, Ref, Avg) :- total(Op, Ref, Total),
	count(Op, Ref, Count),
	Avg is Total/Count.