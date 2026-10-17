class SniperFire extends InstantFire;

var() Class<xEmitter> HitEmitterClass;
var() Class<xEmitter> SecHitEmitterClass;
var() int NumArcs;
var() float SecDamageMult;
var() float SecTraceDist;
var() float HeadShotDamageMult;
var() Class<DamageType> DamageTypeHeadShot;
var(tweak) float offsetadj;

function DoTrace(Vector Start, Rotator Dir)
{
	local Vector X, Y, Z, End, HitLocation, HitNormal,
		RefNormal;

	local Actor Other, mainArcHitTarget;
	local int Damage, ReflectNum, arcsRemaining;
	local bool bDoReflect;
	local xEmitter hitEmitter;
	local Class<Actor> tmpHitEmitClass;
	local float tmpTraceRange;
	local Vector arcEnd, mainArcHit;
	local Pawn HeadShotPawn;
	local Vector EffectOffset;

	// End:0x29
	if(Class'Engine.PlayerController'.default.bSmallWeapons)
	{
		EffectOffset = Weapon.SmallEffectOffset;		
	}
	else
	{
		EffectOffset = Weapon.EffectOffset;
	}
	Weapon.GetViewAxes(X, Y, Z);
	// End:0xB0
	if(Weapon.WeaponCentered() || SniperRifle(Weapon).zoomed)
	{
		arcEnd = Instigator.Location + (EffectOffset.Z * Z);		
	}
	else
	{
		// End:0x146
		if(Weapon.hand == float(0))
		{
			// End:0x102
			if(Class'Engine.PlayerController'.default.bSmallWeapons)
			{
				arcEnd = Instigator.Location + (EffectOffset.X * X);				
			}
			else
			{
				arcEnd = (Instigator.Location + (EffectOffset.X * X)) - ((0.5000000 * EffectOffset.Z) * Z);
			}			
		}
		else
		{
			arcEnd = (((Instigator.Location + Instigator.CalcDrawOffset(Weapon)) + (EffectOffset.X * X)) + ((Weapon.hand * EffectOffset.Y) * Y)) + (EffectOffset.Z * Z);
		}
	}
	arcsRemaining = NumArcs;
	tmpHitEmitClass = HitEmitterClass;
	tmpTraceRange = TraceRange;
	ReflectNum = 0;
	J0x1E1:

	// End:0x5F5 [Loop If]
	if(true)
	{
		bDoReflect = false;
		X = Vector(Dir);
		End = Start + (tmpTraceRange * X);
		Other = Weapon.Trace(HitLocation, HitNormal, End, Start, true);
		// End:0x479
		if((Other != none) && (Other != Instigator) || ReflectNum > 0)
		{
			// End:0x2C0
			if((bReflective && Other.IsA('xPawn')) && xPawn(Other).CheckReflect(HitLocation, RefNormal, int(float(DamageMin) * 0.2500000)))
			{
				bDoReflect = true;				
			}
			else
			{
				// End:0x476
				if(Other != mainArcHitTarget)
				{
					// End:0x45D
					if(!Other.bWorldGeometry)
					{
						Damage = int(float(DamageMin + Rand(DamageMax - DamageMin)) * DamageAtten);
						// End:0x342
						if(Vehicle(Other) != none)
						{
							HeadShotPawn = Vehicle(Other).CheckForHeadShot(HitLocation, X, 1.0000000);
						}
						// End:0x38A
						if(HeadShotPawn != none)
						{
							HeadShotPawn.TakeDamage(int(float(Damage) * HeadShotDamageMult), Instigator, HitLocation, Momentum * X, DamageTypeHeadShot);							
						}
						else
						{
							// End:0x410
							if(((Pawn(Other) != none) && arcsRemaining == NumArcs) && Pawn(Other).IsHeadShot(HitLocation, X, 1.0000000))
							{
								Other.TakeDamage(int(float(Damage) * HeadShotDamageMult), Instigator, HitLocation, Momentum * X, DamageTypeHeadShot);								
							}
							else
							{
								// End:0x42B
								if(arcsRemaining < NumArcs)
								{
									Damage *= SecDamageMult;
								}
								Other.TakeDamage(Damage, Instigator, HitLocation, Momentum * X, DamageType);
							}
						}						
					}
					else
					{
						HitLocation = HitLocation + (2.0000000 * HitNormal);
					}
				}
			}			
		}
		else
		{
			HitLocation = End;
			HitNormal = Normal(Start - End);
		}
		// End:0x4A5
		if(Weapon == none)
		{
			return;
		}
		hitEmitter = xEmitter(Weapon.Spawn(tmpHitEmitClass,,, arcEnd, Rotator(HitNormal)));
		// End:0x4EE
		if(hitEmitter != none)
		{
			hitEmitter.mSpawnVecA = HitLocation;
		}
		// End:0x500
		if(HitScanBlockingVolume(Other) != none)
		{
			return;
		}
		// End:0x554
		if(arcsRemaining == NumArcs)
		{
			mainArcHit = HitLocation + (HitNormal * 2.0000000);
			// End:0x554
			if((Other != none) && !Other.bWorldGeometry)
			{
				mainArcHitTarget = Other;
			}
		}
		// End:0x5A4
		if(bDoReflect && ++ReflectNum < 4)
		{
			Start = HitLocation;
			Dir = Rotator(X - ((2.0000000 * RefNormal) * (X Dot RefNormal)));			
		}
		else
		{
			// End:0x5EF
			if(arcsRemaining > 0)
			{
				arcsRemaining--;
				Start = mainArcHit;
				Dir = Rotator(VRand());
				tmpHitEmitClass = SecHitEmitterClass;
				tmpTraceRange = SecTraceDist;
				arcEnd = mainArcHit;				
			}
			else
			{
				// [Explicit Break]
				goto J0x5F5;
			}
		}
		// [Loop Continue]
		goto J0x1E1;
	}
	J0x5F5:

	//return;	
}

function PlayFiring()
{
	super(WeaponFire).PlayFiring();
	// End:0x3B
	if(Weapon.AmmoAmount(0) > 0)
	{
		Weapon.PlayOwnedSound(Sound'WeaponSounds.LightningGun.LightningGunChargeUp', 1,,,, 1.1000000, false);
	}
	//return;	
}

defaultproperties
{
	HitEmitterClass=Class'XWeapons.NewLightningBolt'
	SecHitEmitterClass=Class'XEffects.ChildLightningBolt'
	NumArcs=3
	SecDamageMult=0.5000000
	SecTraceDist=300.0000000
	HeadShotDamageMult=2.0000000
	DamageTypeHeadShot=Class'XWeapons.DamTypeSniperHeadShot'
	DamageType=Class'XWeapons.DamTypeSniperShot'
	DamageMin=70
	DamageMax=70
	TraceRange=17000.0000000
	FireAnimRate=1.2500000
	FireSound=Sound'WeaponSounds.BaseFiringSounds.BLightningGunFire'
	FireForce="LightningGunFire"
	FireRate=1.6000000
	AmmoClass=Class'XWeapons.SniperAmmo'
	AmmoPerFire=1
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-15.0000000,Y=0.0000000,Z=10.0000000)
	ShakeOffsetRate=(X=-4000.0000000,Y=0.0000000,Z=4000.0000000)
	ShakeOffsetTime=1.6000000
	BotRefireRate=0.4000000
	WarnTargetPct=0.5000000
	aimerror=850.0000000
}
