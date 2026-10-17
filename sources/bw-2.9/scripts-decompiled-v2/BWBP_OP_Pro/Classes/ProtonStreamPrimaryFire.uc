class ProtonStreamPrimaryFire extends BallisticProInstantFire;

var Actor LockedTarget;
var ProtonStreamer PS;
var int SuccessiveHits;

simulated function SwitchWeaponMode(byte newmode)
{
	// End:0x17
	if(int(newmode) == 1)
	{
		GotoState('PowerDrain');		
	}
	else
	{
		GotoState('None');
	}
	//return;	
}

simulated function StopFiring()
{
	super(BallisticFire).StopFiring();
	// End:0x3C
	if(int(Instigator.Role) == int(ROLE_Authority))
	{
		ProtonStreamAttachment(Weapon.ThirdPersonActor).EndStream();
	}
	//return;	
}

simulated function bool AllowFire()
{
	// End:0x65
	if(!StreamAllowFire())
	{
		// End:0x63
		if((int(Instigator.Role) == int(ROLE_Authority)) && ProtonStreamAttachment(Weapon.ThirdPersonActor).bStreamOn)
		{
			ProtonStreamAttachment(Weapon.ThirdPersonActor).EndStream();
		}
		return false;
	}
	return true;
	//return;	
}

function float MaxRange()
{
	return 1500.0000000;
	//return;	
}

simulated function bool StreamAllowFire()
{
	// End:0x0D
	if(!CheckReloading())
	{
		return false;
	}
	// End:0x76
	if(BW.AmmoAmount(0) >= AmmoClass.default.MaxAmmo)
	{
		BW.bNeedReload = BW.MayNeedReload(byte(ThisModeNum), 0.0000000);
		BW.EmptyFire(byte(ThisModeNum));
		return false;		
	}
	else
	{
		// End:0x8A
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
	local Class<DamageType> HitDT;
	local Actor Victim;
	local bool bWasAlive;

	Dmg = GetDamage(Other, HitLocation, TraceStart, Dir, Victim, HitDT);
	// End:0xA8
	if(((xPawn(Victim) != none) && Pawn(Victim).Health > 0) && Pawn(Victim).bProjTarget)
	{
		// End:0xA5
		if((Monster(Victim) == none) || Pawn(Victim).default.Health > 275)
		{
			bWasAlive = true;
		}		
	}
	else
	{
		// End:0xFF
		if(((Vehicle(Victim) != none) && Vehicle(Victim).Driver != none) && Vehicle(Victim).Driver.Health > 0)
		{
			bWasAlive = true;
		}
	}
	// End:0x153
	if(SuccessiveHits > 1)
	{
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victim, float(Min(int(Dmg + float(SuccessiveHits)), 12)), Instigator, HitLocation, vect(0.0000000, 0.0000000, 0.0000000), HitDT);		
	}
	else
	{
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victim, Dmg, Instigator, HitLocation, vect(0.0000000, 0.0000000, 0.0000000), HitDT);
	}
	// End:0x1F7
	if(bWasAlive && (Pawn(Victim).Controller == none) || !Pawn(Victim).Controller.SameTeamAs(Instigator.Controller))
	{
		ProtonStreamer(BW).BonusAmmo(1.0000000);
	}
	//return;	
}

function DoFireEffect()
{
	local Vector StartTrace;
	local Rotator Aim;

	Aim = GetFireAim(StartTrace);
	Aim = Rotator((GetFireSpread()) >> Aim);
	DoTrace(StartTrace, Aim);
	// End:0x95
	if(ProtonStreamAttachment(Weapon.ThirdPersonActor).StreamEffect == none)
	{
		ProtonStreamAttachment(Weapon.ThirdPersonActor).bUseAlt = false;
		ProtonStreamAttachment(Weapon.ThirdPersonActor).StartStream();
	}
	ApplyRecoil();
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

simulated function bool HasAmmo()
{
	return true;
	//return;	
}

state PowerDrain
{
	function StreamDoDamage(Actor Other, Vector HitLocation, Vector TraceStart, Vector Dir)
	{
		// End:0xC7
		if(((Pawn(Other) != none) && Pawn(Other).Controller != none) && !Pawn(Other).Controller.SameTeamAs(Instigator.Controller))
		{
			// End:0xC7
			if(int(Instigator.Controller.bAltFire) == 0)
			{
				LockedTarget = Other;
				ProtonStreamer(BW).DrainTarget = Pawn(Other);
				ProtonStreamAttachment(Weapon.ThirdPersonActor).SetLockedTarget(Other);
			}
		}
		// End:0xFF
		if((LockedTarget != none) && LockedTarget.bProjTarget)
		{
			ProtonStreamer(BW).BonusAmmo(1.0000000);
		}
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
		// End:0xB4
		if(ProtonStreamAttachment(Weapon.ThirdPersonActor).StreamEffect == none)
		{
			ProtonStreamAttachment(Weapon.ThirdPersonActor).bUseAlt = false;
			ProtonStreamAttachment(Weapon.ThirdPersonActor).StartStream();
		}
		ApplyRecoil();
		//return;		
	}

	function bool MaintainConnection(Vector AimVec)
	{
		// End:0xD3
		if((((int(Instigator.Controller.bAltFire) == 1) || !LockedTarget.bProjTarget) || (AimVec Dot Normal(LockedTarget.Location - Instigator.Location)) < 0.9000000) || !Weapon.FastTrace(LockedTarget.Location, Instigator.Location))
		{
			LockedTarget = none;
			ProtonStreamer(BW).DrainTarget = none;
			ProtonStreamAttachment(Weapon.ThirdPersonActor).SetLockedTarget(none);
			return false;
		}
		ProtonStreamer(BW).BonusAmmo(1.0000000);
		return true;
		//return;		
	}

	simulated function StopFiring()
	{
		super(BallisticFire).StopFiring();
		LockedTarget = none;
		ProtonStreamer(BW).DrainTarget = none;
		// End:0x58
		if(int(Instigator.Role) == int(ROLE_Authority))
		{
			ProtonStreamAttachment(Weapon.ThirdPersonActor).EndStream();
		}
		//return;		
	}
	stop;	
}

defaultproperties
{
	MaxWaterTraceRange=5000.0000000
	Damage=6.0000000
	DamageType=Class'BWBP_OP_Pro.DTProtonStreamer'
	MuzzleFlashClass=Class'BWBP_OP_Pro.ProtonFlashEmitter'
	FireRecoil=1.0000000
	FireChaos=0.0000000
	FireChaosCurve=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=0.1600000,OutVal=0.0000000),(InVal=0.2500000,OutVal=1.5000000),(InVal=0.5000000,OutVal=2.2500000),(InVal=0.7500000,OutVal=3.5000000),(InVal=1.0000000,OutVal=5.0000000)))
	bPawnRapidFireAnim=true
	FireAnim="FireLoop"
	FireRate=0.0700000
	AmmoClass=Class'BWBP_OP_Pro.Ammo_ProtonCharge'
	AmmoPerFire=0
	ShakeRotMag=(X=32.0000000,Y=8.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=1.5000000
	ShakeOffsetMag=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=1.5000000
	WarnTargetPct=0.2000000
}
