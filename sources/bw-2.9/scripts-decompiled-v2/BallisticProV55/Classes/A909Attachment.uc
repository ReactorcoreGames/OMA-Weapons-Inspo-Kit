class A909Attachment extends BallisticMeleeAttachment;

var Actor LeftOne;

simulated function PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	// End:0x38
	if(Instigator != none)
	{
		LeftOne = Spawn(Class'BallisticProV55.A909LeftBlades');
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
	super(BallisticAttachment).Destroyed();
	//return;	
}

defaultproperties
{
	MeleeOffhandStrikeAnim="Punchies_JabRight"
	MeleeAltStrikeAnim="Punchies_UppercutRight"
	WeaponClass=Class'BallisticProV55.A909SkrithBlades'
	ImpactManager=Class'BallisticProV55.IM_A909Blade'
	BrassMode=3
	InstantMode=2
	FlashMode=3
	LightMode=3
	IdleHeavyAnim="Punchies_Idle"
	IdleRifleAnim="Punchies_Idle"
	MeleeStrikeAnim="Punchies_JabLeft"
	bHeavy=true
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.A909Right_TPm'
	DrawScale=0.1500000
}
