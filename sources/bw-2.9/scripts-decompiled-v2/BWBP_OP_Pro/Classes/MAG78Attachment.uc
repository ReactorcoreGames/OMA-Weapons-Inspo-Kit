class MAG78Attachment extends BallisticMeleeAttachment;

var RSDarkSawHitSound Noise;

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
	// End:0x225
	if(Noise == none)
	{
		Noise = Spawn(Class'BallisticProV55.RSDarkSawHitSound', Instigator,, Instigator.Location);
	}
	// End:0x31B
	if((((((int(Level.NetMode) != int(NM_Client)) && ImpactManager != none) && WaterHitLocation != vect(0.0000000, 0.0000000, 0.0000000)) && bDoWaterSplash) && int(Level.DetailMode) >= int(1)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) > 0)
	{
		ImpactManager.static.StartSpawn(WaterHitLocation, Normal((Instigator.Location + Instigator.EyePosition()) - WaterHitLocation), 9, Instigator, 2);
		Noise.SetNoise(ImpactManager.default.HitSounds[mHitSurf]);
		Noise.SetLocation(WaterHitLocation);
	}
	// End:0x362
	if((mHitActor == none) || (!mHitActor.bWorldGeometry && Mover(mHitActor) == none) && Vehicle(mHitActor) == none)
	{
		return;
	}
	// End:0x3C6
	if(ImpactManager != none)
	{
		ImpactManager.static.StartSpawn(HitLocation, mHitNormal, mHitSurf, Instigator, 2);
		Noise.SetNoise(ImpactManager.default.HitSounds[mHitSurf]);
		Noise.SetLocation(HitLocation);
	}
	//return;	
}

defaultproperties
{
	MeleeAltStrikeAnim="TwoHand_StabSaw"
	WeaponClass=Class'BWBP_OP_Pro.MAG78Longsword'
	ImpactManager=Class'BallisticProV55.IM_DarkStarSaw'
	BrassMode=3
	InstantMode=2
	FlashMode=3
	LightMode=3
	TrackAnimMode=2
	IdleHeavyAnim="TwoHand_Idle"
	IdleRifleAnim="TwoHand_Idle"
	MeleeStrikeAnim="TwoHand_Slam"
	MeleeBlockAnim="TwoHand_Block"
	Mesh=SkeletalMesh'BWBP_OP_Anim.MAG78_TPm'
	RelativeLocation=(X=0.0000000,Y=-3.0000000,Z=-3.0000000)
	RelativeRotation=(Pitch=32768,Yaw=16384,Roll=0)
	DrawScale=0.2000000
}
