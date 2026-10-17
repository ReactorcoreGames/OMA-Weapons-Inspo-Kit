class FM14Attachment extends BallisticShotgunAttachment;

defaultproperties
{
	WeaponClass=Class'BWBP_APC_Pro.FM14Shotgun'
	MuzzleFlashClass=Class'BWBP_APC_Pro.FM14FlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	MeleeImpactManager=Class'BallisticProV55.IM_GunHit'
	FlashScale=1.8000000
	BrassClass=Class'BallisticProV55.Brass_Shotgun'
	TracerMode=2
	TracerClass=Class'BallisticProV55.TraceEmitter_AP'
	TracerChance=0.5000000
	MeleeStrikeAnim="Melee_swing"
	SingleFireAnim="RifleHip_FireCock"
	SingleAimedFireAnim="RifleAimed_FireCock"
	Mesh=SkeletalMesh'BWBP_OP_Anim.FM14_TPm'
	DrawScale=0.1800000
}
