pay(First, Last, Pay) :- commission(First, Last, Min, Sales, Crate),
	Sales*Crate>Min,
	Pay is Sales*Crate.
pay(First, Last, Pay) :- commission(First, Last, Min, Sales, Crate),
	Sales*Crate=<Min,
	Pay is Min.
pay(First, Last, Pay) :- salaried(First, Last, Sal),
	Pay is Sal.
pay(First, Last, Pay) :- hourly(First, Last, Hours, Hrate),
	Hours=<40,
	Pay is Hours*Hrate.
pay(First, Last, Pay) :- hourly(First, Last, Hours, Hrate),
	Hours>40,
	Hours=<50,
	Pay is (40*Hrate)+((Hours-40)*Hrate*(1.5)).
pay(First, Last, Pay) :- hourly(First, Last, Hours, Hrate),
	Hours>50,
	Pay is (40*Hrate)+((10)*Hrate*(1.5))+((Hours-50)*Hrate*2).