class XOXOSecondaryFire extends BallisticProInstantFire;

var Actor LockedTarget;
var int SuccessiveHits;

simulated function bool AllowFire()
{
	// End:0x65
	if(!StreamAllowFire())
	{
		// End:0x63
		if((int(Instigator.Role) == int(ROLE_Authority)) && XOXOAttachment(Weapon.ThirdPersonActor).bStreamOn)
		{
			XOXOAttachment(Weapon.ThirdPersonActor).EndStream();
		}
		return false;
	}
	return true;
	//return;	
}

simulated function bool StreamAllowFire()
{
	// End:0x0D
	if(!CheckReloading())
	{
		return false;
	}
	// End:0x6B
	if(BW.MagAmmo < AmmoPerFire)
	{
		BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), 0.0000000);
		BW.EmptyFire(byte(ThisModeNum));
		return false;		
	}
	else
	{
		// End:0x7F
		if(BW.bNeedReload)
		{
			return false;
		}
	}
	return true;
	//return;	
}

function StreamDoDamage(Actor Other, Vector HitLocation, Vector TraceStart, Vector Dir)
{
	local float Dmg;
	local Actor Victim;
	local bool bWasAlive;
	local Class<DamageType> HitDT;
	local Vector ClosestLocation, BoneTestLocation;

	// End:0xE7
	if((((Pawn(Other) != none) && Pawn(Other).Controller != none) && Pawn(Other).Controller.SameTeamAs(Instigator.Controller)) || (DestroyableObjective(Other) != none) && int(DestroyableObjective(Other).DefenderTeamIndex) == Instigator.GetTeamNum())
	{
		// End:0xE4
		if(int(Instigator.Controller.bFire) == 0)
		{
			LockedTarget = Other;
			XOXOAttachment(Weapon.ThirdPersonActor).SetLockedTarget(Other);
		}		
	}
	else
	{
		// End:0x195
		if((DestroyableObjective(Other.Owner) != none) && int(DestroyableObjective(Other.Owner).DefenderTeamIndex) == Instigator.GetTeamNum())
		{
			// End:0x192
			if(int(Instigator.Controller.bFire) == 0)
			{
				LockedTarget = Other.Owner;
				XOXOAttachment(Weapon.ThirdPersonActor).SetLockedTarget(Other.Owner);
			}			
		}
		else
		{
			// End:0x279
			if(Other.IsA('xPawn') && !Other.IsA('Monster'))
			{
				ClosestLocation = Other.Location;
				ClosestLocation.Z += HitLocation - Other.Location.Z;
				BoneTestLocation = Dir;
				BoneTestLocation *= VSize(ClosestLocation - HitLocation);
				BoneTestLocation *= (Normal(ClosestLocation - HitLocation) Dot Normal(HitLocation - TraceStart));
				BoneTestLocation += HitLocation;
				Dmg = GetDamage(Other, BoneTestLocation, TraceStart, Dir, Victim, HitDT);				
			}
			else
			{
				Dmg = GetDamage(Other, HitLocation, TraceStart, Dir, Victim, HitDT);
			}
			// End:0x308
			if((xPawn(Victim) != none) && Pawn(Victim).Health > 0)
			{
				// End:0x305
				if((Monster(Victim) == none) || Pawn(Victim).default.Health > 275)
				{
					bWasAlive = true;
				}				
			}
			else
			{
				// End:0x35F
				if(((Vehicle(Victim) != none) && Vehicle(Victim).Driver != none) && Vehicle(Victim).Driver.Health > 0)
				{
					bWasAlive = true;
				}
			}
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victim, float(Min(int(Dmg + float(SuccessiveHits)), 30)), Instigator, HitLocation, float(10000) * Dir, HitDT);
			// End:0x3F2
			if(bWasAlive && Pawn(Victim).Health <= 0)
			{
				Class'BWBP_OP_Pro.XOXOLewdness'.static.DistributeLewd(HitLocation, Instigator, Pawn(Victim), Weapon);
			}
		}
	}
	//return;	
}

function bool MaintainConnection(Vector AimVec)
{
	local int HealAmount;

	HealAmount = 2;
	// End:0x2A
	if(XOXOStaff(BW).bLoveMode)
	{
		HealAmount *= float(2);
	}
	// End:0xD2
	if(((int(Instigator.Controller.bFire) == 1) || (AimVec Dot Normal(LockedTarget.Location - Instigator.Location)) < 0.9000000) || !Weapon.FastTrace(LockedTarget.Location, Instigator.Location))
	{
		LockedTarget = none;
		XOXOAttachment(Weapon.ThirdPersonActor).SetLockedTarget(none);
		return false;
	}
	// End:0x1AC
	if((Pawn(LockedTarget) != none) && LockedTarget.bProjTarget)
	{
		// End:0x13C
		if(BallisticPawn(LockedTarget) != none)
		{
			BallisticPawn(LockedTarget).GiveAttributedHealth(HealAmount, int(Pawn(LockedTarget).HealthMax), Instigator);			
		}
		else
		{
			// End:0x17B
			if(Vehicle(LockedTarget) != none)
			{
				Vehicle(LockedTarget).HealDamage(HealAmount, Instigator.Controller, DamageType);				
			}
			else
			{
				Pawn(LockedTarget).GiveHealth(HealAmount, int(Pawn(LockedTarget).HealthMax));
			}
		}		
	}
	else
	{
		DestroyableObjective(LockedTarget).HealDamage(HealAmount * 3, Instigator.Controller, DamageType);
	}
	return true;
	//return;	
}

