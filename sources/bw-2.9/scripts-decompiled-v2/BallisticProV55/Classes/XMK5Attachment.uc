class XMK5Attachment extends BallisticAttachment;

defaultproperties
{
	WeaponClass=Class'BallisticProV55.XMK5SubMachinegun'
	MuzzleFlashClass=Class'BallisticProV55.XK2FlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_Bullet'
	AltFlashBone="tip2"
	BrassClass=Class'BallisticProV55.Brass_XMK5SMG'
	TracerClass=Class'BallisticProV55.TraceEmitter_Default'
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnimRate=0.9750000
	CockAnimRate=0.7250000
	bRapidFire=true
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.XMK5_TPm'
	RelativeLocation=(X=3.0000000,Y=0.0000000,Z=5.0000000)
	DrawScale=0.2800000
}
