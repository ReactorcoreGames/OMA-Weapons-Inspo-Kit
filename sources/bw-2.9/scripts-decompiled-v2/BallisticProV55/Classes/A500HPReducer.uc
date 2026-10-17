class A500HPReducer extends Inventory;

var int baseHealthMax;
var int baseSuperHealthMax;
var int StackCount;

function GiveTo(Pawn Other, optional Pickup Pickup)
{
	super.GiveTo(Other, Pickup);
	baseHealthMax = int(Other.HealthMax);
	baseSuperHealthMax = int(Other.SuperHealthMax);
	//return;	
}

function AddStack(int Count)
{
	StackCount += Count;
	Instigator.HealthMax = float(Max(50, baseHealthMax - (StackCount * 5)));
	Instigator.SuperHealthMax = float(Max(75, baseHealthMax - (StackCount * 5)));
	SetTimer(5.0000000, false);
	//return;	
}

function Timer()
{
	// End:0x65
	if(StackCount > 0)
	{
		--StackCount;
		Instigator.HealthMax = float(Max(50, baseHealthMax - (StackCount * 5)));
		Instigator.SuperHealthMax = float(Max(75, baseSuperHealthMax - (StackCount * 5)));
		SetTimer(0.5000000, false);
	}
	// End:0x73
	if(StackCount == 0)
	{
		Destroy();
	}
	//return;	
}

