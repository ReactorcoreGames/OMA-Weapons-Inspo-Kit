class BulldogAttachment extends BallisticAttachment;

var() Class<Actor> AltBrassClass1;
var() Class<Actor> AltBrassClass2;

simulated event PreBeginPlay()
{
	super(Actor).PreBeginPlay();
	// End:0x2E
	if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsRealism())
	{
		ImpactManager = Class'BallisticProV55.IM_MRLRocket';
		TracerClass = Class'BWBP_SKC_Pro.TraceEmitter_HMG';
	}
	//return;	
}

simulated function EjectBrass(byte Mode)
{
	local Rotator R;

	// End:0x31
	if(!Class'BCoreProV55.BallisticMod'.default.bEjectBrass || int(Level.DetailMode) < int(1))
	{
		return;
	}
	// End:0x3E
	if(BrassClass == none)
	{
		return;
	}
	// End:0x92
	if(((int(BrassMode) == int(3)) || (int(BrassMode) == int(1)) && int(Mode) == 0) || (int(BrassMode) == int(0)) && int(Mode) != 0)
	{
		return;
	}
	// End:0xDB
	if(((Instigator != none) && Instigator.IsFirstPerson()) && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		return;
	}
	// End:0x105
	if(int(Mode) == 0)
	{
		Spawn(BrassClass, self,, GetEjectorLocation(R), R);		
	}
	else
	{
		// End:0x12C
		if(int(Mode) != 0)
		{
			Spawn(AltBrassClass1, self,, GetEjectorLocation(R), R);
		}
	}
	//return;	
}

defaultproperties
{
	AltBrassClass1=Class'BWBP_SKC_Pro.Brass_FRAGSpent'
	AltBrassClass2=Class'BWBP_SKC_Pro.Brass_FRAG'
	WeaponClass=Class'BWBP_SKC_Pro.BulldogAssaultCannon'
	MuzzleFlashClass=Class'BWBP_SKC_Pro.AH104FlashEmitter'
	AltMuzzleFlashClass=Class'BWBP_SKC_Pro.AH104FlashEmitter'
	ImpactManager=Class'BWBP_SKC_Pro.IM_ExpBulletLarge'
	AltFlashBone="ejector"
	FlashScale=0.4000000
	BrassClass=Class'BWBP_SKC_Pro.Brass_BOLT'
	BrassMode=2
	FlashMode=2
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_Bulldog'
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	WaterTracerMode=2
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	CockAnimRate=0.8600000
	Mesh=SkeletalMesh'BWBP_SKC_Anim.Bulldog_TPm'
	RelativeLocation=(X=-2.0000000,Y=0.0000000,Z=5.0000000)
	RelativeRotation=(Pitch=32768,Yaw=0,Roll=0)
	DrawScale=0.3000000
}
