class HMCPrimaryFire extends BallisticProInstantFire;

var() name ChargeAnim;
var() float ChargeRate;
var() float RailPower;
var() float PowerLevel;
var() Sound ChargeSound;
var() Sound LowFireSound;
var() Sound PowerFireSound;
var() Sound RTeamFireSound;

simulated function bool AllowFire()
{
	// End:0x36
	if((HMCBeamCannon(BW).Heat > float(0)) || HMCBeamCannon(Weapon).bLaserOn)
	{
		return false;
	}
	return super(BallisticFire).AllowFire();
	//return;	
}

simulated function PlayStartHold()
{
	// End:0x3E
	if(!HMCBeamCannon(BW).bGravitron)
	{
		BW.SafeLoopAnim(ChargeAnim, 1.0000000, TweenTime,, "IDLE");
	}
	//return;	
}

simulated event ModeHoldFire()
{
	super(WeaponFire).ModeHoldFire();
	// End:0x27
	if(HoldTime == float(0))
	{
		Instigator.AmbientSound = ChargeSound;
	}
	//return;	
}

function StopFiring()
{
	Instigator.AmbientSound = Instigator.default.AmbientSound;
	BW.SafeLoopAnim(HMCBeamCannon(BW).IdleAnim, 1.0000000, TweenTime,, "IDLE");
	HoldTime = 0.0000000;
	//return;	
}

simulated event ModeDoFire()
{
	// End:0x0D
	if(!AllowFire())
	{
		return;
	}
	// End:0x53
	if((RailPower + 0.0100000) >= PowerLevel)
	{
		HMCBeamCannon(BW).CoolRate = HMCBeamCannon(BW).default.CoolRate;
		super.ModeDoFire();		
	}
	else
	{
		HMCBeamCannon(BW).CoolRate = HMCBeamCannon(BW).default.CoolRate * float(3);
	}
	// End:0xA5
	if(BW != none)
	{
		HMCBeamCannon(BW).Heat += RailPower;
	}
	RailPower = 0.0000000;
	//return;	
}

function DoTrace(Vector InitialStart, Rotator Dir)
{
	local Vector End, X, HitLocation, HitNormal, Start, LastHitLoc;

	local Material HitMaterial;
	local float dist;
	local Actor Other, LastOther;
	local bool bHitWall;

	dist = TraceRange.Min + (FRand() * (TraceRange.Max - TraceRange.Min));
	Start = InitialStart;
	X = Normal(Vector(Dir));
	End = Start + (X * dist);
	LastHitLoc = End;
	Weapon.bTraceWater = true;
	J0x7B:

	// End:0x355 [Loop If]
	if(dist > float(0))
	{
		Other = Trace(HitLocation, HitNormal, End, Start, true,, HitMaterial);
		Weapon.bTraceWater = false;
		dist -= VSize(HitLocation - Start);
		// End:0x120
		if((int(Level.NetMode) == int(NM_Client)) && (int(Other.Role) != int(ROLE_Authority)) || Other.bWorldGeometry)
		{
			// [Explicit Break]
			goto J0x355;
		}
		// End:0x344
		if(Other != none)
		{
			// End:0x18A
			if((FluidSurfaceInfo(Other) != none) || (PhysicsVolume(Other) != none) && PhysicsVolume(Other).bWaterVolume)
			{
				bHitWall = ImpactEffect(HitLocation, HitNormal, HitMaterial, Other);
				// [Explicit Break]
				goto J0x355;
			}
			LastHitLoc = HitLocation;
			LastHitLoc = HitLocation;
			// End:0x27A
			if(!Other.bWorldGeometry && Other != LastOther)
			{
				OnTraceHit(Other, HitLocation, InitialStart, X, 0, 0, 0);
				// End:0x216
				if(Vehicle(Other) != none)
				{
					bHitWall = ImpactEffect(HitLocation, HitNormal, HitMaterial, Other);					
				}
				else
				{
					// End:0x27A
					if(Mover(Other) == none)
					{
						bHitWall = true;
						// End:0x261
						if(HitMaterial != none)
						{
							SendFireEffect(Other, HitLocation, HitNormal, int(HitMaterial.SurfaceType));							
						}
						else
						{
							SendFireEffect(Other, HitLocation, HitNormal, 0);
						}
						// [Explicit Break]
						goto J0x355;
					}
				}
			}
			// End:0x2C2
			if(Other.bWorldGeometry || Mover(Other) != none)
			{
				bHitWall = ImpactEffect(HitLocation, HitNormal, HitMaterial, Other);
				// [Explicit Break]
				goto J0x355;
			}
			// End:0x33E
			if((Other == Instigator) || Other == LastOther)
			{
				Start = HitLocation + (X * FMax(32.0000000, Other.CollisionRadius * float(2)));
				End = Start + (X * dist);
				Weapon.bTraceWater = true;
				// [Explicit Continue]
				goto J0x352;
			}
			// [Explicit Break]
			goto J0x355;			
		}
		else
		{
			LastHitLoc = End;
			// [Explicit Break]
			goto J0x355;
		}
		J0x352:

		// [Loop Continue]
		goto J0x7B;
	}
	J0x355:

	// End:0x375
	if(!bHitWall)
	{
		NoHitEffect(X, InitialStart, LastHitLoc);
	}
	// End:0x3D3
	if((HMCBeamCannon(Weapon) != none) && HMCBeamCannon(Weapon).bGravitron)
	{
		HMCBeamCannon(Weapon).TargetedSlowRadius(0.3000000, 8.0000000, 512.0000000, HitLocation, Pawn(Other));		
	}
	else
	{
		BallisticWeapon(Weapon).TargetedHurtRadius(90.0000000, 200.0000000, Class'BWBP_SKC_Pro.DTHMCBlast', 0.0000000, HitLocation, Pawn(Other));
	}
	BallisticWeapon(Weapon).TargetedHurtRadius(30.0000000, 512.0000000, Class'BWBP_SKC_Pro.DTHMCBlast', 0.0000000, HitLocation, Pawn(Other));
	//return;	
}

