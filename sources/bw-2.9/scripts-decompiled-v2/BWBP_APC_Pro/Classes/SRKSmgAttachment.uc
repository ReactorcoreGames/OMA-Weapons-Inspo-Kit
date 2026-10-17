class SRKSmgAttachment extends BallisticAttachment;

var bool bGrenadier;
var bool bOldGrenadier;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bGrenadier;
}

simulated event PostNetReceive()
{
	// End:0x4E
	if(bGrenadier != bOldGrenadier)
	{
		bOldGrenadier = bGrenadier;
		// End:0x3C
		if(bGrenadier)
		{
			SetBoneScale(5, 1.0000000, 'Grenade');			
		}
		else
		{
			SetBoneScale(5, 0.0000000, 'Grenade');
		}
	}
	super.PostNetReceive();
	//return;	
}

function IAOverride(bool bGrenadier)
{
	// End:0x1E
	if(bGrenadier)
	{
		SetBoneScale(5, 1.0000000, 'Grenade');		
	}
	else
	{
		SetBoneScale(5, 0.0000000, 'Grenade');
	}
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BWBP_APC_Pro.SRKSubMachinegun'
	MuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	AltMuzzleFlashClass=Class'BallisticProV55.M50FlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_Bullet'
	FlashScale=0.1500000
	BrassClass=Class'BallisticProV55.Brass_Rifle'
	InstantMode=2
	FlashMode=2
	LightMode=2
	TracerClass=Class'BallisticProV55.TraceEmitter_Default'
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	WaterTracerMode=2
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnimRate=0.9000000
	CockAnimRate=0.7750000
	bRapidFire=true
	Mesh=SkeletalMesh'BWBP_APC_Anim.SRK_TPm'
	DrawScale=1.0000000
	PrePivot=(X=0.0000000,Y=-1.0000000,Z=-5.0000000)
}
