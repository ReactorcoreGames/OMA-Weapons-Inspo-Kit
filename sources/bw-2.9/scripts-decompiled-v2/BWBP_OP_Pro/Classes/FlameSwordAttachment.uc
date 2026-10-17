class FlameSwordAttachment extends BallisticMeleeAttachment;

simulated function PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	// End:0x35
	if(Instigator != none)
	{
		// End:0x35
		if((Owner == none) || Instigator == Owner)
		{
			LightType = 0;
		}
	}
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BWBP_OP_Pro.FlameSword'
	ImpactManager=Class'BWBP_SKC_Pro.IM_DTS'
	BrassMode=3
	InstantMode=2
	FlashMode=3
	LightMode=3
	TrackAnimMode=2
	LightType=1
	LightEffect=21
	LightHue=160
	LightSaturation=64
	LightBrightness=150.0000000
	LightRadius=64.0000000
	bDynamicLight=true
	AmbientSound=Sound'BWBP_OP_Sounds.FlameSword.FlameSword-IdleLite'
	Mesh=SkeletalMesh'BWBP_OP_Anim.FlameSword_TPm'
	RelativeLocation=(X=0.0000000,Y=-3.0000000,Z=4.0000000)
	RelativeRotation=(Pitch=32768,Yaw=1638416384,Roll=0)
	DrawScale=1.2000000
	bFullVolume=true
	SoundVolume=255
	SoundRadius=256.0000000
	TransientSoundVolume=2.0000000
	TransientSoundRadius=256.0000000
}
