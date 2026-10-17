class LonghornAttachment extends BallisticAttachment;

defaultproperties
{
	WeaponClass=Class'BWBP_SKC_Pro.LonghornLauncher'
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	AltMuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_Bullet'
	BrassClass=Class'BWBP_SKC_Pro.Brass_Longhorn'
	InstantMode=2
	FlashMode=2
	LightMode=2
	TracerClass=Class'BallisticProV55.TraceEmitter_Default'
	TracerMix=-3
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	WaterTracerMode=2
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	CockAnimRate=1.2200000
	bRapidFire=true
	bAltRapidFire=true
	Mesh=SkeletalMesh'BWBP_SKC_Anim.Longhorn_TPm'
	RelativeRotation=(Pitch=32768,Yaw=0,Roll=0)
	DrawScale=0.3000000
}
