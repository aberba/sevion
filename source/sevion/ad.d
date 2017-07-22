module sevion.ad;

import sevion.schema: IAdItem;

struct Ad
{
	IAdItem item;
	bool isPublished;

	int id;
	int addedOn;
	int expireOn;
	int priority;

	this(IAdItem itemValue)
	{
		item = itemValue;
	}
}