function DoFireEffect()
{
	local Vector StartTrace;
	local Rotator Aim;

	Aim = GetFireAim(StartTrace);
	Aim = Rotator((GetFireSpread()) >> Aim);
	// End:0x56
	if((LockedTarget == none) || !MaintainConnection(Vector(Aim)))
	{
		DoTrace(StartTrace, Aim);
	}
	// End:0x95
	if(XOXOAttachment(Weapon.ThirdPersonActor).StreamEffect == none)
	{
		XOXOAttachment(Weapon.ThirdPersonActor).StartStream();
	}
	ApplyRecoil();
	//return;	
}

simulated function StopFiring()
{
	super(BallisticFire).StopFiring();
	LockedTarget = none;
	// End:0x43
	if(int(Instigator.Role) == int(ROLE_Authority))
	{
		XOXOAttachment(Weapon.ThirdPersonActor).EndStream();
	}
	//return;	
}

function float MaxRange()
{
	return 1500.0000000;
	//return;	
}

function DoTrace(Vector InitialStart, Rotator Dir)
{
	local Vector End, X, HitLocation, HitNormal, Start, LastHitLoc;

	local Material HitMaterial;
	local float dist;
	local Actor Other, LastOther;
	local bool bHitWall;

	dist = MaxRange();
	Start = InitialStart;
	X = Normal(Vector(Dir));
	End = Start + (X * dist);
	LastHitLoc = End;
	Weapon.bTraceWater = true;
	J0x5B:

	// End:0x2DE [Loop If]
	if(dist > float(0))
	{
		Other = Trace(HitLocation, HitNormal, End, Start, true,, HitMaterial);
		Weapon.bTraceWater = false;
		dist -= VSize(HitLocation - Start);
		// End:0x100
		if((int(Level.NetMode) == int(NM_Client)) && (int(Other.Role) != int(ROLE_Authority)) || Other.bWorldGeometry)
		{
			// [Explicit Break]
			goto J0x2DE;
		}
		// End:0x2C6
		if(Other != none)
		{
			// End:0x171
			if((FluidSurfaceInfo(Other) != none) || (PhysicsVolume(Other) != none) && PhysicsVolume(Other).bWaterVolume)
			{
				bHitWall = ImpactEffect(HitLocation, HitNormal, HitMaterial, Other);
				SuccessiveHits = 0;
				// [Explicit Break]
				goto J0x2DE;
			}
			LastHitLoc = HitLocation;
			// End:0x26A
			if(!Other.bWorldGeometry && Other != LastOther)
			{
				StreamDoDamage(Other, HitLocation, InitialStart, X);
				// End:0x1D2
				if(Pawn(Other) != none)
				{
					SuccessiveHits++;
				}
				// End:0x206
				if(Vehicle(Other) != none)
				{
					bHitWall = ImpactEffect(HitLocation, HitNormal, HitMaterial, Other);					
				}
				else
				{
					// End:0x26A
					if(Mover(Other) == none)
					{
						bHitWall = true;
						// End:0x251
						if(HitMaterial != none)
						{
							SendFireEffect(Other, HitLocation, HitNormal, int(HitMaterial.SurfaceType));							
						}
						else
						{
							SendFireEffect(Other, HitLocation, HitNormal, 0);
						}
						// [Explicit Break]
						goto J0x2DE;
					}
				}
			}
			// End:0x2B9
			if(Other.bWorldGeometry || Mover(Other) != none)
			{
				bHitWall = ImpactEffect(HitLocation, HitNormal, HitMaterial, Other);
				SuccessiveHits = 0;
				// [Explicit Break]
				goto J0x2DE;
			}
			SuccessiveHits = 0;
			// [Explicit Break]
			goto J0x2DE;			
		}
		else
		{
			LastHitLoc = End;
			SuccessiveHits = 0;
			// [Explicit Break]
			goto J0x2DE;
		}
		// [Loop Continue]
		goto J0x5B;
	}
	J0x2DE:

	// End:0x2FE
	if(!bHitWall)
	{
		NoHitEffect(X, InitialStart, LastHitLoc);
	}
	//return;	
}

defaultproperties
{
	MaxWaterTraceRange=5000.0000000
	DamageType=Class'BWBP_OP_Pro.DTXOXOStream'
	DamageTypeHead=Class'BWBP_OP_Pro.DTXOXOStream'
	DamageTypeArm=Class'BWBP_OP_Pro.DTXOXOStream'
	MuzzleFlashClass=Class'BWBP_OP_Pro.XOXOFlashEmitter'
	FireChaos=0.0000000
	FireChaosCurve=(Points=((InVal=0.0000000,OutVal=1.0000000),(InVal=0.1600000,OutVal=1.0000000),(InVal=0.2500000,OutVal=1.5000000),(InVal=0.5000000,OutVal=2.2500000),(InVal=0.7500000,OutVal=3.5000000),(InVal=1.0000000,OutVal=5.0000000)))
	bPawnRapidFireAnim=true
	FireAnim="SecFireLoop"
	FireEndAnim="SecFireEnd"
	FireRate=0.0700000
	AmmoClass=Class'BWBP_OP_Pro.Ammo_XOXO'
	ShakeRotMag=(X=48.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=640.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-5.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-100.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	WarnTargetPct=0.2000000
}
