class HVPCMk5Attachment extends BallisticAttachment;

var Actor Pack;
var bool bDischarge;
var bool bDischargeOld;
var bool bMilSpec;
var() Sound DischargeSound;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bDischarge;
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

function InitFor(Inventory i)
{
	super.InitFor(i);
	// End:0x50
	if((HVPCMk5PlasmaCannon(i) != none) && HVPCMk5PlasmaCannon(i).bMilSpec)
	{
		// End:0x50
		if(Pack != none)
		{
			Pack.bHidden = true;
		}
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

simulated event PreBeginPlay()
{
	super(Actor).PreBeginPlay();
	// End:0x2D
	if(bMilSpec && Pack != none)
	{
		Pack.bHidden = true;
	}
	//return;	
}

simulated event PostNetReceive()
{
	// End:0x24
	if(bDischarge != bDischargeOld)
	{
		bDischargeOld = bDischarge;
		DoWaterDischarge();
	}
	super.PostNetReceive();
	//return;	
}

simulated function PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	// End:0x11
	if(bMilSpec)
	{
		return;
	}
	Pack = Spawn(Class'BWBP_SKC_Pro.HVPCPack');
	// End:0x43
	if(Instigator != none)
	{
		Instigator.AttachToBone(Pack, 'spine');
	}
	Pack.SetBoneScale(0, 0.0001000, 'Bone03');
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(Pack != none)
	{
		Pack.Destroy();
	}
	// End:0x2E
	if(MuzzleFlash != none)
	{
		MuzzleFlash.Destroy();
	}
	super.Destroyed();
	//return;	
}

simulated function DoWaterDischarge()
{
	// End:0x1F
	if(int(Role) == int(ROLE_Authority))
	{
		bDischarge = !bDischarge;
	}
	// End:0x3A
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	Spawn(Class'BallisticProV55.IE_HVCDischarge', Instigator,, Instigator.Location);
	Instigator.PlaySound(DischargeSound, 0, 1.8000000,, 192.0000000, 1.0000000, false);
	//return;	
}

defaultproperties
{
	DischargeSound=Sound'BW_Core_WeaponSound.LightningGun.LG-WaterDischarge'
	WeaponClass=Class'BWBP_SKC_Pro.HVPCMk5PlasmaCannon'
	MuzzleFlashClass=Class'BallisticProV55.HVCMk9RedMuzzleFlash'
	AltMuzzleFlashClass=Class'BWBP_SKC_Pro.HVPCMuzzleFlash'
	ImpactManager=Class'BallisticProV55.IM_HVCRedLightning'
	bDoWaterSplash=false
	FlashScale=0.7500000
	FlashMode=2
	TracerClass=Class'BallisticProV55.TraceEmitter_HVCRedLightning'
	ReloadAnimRate=0.7500000
	bHeavy=true
	bRapidFire=true
	Mesh=SkeletalMesh'BWBP_SKC_Anim.HVPC_TPm'
	RelativeRotation=(Pitch=32768,Yaw=0,Roll=0)
	DrawScale=1.0000000
}
