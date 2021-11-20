count(Op, Ref, Count) :- (
	Op='eq', findall(Z, (pay(X, Y, Z), Z=:=Ref), List), length(List, Count);
	Op='ne', findall(Z, (pay(X, Y, Z), Z=\=Ref), List), length(List, Count);
	Op='gt', findall(Z, (pay(X, Y, Z), Z>Ref), List), length(List, Count);
	Op='ge', findall(Z, (pay(X, Y, Z), Z>=Ref), List), length(List, Count);
	Op='lt', findall(Z, (pay(X, Y, Z), Z<Ref), List), length(List, Count);
	Op='le', findall(Z, (pay(X, Y, Z), Z=<Ref), List), length(List, Count)
	).