simulated function ModeTick(float dt)
{
	super(BallisticFire).ModeTick(dt);
	// End:0x4E
	if((HMCBeamCannon(BW).bLaserOn || !bIsFiring) || HMCBeamCannon(BW).Heat > float(0))
	{
		return;
	}
	RailPower = FMin(RailPower + (ChargeRate * dt), PowerLevel);
	// End:0xCF
	if(RailPower >= PowerLevel)
	{
		// End:0xAD
		if(!HMCBeamCannon(BW).bGravitron)
		{
			Weapon.StopFire(ThisModeNum);			
		}
		else
		{
			Instigator.AmbientSound = HMCBeamCannon(BW).FullyChargedSound;
		}
	}
	//return;	
}

static function int GetDPSec()
{
	return int(default.Damage / float(3));
	//return;	
}

defaultproperties
{
	ChargeAnim="ChargeAnim"
	ChargeRate=0.4000000
	PowerLevel=1.0000000
	ChargeSound=Sound'BWBP_SKC_Sounds.BeamCannon.Beam-Charge'
	LowFireSound=Sound'BWBP_SKC_Sounds.BeamCannon.Beam-FireLow'
	PowerFireSound=Sound'BWBP_SKC_Sounds.BeamCannon.Beam-Fire'
	RTeamFireSound=Sound'BWBP_SKC_Sounds.BeamCannon.RedBeam-Fire'
	TraceRange=(Min=50000.0000000,Max=50000.0000000)
	Damage=145.0000000
	WaterRangeAtten=0.6000000
	DamageType=Class'BWBP_SKC_Pro.DTHMCBlast'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTHMCBlastHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTHMCBlast'
	HookStopFactor=2.5000000
	PenetrateForce=400
	bPenetrate=true
	MuzzleFlashClass=Class'BWBP_SKC_Pro.HMCFlashEmitter'
	FireChaos=0.0050000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.BeamCannon.Beam-Fire',Volume=1.7000000,Radius=255.0000000,Slot=3,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	bFireOnRelease=true
	bWaitForRelease=true
	bModeExclusive=false
	FireAnim="FireLoop"
	FireEndAnim="None"
	FireRate=0.0800000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_HVPCCells'
	AmmoPerFire=40
	BotRefireRate=0.9990000
	WarnTargetPct=0.0100000
	aimerror=400.0000000
}
