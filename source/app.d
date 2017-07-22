import std.stdio;
import sevion;
import sevion.ad: Ad;
import sevion.schema: IAdItem;

struct Tiv
{
	int tivID;
}

class TivAdItem: IAdItem
{
	Tiv tiv;

	this (Tiv tiv)
	{
		tiv = tiv;
	}

	@property
	int id() { return this.tiv.tivID; }
}


Ad[] ads;

void main()
{
	foreach (index; 0..10)
	{
		ads ~= Ad(new TivAdItem(Tiv(1)) );
	}

	auto engine = Engine!Ad(ads);
	engine.setStep(2);
	writeln(engine.next);
	writeln(engine.next);
	writeln(engine.next);
	writeln(engine.offset);
}
