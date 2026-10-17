class R78Attachment extends BallisticAttachment;

simulated function Vector GetModeTipLocation(optional byte Mode)
{
	local Coords C;
	local Vector X, Y, Z;

	// End:0xAB
	if(Instigator.IsFirstPerson())
	{
		// End:0x85
		if(R78Rifle(Instigator.Weapon).bScopeView)
		{
			Instigator.Weapon.GetViewAxes(X, Y, Z);
			return (Instigator.Location + (X * float(20))) + (Z * float(5));			
		}
		else
		{
			C = Instigator.Weapon.GetBoneCoords('tip');
		}		
	}
	else
	{
		C = GetBoneCoords('tip');
	}
	return C.Origin;
	//return;	
}

simulated function InstantFireEffects(byte Mode)
{
	local Vector HitLocation, Dir, Start;
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
		mHitActor = Trace(HitLocation, mHitNormal, mHitLocation + (Dir * float(10)), mHitLocation - (Dir * float(10)), true,, HitMat);
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
	// End:0x2C5
	if(mHitActor == none)
	{
		return;
	}
	// End:0x310
	if((!mHitActor.bWorldGeometry && Mover(mHitActor) == none) && mHitActor.bProjTarget)
	{
		Spawn(Class'BallisticProV55.IE_IncBulletMetal',,, HitLocation);
		return;
	}
	// End:0x33E
	if(ImpactManager != none)
	{
		ImpactManager.static.StartSpawn(HitLocation, mHitNormal, mHitSurf, Instigator);
	}
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BallisticProV55.R78Rifle'
	MuzzleFlashClass=Class'BallisticProV55.R78FlashEmitter'
	ImpactManager=Class'BallisticProV55.IM_Bullet'
	BrassClass=Class'BallisticProV55.Brass_Rifle'
	TracerClass=Class'BallisticProV55.TraceEmitter_Default'
	TracerChance=0.0000000
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	WaterTracerMode=2
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	ReloadAnimRate=0.6500000
	CockAnimRate=1.2500000
	Mesh=SkeletalMesh'BW_Core_WeaponAnim.R78_TPm'
	DrawScale=0.2000000
}
