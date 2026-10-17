class HVPCMk66Attachment extends BallisticAttachment;

var Actor Pack;
var bool bDischarge;
var bool bDischargeOld;
var byte ChargePower;
var HVPCMk66PlasmaCannon LG;
var Actor Arc1;
var Actor Arc2;
var Actor Arc3;
var() Sound DischargeSound;

replication
{
	// Pos:0x000
	reliable if((int(Role) == int(ROLE_Authority)) && bNetDirty)
		ChargePower, bDischarge;

	// Pos:0x018
	reliable if(((int(Role) == int(ROLE_Authority)) && bNetOwner) && bNetInitial)
		LG;
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

function InitFor(Inventory i)
{
	super.InitFor(i);
	// End:0x38
	if((i != none) && HVPCMk66PlasmaCannon(i) != none)
	{
		LG = HVPCMk66PlasmaCannon(i);
	}
	//return;	
}

simulated function StartMuzzleZap()
{
	// End:0x36
	if(MuzzleFlash == none)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlash, Class'BWBP_SKC_Pro.HVPCMuzzleFlash', DrawScale * FlashScale, self, 'tip');
	}
	//return;	
}

simulated function StopMuzzleZap()
{
	// End:0x26
	if(MuzzleFlash != none)
	{
		Emitter(MuzzleFlash).Kill();
		MuzzleFlash = none;
	}
	//return;	
}

simulated function PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	Pack = Spawn(Class'BWBP_SKC_Pro.HVPCPack');
	// End:0x38
	if(Instigator != none)
	{
		Instigator.AttachToBone(Pack, 'spine');
	}
	Pack.SetBoneScale(0, 0.0001000, 'Bone03');
	// End:0xF8
	if(int(Level.DetailMode) > int(1))
	{
		// End:0x9A
		if(Arc1 == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(Arc1, Class'BWBP_SKC_Pro.HVPCMk5_SideArc', DrawScale, self, 'Arc1');
		}
		// End:0xC9
		if(Arc2 == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(Arc2, Class'BWBP_SKC_Pro.HVPCMk66_TopArc', DrawScale, self, 'Arc2');
		}
		// End:0xF8
		if(Arc3 == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(Arc3, Class'BWBP_SKC_Pro.HVPCMk66_TopArc', DrawScale, self, 'Arc3');
		}
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
	// End:0x2E
	if(MuzzleFlash != none)
	{
		MuzzleFlash.Destroy();
	}
	// End:0x45
	if(Arc1 != none)
	{
		Arc1.Destroy();
	}
	// End:0x5C
	if(Arc2 != none)
	{
		Arc2.Destroy();
	}
	// End:0x73
	if(Arc3 != none)
	{
		Arc3.Destroy();
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

simulated function InstantFireEffects(byte Mode)
{
	local Vector HitLocation, Dir, Start;
	local Material HitMat;

	// End:0x0F
	if(int(Mode) == 0)
	{
		return;
	}
	// End:0x28
	if(mHitLocation == vect(0.0000000, 0.0000000, 0.0000000))
	{
		return;
	}
	SpawnTracer(Mode, mHitLocation);
	// End:0x4A
	if(VSize(mHitLocation) < float(2))
	{
		return;
	}
	// End:0x141
	if(int(Level.NetMode) == int(NM_Client))
	{
		mHitActor = none;
		Start = Instigator.Location + Instigator.EyePosition();
		// End:0xB9
		if(int(WallPenetrates) != 0)
		{
			WallPenetrates = 0;
			DoWallPenetrate(Mode, Start, mHitLocation);
		}
		Dir = Normal(mHitLocation - Start);
		bTraceWater = true;
		mHitActor = Trace(HitLocation, mHitNormal, mHitLocation + (Dir * float(10)), mHitLocation - (Dir * float(10)), false,, HitMat);
		bTraceWater = false;
		// End:0x13E
		if(mHitActor == none)
		{
			HitLocation = mHitLocation;
			mHitNormal = -Dir;
		}		
	}
	else
	{
		HitLocation = mHitLocation;
	}
	// End:0x17A
	if(ImpactManager != none)
	{
		ImpactManager.static.StartSpawn(HitLocation, mHitNormal, mHitSurf, Instigator);
	}
	//return;	
}

defaultproperties
{
	DischargeSound=Sound'BW_Core_WeaponSound.LightningGun.LG-WaterDischarge'
	WeaponClass=Class'BWBP_SKC_Pro.HVPCMk66PlasmaCannon'
	MuzzleFlashClass=Class'BWBP_SKC_Pro.BFGFlashEmitter'
	AltMuzzleFlashClass=Class'BallisticProV55.RSNovaFastMuzzleFlash'
	ImpactManager=Class'BallisticProV55.IM_HVCRedLightning'
	bDoWaterSplash=false
	FlashScale=1.5000000
	FlashMode=2
	TracerClass=Class'BallisticProV55.TraceEmitter_HVCRedLightning'
	bHeavy=true
	bRapidFire=true
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.HVC_TPm'
	DrawScale=0.1500000
	Skins[0]=Texture'BWBP_SKC_Tex.BFG.BFG-Skin'
	Skins[1]=FinalBlend'BW_Core_WeaponTex.Lighter.LightGlassFinal'
}
