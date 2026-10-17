class SK410PrimaryFire extends BallisticProShotgunFire;

function NoHitEffect(Vector Dir, optional Vector Start, optional Vector HitLocation, optional Vector WaterHitLoc)
{
	local Vector V;

	V = (Instigator.Location + Instigator.EyePosition()) + (Dir * TraceRange.Min);
	// End:0x124
	if(((((TracerClass != none) && int(Level.DetailMode) > int(0)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) > 0) && VSize(V - BallisticAttachment(Instigator.Weapon.ThirdPersonActor).GetModeTipLocation()) > float(200)) && FRand() < TracerChance)
	{
		Spawn(TracerClass, Instigator,, BallisticAttachment(Instigator.Weapon.ThirdPersonActor).GetModeTipLocation(), Rotator(V - BallisticAttachment(Instigator.Weapon.ThirdPersonActor).GetModeTipLocation()));
	}
	// End:0x1B0
	if((((ImpactManager != none) && WaterHitLoc != vect(0.0000000, 0.0000000, 0.0000000)) && Weapon.EffectIsRelevant(WaterHitLoc, false)) && bDoWaterSplash)
	{
		ImpactManager.static.StartSpawn(WaterHitLoc, Normal((Instigator.Location + Instigator.EyePosition()) - WaterHitLoc), 9, Instigator);
	}
	//return;	
}

simulated function bool ImpactEffect(Vector HitLocation, Vector HitNormal, Material HitMat, Actor Other, optional Vector WaterHitLoc)
{
	local int Surf;

	// End:0x8C
	if((((ImpactManager != none) && WaterHitLoc != vect(0.0000000, 0.0000000, 0.0000000)) && Weapon.EffectIsRelevant(WaterHitLoc, false)) && bDoWaterSplash)
	{
		ImpactManager.static.StartSpawn(WaterHitLoc, Normal((Instigator.Location + Instigator.EyePosition()) - WaterHitLoc), 9, Instigator);
	}
	// End:0xB4
	if(!Other.bWorldGeometry && Mover(Other) == none)
	{
		return false;
	}
	// End:0xD0
	if(!bAISilent)
	{
		Instigator.MakeNoise(1.0000000);
	}
	// End:0x23E
	if((ImpactManager != none) && Weapon.EffectIsRelevant(HitLocation, false))
	{
		// End:0x110
		if(Vehicle(Other) != none)
		{
			Surf = 3;			
		}
		else
		{
			// End:0x134
			if(HitMat == none)
			{
				Surf = int(Other.SurfaceType);				
			}
			else
			{
				Surf = int(HitMat.SurfaceType);
			}
		}
		ImpactManager.static.StartSpawn(HitLocation, HitNormal, Surf, Instigator);
		// End:0x23E
		if(((((TracerClass != none) && int(Level.DetailMode) > int(0)) && int(Class'BCoreProV55.BallisticMod'.default.EffectsDetailMode) > 0) && VSize(HitLocation - BallisticAttachment(Weapon.ThirdPersonActor).GetModeTipLocation()) > float(200)) && FRand() < TracerChance)
		{
			Spawn(TracerClass, Instigator,, BallisticAttachment(Weapon.ThirdPersonActor).GetModeTipLocation(), Rotator(HitLocation - BallisticAttachment(Weapon.ThirdPersonActor).GetModeTipLocation()));
		}
	}
	BW.TargetedHurtRadius(5.0000000, 96.0000000, DamageType, 1.0000000, HitLocation, Pawn(Other));
	return true;
	//return;	
}

simulated function DestroyEffects()
{
	// End:0x17
	if(MuzzleFlash != none)
	{
		MuzzleFlash.Destroy();
	}
	super(BallisticFire).DestroyEffects();
	//return;	
}

defaultproperties
{
	HipSpreadFactor=1.5000000
	TraceCount=7
	TracerClass=Class'BWBP_SKC_Pro.TraceEmitter_ShotgunHE'
	ImpactManager=Class'BWBP_SKC_Pro.IM_ShellHE'
	TraceRange=(Min=2048.0000000,Max=2048.0000000)
	DamageType=Class'BWBP_SKC_Pro.DT_SK410Shotgun'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_SK410ShotgunHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_SK410Shotgun'
	KickForce=1000
	BrassClass=Class'BWBP_SKC_Pro.Brass_ShotgunHE'
	BrassOffset=(X=-1.0000000,Y=0.0000000,Z=-1.0000000)
	MuzzleFlashClass=Class'BWBP_SKC_Pro.SK410HeatEmitter'
	FlashScaleFactor=0.5000000
	AimedFireAnim="SightFire"
	FireRecoil=378.0000000
	FireChaos=0.4000000
	XInaccuracy=256.0000000
	YInaccuracy=256.0000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.M781.M781-Blast',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	FireEndAnim="None"
	FireAnimRate=1.7500000
	FireRate=0.2250000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_8GaugeHE'
	ShakeRotMag=(X=48.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=640.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-10.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-200.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.9000000
	WarnTargetPct=0.5000000
}
