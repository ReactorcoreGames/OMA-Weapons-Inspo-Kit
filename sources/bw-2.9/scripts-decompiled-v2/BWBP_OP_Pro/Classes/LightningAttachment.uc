class LightningAttachment extends BallisticAttachment;

var Vector SpawnOffset;

simulated function Vector GetModeTipLocation(optional byte Mode)
{
	local Vector X, Y, Z, loc;

	// End:0xD5
	if(Instigator.IsFirstPerson())
	{
		// End:0x85
		if(LightningRifle(Instigator.Weapon).bScopeView)
		{
			Instigator.Weapon.GetViewAxes(X, Y, Z);
			return (Instigator.Location + (X * float(20))) + (Z * float(5));			
		}
		else
		{
			loc = Instigator.Weapon.GetBoneCoords('tip').Origin + Class'BCoreProV55.BUtil'.static.AlignedOffset(Instigator.GetViewRotation(), SpawnOffset);
		}		
	}
	else
	{
		loc = GetBoneCoords('tip').Origin;
	}
	return loc;
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
	// End:0x1FC
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
		// End:0x1A4
		if(mHitActor == none)
		{
			Log("No HitActor");
			return;
		}
		// End:0x1BF
		if(Vehicle(mHitActor) != none)
		{
			mHitSurf = 3;			
		}
		else
		{
			// End:0x1E3
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
	// End:0x2C7
	if((((((int(Level.NetMode) != int(NM_Client)) && ImpactManager != none) && WaterHitLocation != vect(0.0000000, 0.0000000, 0.0000000)) && bDoWaterSplash) && int(Level.DetailMode) >= int(1)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) > 0)
	{
		ImpactManager.static.StartSpawn(WaterHitLocation, Normal((Instigator.Location + Instigator.EyePosition()) - WaterHitLocation), 9, Instigator);
	}
	// End:0x2D4
	if(mHitActor == none)
	{
		return;
	}
	// End:0x31F
	if((!mHitActor.bWorldGeometry && Mover(mHitActor) == none) && mHitActor.bProjTarget)
	{
		Spawn(Class'BallisticProV55.IE_IncBulletMetal',,, HitLocation);
		return;
	}
	// End:0x34D
	if(ImpactManager != none)
	{
		ImpactManager.static.StartSpawn(HitLocation, mHitNormal, mHitSurf, Instigator);
	}
	//return;	
}

defaultproperties
{
	SpawnOffset=(X=-200.0000000,Y=0.0000000,Z=0.0000000)
	WeaponClass=Class'BWBP_OP_Pro.LightningRifle'
	MuzzleFlashClass=Class'BWBP_OP_Pro.LightningFlashEmitter'
	ImpactManager=Class'BWBP_OP_Pro.IM_Lightning'
	FlashScale=0.8000000
	BrassClass=Class'BallisticProV55.Brass_Rifle'
	TracerMode=2
	InstantMode=2
	TracerClass=Class'BWBP_OP_Pro.TraceEmitter_Lightning'
	WaterTracerClass=Class'BallisticProV55.TraceEmitter_WaterBullet'
	WaterTracerMode=2
	FlyBySound=(Sound=SoundGroup'BW_Core_WeaponSound.FlyBys.Bullet-Whizz',Volume=0.7000000,Radius=64.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	CockAnimRate=1.4000000
	Mesh=SkeletalMesh'BWBP_OP_Anim.LightningRifle_TPm'
	DrawScale=0.6000000
}
