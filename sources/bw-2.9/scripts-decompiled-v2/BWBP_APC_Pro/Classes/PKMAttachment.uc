class PKMAttachment extends BallisticAttachment;

var BallisticWeapon myWeap;
var Vector SpawnOffset;
var bool bLoaded;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bLoaded;
}

simulated event PreBeginPlay()
{
	super(Actor).PreBeginPlay();
	//return;	
}

simulated function InstantFireEffects(byte Mode)
{
	// End:0x16
	if(int(FiringMode) != 0)
	{
		MeleeFireEffects();		
	}
	else
	{
		super.InstantFireEffects(FiringMode);
	}
	//return;	
}

simulated function MeleeFireEffects()
{
	local Vector HitLocation, Dir, Start;
	local Material HitMat;

	// End:0x19
	if(mHitLocation == vect(0.0000000, 0.0000000, 0.0000000))
	{
		return;
	}
	// End:0x110
	if(int(Level.NetMode) == int(NM_Client))
	{
		mHitActor = none;
		Start = Instigator.Location + Instigator.EyePosition();
		Dir = Normal(mHitLocation - Start);
		mHitActor = Trace(HitLocation, mHitNormal, mHitLocation + (Dir * float(10)), mHitLocation - (Dir * float(10)), false,, HitMat);
		// End:0xD3
		if((mHitActor == none) || !mHitActor.bWorldGeometry)
		{
			return;
		}
		// End:0xF7
		if(HitMat == none)
		{
			mHitSurf = int(mHitActor.SurfaceType);			
		}
		else
		{
			mHitSurf = int(HitMat.SurfaceType);
		}		
	}
	else
	{
		HitLocation = mHitLocation;
	}
	// End:0x162
	if((mHitActor == none) || (!mHitActor.bWorldGeometry && Mover(mHitActor) == none) && Vehicle(mHitActor) == none)
	{
		return;
	}
	// End:0x193
	if(!bLoaded)
	{
		Class'BallisticProV55.IM_GunHit'.static.StartSpawn(HitLocation, mHitNormal, mHitSurf, Instigator);		
	}
	else
	{
		Class'BWBP_SKC_Pro.IM_Bayonet'.static.StartSpawn(HitLocation, mHitNormal, mHitSurf, Instigator);
	}
	//return;	
}

simulated event PostNetBeginPlay()
{
	super.PostNetBeginPlay();
	// End:0x1E
	if(BallisticTurret(Instigator) != none)
	{
		bHidden = true;
	}
	//return;	
}

simulated function Vector GetModeTipLocation(optional byte Mode)
{
	local Coords C;

	// End:0x6D
	if(((Instigator != none) && Instigator.IsFirstPerson()) && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		C = Instigator.Weapon.GetBoneCoords('tip');		
	}
	else
	{
		// End:0x9A
		if(BallisticTurret(Instigator) != none)
		{
			C = Instigator.GetBoneCoords('tip');			
		}
		else
		{
			C = GetBoneCoords('tip');
		}
	}
	// End:0xEC
	if((Instigator != none) && VSize(C.Origin - Instigator.Location) > float(250))
	{
		return Instigator.Location;
	}
	return C.Origin;
	//return;	
}

simulated function Vector GetEjectorLocation(optional out Rotator EjectorAngle)
{
	local Coords C;

	// End:0x6D
	if(((Instigator != none) && Instigator.IsFirstPerson()) && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		C = Instigator.Weapon.GetBoneCoords(BrassBone);		
	}
	else
	{
		// End:0x9A
		if(BallisticTurret(Instigator) != none)
		{
			C = Instigator.GetBoneCoords(BrassBone);			
		}
		else
		{
			C = GetBoneCoords(BrassBone);
		}
	}
	// End:0x100
	if((Instigator != none) && VSize(C.Origin - Instigator.Location) > float(200))
	{
		EjectorAngle = Instigator.Rotation;
		return Instigator.Location;
	}
	// End:0x12D
	if(BallisticTurret(Instigator) != none)
	{
		EjectorAngle = Instigator.GetBoneRotation(BrassBone);		
	}
	else
	{
		EjectorAngle = GetBoneRotation(BrassBone);
	}
	return C.Origin;
	//return;	
}

simulated function FlashMuzzleFlash(byte Mode)
{
	local Rotator R;

	// End:0x54
	if(((int(FlashMode) == int(3)) || (int(FlashMode) == int(1)) && int(Mode) == 0) || (int(FlashMode) == int(0)) && int(Mode) != 0)
	{
		return;
	}
	// End:0x90
	if(Instigator.IsFirstPerson() && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		return;
	}
	// End:0x159
	if((int(Mode) != 0) && AltMuzzleFlashClass != none)
	{
		// End:0x122
		if(AltMuzzleFlash == none)
		{
			// End:0xF7
			if(BallisticTurret(Instigator) != none)
			{
				Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(AltMuzzleFlash, AltMuzzleFlashClass, DrawScale * 1.6660000, Instigator, AltFlashBone);				
			}
			else
			{
				Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(AltMuzzleFlash, AltMuzzleFlashClass, DrawScale * FlashScale, self, AltFlashBone);
			}
		}
		AltMuzzleFlash.Trigger(self, Instigator);
		// End:0x156
		if(bRandomFlashRoll)
		{
			SetBoneRotation(AltFlashBone, R, 0, 1.0000000);
		}		
	}
	else
	{
		// End:0x21F
		if((int(Mode) == 0) && MuzzleFlashClass != none)
		{
			// End:0x1EB
			if(MuzzleFlash == none)
			{
				// End:0x1C0
				if(BallisticTurret(Instigator) != none)
				{
					Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlash, MuzzleFlashClass, DrawScale * 1.6660000, Instigator, FlashBone);					
				}
				else
				{
					Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlash, MuzzleFlashClass, DrawScale * FlashScale, self, FlashBone);
				}
			}
			MuzzleFlash.Trigger(self, Instigator);
			// End:0x21F
			if(bRandomFlashRoll)
			{
				SetBoneRotation(FlashBone, R, 0, 1.0000000);
			}
		}
	}
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BWBP_APC_Pro.PKMMachinegun'
	MuzzleFlashClass=Class'BWBP_APC_Pro.PKMFlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_Bullet'
	BrassClass=Class'BallisticProV55.Brass_MG'
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_Tranq'
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	WaterTracerMode=2
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnim="Reload_MG"
	ReloadAnimRate=1.0500000
	CockAnimRate=0.8350000
	bHeavy=true
	bRapidFire=true
	Mesh=SkeletalMesh'BWBP_APC_Anim.PKMA_TPm'
	RelativeLocation=(X=-15.0000000,Y=0.0000000,Z=-15.0000000)
	DrawScale=0.1800000
	PrePivot=(X=0.0000000,Y=0.0000000,Z=-10.0000000)
}
