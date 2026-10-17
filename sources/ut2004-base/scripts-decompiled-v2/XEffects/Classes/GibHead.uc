class GibHead extends Gib
	notplaceable;

simulated function PostBeginPlay()
{
	super(Actor).PostBeginPlay();
	// End:0x59
	if(Instigator != none)
	{
		SetDrawScale(Instigator.HeadScale * DrawScale);
		SetCollisionSize(CollisionRadius * Instigator.HeadScale, CollisionHeight * Instigator.HeadScale);
	}
	//return;	
}

