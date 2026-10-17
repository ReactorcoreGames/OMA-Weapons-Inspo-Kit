class Supercharger_Attachment extends BallisticAttachment;

var Actor Pack;

simulated function PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	Pack = Spawn(Class'BallisticProV55.HVCMk9Pack');
	// End:0x38
	if(Instigator != none)
	{
		Instigator.AttachToBone(Pack, 'spine');
	}
	Pack.SetBoneScale(0, 0.0001000, 'Bone03');
	//return;	
}

simulated function SetOverlayMaterial(Material mat, float Time, bool bOverride)
{
	super(Actor).SetOverlayMaterial(mat, Time, bOverride);
	// End:0x40
	if(Pack != none)
	{
		Pack.SetOverlayMaterial(mat, Time, bOverride);
	}
	//return;	
}

simulated function Hide(bool NewbHidden)
{
	super(xWeaponAttachment).Hide(NewbHidden);
	// End:0x2D
	if(Pack != none)
	{
		Pack.bHidden = NewbHidden;
	}
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(Pack != none)
	{
		Pack.Destroy();
	}
	super.Destroyed();
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BWBP_SKC_Pro.Supercharger_AssaultWeapon'
	MuzzleFlashClass=Class'BWBP_SKC_Pro.PlasmaFlashEmitter'
	ImpactManager=Class'BWBP_SKC_Pro.IM_Supercharge'
	FlashScale=0.2000000
	InstantMode=2
	FlashMode=2
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_Supercharge'
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	FlyBySound=(Sound=Sound'BWBP_SKC_Sounds.LS14.Gauss-FlyBy',Volume=0.3000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	bRapidFire=true
	bAltRapidFire=true
	Mesh=SkeletalMesh'BWBP_SKC_Anim.SuperCharger_TPm'
	RelativeRotation=(Pitch=32768,Yaw=0,Roll=0)
	DrawScale=1.1000000
}
