class FP9Attachment extends BallisticAttachment;

var Actor LeftOne;

simulated function PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	// End:0x38
	if(Instigator != none)
	{
		LeftOne = Spawn(Class'BallisticProV55.FP9LeftBombAttach');
		Instigator.AttachToBone(LeftOne, 'lfarm');
	}
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(LeftOne != none)
	{
		LeftOne.Destroy();
	}
	super.Destroyed();
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BallisticProV55.FP9Explosive'
	BrassMode=3
	InstantMode=3
	FlashMode=3
	LightMode=3
	TrackAnimMode=0
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.FP9Det_TPm'
	DrawScale=0.2000000
}
