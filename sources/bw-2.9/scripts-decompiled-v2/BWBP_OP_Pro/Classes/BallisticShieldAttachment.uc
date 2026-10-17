class BallisticShieldAttachment extends BallisticMeleeAttachment;

var Actor ShieldWeapon;

simulated function PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	// End:0x38
	if(Instigator != none)
	{
		ShieldWeapon = Spawn(Class'BWBP_OP_Pro.BallisticShieldHammer');
		Instigator.AttachToBone(ShieldWeapon, 'righthand');
	}
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(ShieldWeapon != none)
	{
		ShieldWeapon.Destroy();
	}
	super(BallisticAttachment).Destroyed();
	//return;	
}

defaultproperties
{
	MeleeAltStrikeAnim="Blade_Swing"
	WeaponClass=Class'BWBP_OP_Pro.BallisticShieldWeapon'
	ImpactManager=Class'BallisticProV55.IM_GunHit'
	BrassMode=3
	InstantMode=2
	FlashMode=3
	LightMode=3
	TrackAnimMode=2
	MeleeStrikeAnim="Blade_Smack"
	MeleeBlockAnim="Blade_ShieldBlock"
	AttachmentBone="bip01 l hand"
	Mesh=SkeletalMesh'BWBP_OP_Anim.BallisticShield_TPm'
	RelativeLocation=(X=-10.0000000,Y=0.0000000,Z=0.0000000)
	RelativeRotation=(Pitch=25000,Yaw=-16384,Roll=0)
	DrawScale=0.4500000
}
