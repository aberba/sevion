module sevion.engine;

struct Engine (T)
{
	T[] ads;
	int currentIndex;
	private int step;
	 int _offset;

	void add(T)(T ad)
	{
		ads ~= ad;
	}

	void remove(T)(T ad)
	{
		import std.algorithm: filter;
		import std.array: array;
		this.ads = ads.filter!(a => a.item.id != ad.item.id).array;
	}

	void setStep(int step)
	in 
	{
		assert(step > 0 && step <= ads.length);
	}
	body 
	{
		this.step = step;
	}

	@property
	int count() { return ads.length; }

	@property
	private void offset(int offsetValue) { this._offset = offsetValue; }

	@property
	int offset() { return this._offset; }

	@property
	T[] next()
	{
		if (this.offset + this.step > this.count)
		{
			return ads[this.offset .. $];
		}
		
		this.offset = this.offset + step; 
		return ads[this.offset .. this.offset + this.step];
	}

	@property
	T[] previous()
	{
		if (this.offset + this.step < this.count)
		{
			return ads[0 .. this.offset];
		}
		
		this.offset = this.offset - this.step;
		return ads[this.offset .. this.offset - this.step];
	}
}