class D49Attachment extends HandgunAttachment;

var byte RevolverBrass;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		RevolverBrass;
}

simulated event PostNetReceive()
{
	// End:0x39
	if(int(RevolverBrass) > 0)
	{
		// End:0x26
		if(int(RevolverBrass) > 127)
		{
			RevolverBrass -= byte(128);
		}
		RevolverEjectBrass(RevolverBrass);
		RevolverBrass = 0;
	}
	super(BallisticAttachment).PostNetReceive();
	//return;	
}

simulated function InstantFireEffects(byte Mode)
{
	local Vector HitLocation, Dir, Start, X, Y, Z;

	local Material HitMat;

	// End:0x54
	if(((int(InstantMode) == int(3)) || (int(InstantMode) == int(1)) && int(Mode) == 0) || (int(InstantMode) == int(0)) && int(Mode) != 0)
	{
		return;
	}
	// End:0x6D
	if(mHitLocation == vect(0.0000000, 0.0000000, 0.0000000))
	{
		return;
	}
	// End:0x7A
	if(Instigator == none)
	{
		return;
	}
	SpawnTracer(Mode, mHitLocation);
	FlyByEffects(Mode, mHitLocation);
	// End:0x1ED
	if(int(Level.NetMode) == int(NM_Client))
	{
		mHitActor = none;
		Start = Instigator.Location + Instigator.EyePosition();
		// End:0x109
		if(int(WallPenetrates) != 0)
		{
			WallPenetrates = 0;
			DoWallPenetrate(Mode, Start, mHitLocation);
		}
		Dir = Normal(mHitLocation - Start);
		mHitActor = Trace(HitLocation, mHitNormal, mHitLocation + (Dir * float(10)), mHitLocation - (Dir * float(10)), false,, HitMat);
		// End:0x188
		if((ImpactManager != none) && bDoWaterSplash)
		{
			DoWaterTrace(int(Mode), Start, mHitLocation);
		}
		// End:0x195
		if(mHitActor == none)
		{
			return;
		}
		// End:0x1B0
		if(Vehicle(mHitActor) != none)
		{
			mHitSurf = 3;			
		}
		else
		{
			// End:0x1D4
			if(HitMat == none)
			{
				mHitSurf = int(mHitActor.SurfaceType);				
			}
			else
			{
				mHitSurf = int(HitMat.SurfaceType);
			}
		}		
	}
	else
	{
		HitLocation = mHitLocation;
	}
	// End:0x2B8
	if((((((int(Level.NetMode) != int(NM_Client)) && ImpactManager != none) && WaterHitLocation != vect(0.0000000, 0.0000000, 0.0000000)) && bDoWaterSplash) && int(Level.DetailMode) >= int(1)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) > 0)
	{
		ImpactManager.static.StartSpawn(WaterHitLocation, Normal((Instigator.Location + Instigator.EyePosition()) - WaterHitLocation), 9, Instigator);
	}
	// End:0x2FF
	if((mHitActor == none) || (!mHitActor.bWorldGeometry && Mover(mHitActor) == none) && Vehicle(mHitActor) == none)
	{
		return;
	}
	// End:0x3A0
	if(ImpactManager != none)
	{
		ImpactManager.static.StartSpawn(HitLocation, mHitNormal, mHitSurf, Instigator);
		// End:0x3A0
		if(int(Mode) > 0)
		{
			GetAxes(Instigator.GetViewRotation(), X, Y, Z);
			ImpactManager.static.StartSpawn(HitLocation + ((Y Cross mHitNormal) * (float(-4) - (FRand() * float(4)))), mHitNormal, mHitSurf, Instigator, 2);
		}
	}
	//return;	
}

simulated function RevolverEjectBrass(byte Num)
{
	local int i;
	local Rotator R;

	// End:0x3F
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0x2C
		if(int(RevolverBrass) > 127)
		{
			RevolverBrass = Num;			
		}
		else
		{
			RevolverBrass = byte(int(Num) + 128);
		}
	}
	// End:0x5A
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	// End:0xA3
	if(((Instigator != none) && Instigator.IsFirstPerson()) && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		return;
	}
	// End:0xD4
	if(!Class'BCoreProV55.BallisticMod'.default.bEjectBrass || int(Level.DetailMode) < int(1))
	{
		return;
	}
	i = 0;
	J0xDB:

	// End:0x11A [Loop If]
	if(i < int(Num))
	{
		Spawn(BrassClass, self,, (GetEjectorLocation(R)) + (VRand() * float(2)), R);
		i++;
		// [Loop Continue]
		goto J0xDB;
	}
	//return;	
}

simulated function EjectBrass(byte Mode)
{
	//return;	
}

simulated function FlashMuzzleFlash(byte Mode)
{
	local Rotator R;

	// End:0x3C
	if(Instigator.IsFirstPerson() && PlayerController(Instigator.Controller).ViewTarget == Instigator)
	{
		return;
	}
	// End:0x57
	if(bRandomFlashRoll)
	{
		R.Roll = Rand(65536);
	}
	// End:0xDB
	if((int(Mode) != 0) && AltMuzzleFlashClass != none)
	{
		// End:0xA7
		if(AltMuzzleFlash == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(AltMuzzleFlash, AltMuzzleFlashClass, DrawScale * FlashScale, self, AltFlashBone);
		}
		AltMuzzleFlash.Trigger(self, Instigator);
		// End:0xDB
		if(bRandomFlashRoll)
		{
			SetBoneRotation(AltFlashBone, R, 0, 1.0000000);
		}
	}
	// End:0x150
	if(MuzzleFlashClass != none)
	{
		// End:0x11C
		if(MuzzleFlash == none)
		{
			Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlash, MuzzleFlashClass, DrawScale * FlashScale, self, FlashBone);
		}
		MuzzleFlash.Trigger(self, Instigator);
		// End:0x150
		if(bRandomFlashRoll)
		{
			SetBoneRotation(FlashBone, R, 0, 1.0000000);
		}
	}
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BallisticProV55.D49Revolver'
	MuzzleFlashClass=Class'BallisticProV55.D49FlashEmitter'
	AltMuzzleFlashClass=Class'BallisticProV55.D49FlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_BigBullet'
	BrassClass=Class'BallisticProV55.Brass_Magnum'
	TracerMode=2
	InstantMode=2
	FlashMode=2
	LightMode=2
	TracerClass=Class'BallisticProV55.TraceEmitter_Pistol'
	TracerChance=0.6000000
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	WaterTracerMode=2
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnimRate=0.5000000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.D49_TPm'
	DrawScale=0.1500000
}
