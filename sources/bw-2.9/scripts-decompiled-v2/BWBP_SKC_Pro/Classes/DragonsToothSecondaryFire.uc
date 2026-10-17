class DragonsToothSecondaryFire extends BallisticMeleeFire;

var float RailPower;
var bool bIsCharging;
var() array<name> SliceAnims;
var int SliceAnim;

simulated function bool HasAmmo()
{
	return true;
	//return;	
}

function float MaxRange()
{
	return TraceRange.Max;
	//return;	
}

simulated event ModeDoFire()
{
	// End:0x0D
	if(!AllowFire())
	{
		return;
	}
	bIsCharging = true;
	FireAnim = SliceAnims[SliceAnim];
	SliceAnim++;
	// End:0x44
	if(SliceAnim >= SliceAnims.Length)
	{
		SliceAnim = 0;
	}
	super.ModeDoFire();
	//return;	
}

simulated function ModeTick(float dt)
{
	super(BallisticFire).ModeTick(dt);
	// End:0x34
	if(bIsCharging)
	{
		RailPower = FMin(RailPower + (2.0000000 * dt), 1.0000000);
	}
	// End:0x61
	if((RailPower + 0.0500000) >= float(1))
	{
		DoFireEffect();
		bIsCharging = false;
		RailPower = 0.0000000;
	}
	// End:0x6E
	if(!bIsFiring)
	{
		return;
	}
	//return;	
}

function MeleeDoTrace(Vector InitialStart, Rotator Dir, bool bWallHitter, int Weight)
{
	local int i;
	local Vector End, X, HitLocation, HitNormal, Start, WaterHitLoc,
		LastHitLocation;

	local Material HitMaterial;
	local float dist;
	local Actor Other, LastOther;
	local bool bHitWall;

	dist = TraceRange.Min + (FRand() * (TraceRange.Max - TraceRange.Min));
	Start = InitialStart;
	X = Normal(Vector(Dir));
	End = Start + (X * dist);
	LastHitLocation = End;
	Weapon.bTraceWater = true;
	J0x7B:

	// End:0x412 [Loop If]
	if(dist > float(0))
	{
		Other = Trace(HitLocation, HitNormal, End, Start, true,, HitMaterial);
		dist -= VSize(HitLocation - Start);
		// End:0x10F
		if((int(Level.NetMode) == int(NM_Client)) && (int(Other.Role) != int(ROLE_Authority)) || Other.bWorldGeometry)
		{
			// [Explicit Break]
			goto J0x412;
		}
		// End:0x40C
		if(Other != none)
		{
			LastHitLocation = HitLocation;
			// End:0x1C7
			if(bWallHitter && (FluidSurfaceInfo(Other) != none) || (PhysicsVolume(Other) != none) && PhysicsVolume(Other).bWaterVolume)
			{
				// End:0x18C
				if(VSize(HitLocation - Start) > float(1))
				{
					WaterHitLoc = HitLocation;
				}
				Start = HitLocation;
				End = Start + (X * dist);
				Weapon.bTraceWater = false;
				goto J0x40F;				
			}
			else
			{
				LastHitLocation = HitLocation;
			}
			// End:0x34C
			if(!Other.bWorldGeometry && Other != LastOther)
			{
				i = 0;
				J0x1FE:

				// End:0x265 [Loop If]
				if(i < SwipeHits.Length)
				{
					// End:0x25B
					if(SwipeHits[i].Victim == Other)
					{
						// End:0x258
						if(SwipeHits[i].Weight < Weight)
						{
							SwipeHits.Remove(i, 1);
							i--;
							// [Explicit Continue]
							goto J0x25B;
						}
						// [Explicit Break]
						goto J0x265;
					}
					J0x25B:

					i++;
					// [Loop Continue]
					goto J0x1FE;
				}
				J0x265:

				// End:0x339
				if(i >= SwipeHits.Length)
				{
					SwipeHits.Length = SwipeHits.Length + 1;
					SwipeHits[SwipeHits.Length - 1].Victim = Other;
					SwipeHits[SwipeHits.Length - 1].Weight = Weight;
					SwipeHits[SwipeHits.Length - 1].HitLoc = HitLocation;
					SwipeHits[SwipeHits.Length - 1].HitDir = X;
					LastOther = Other;
					// End:0x339
					if(bWallHitter && Vehicle(Other) != none)
					{
						bHitWall = ImpactEffect(HitLocation, HitNormal, HitMaterial, Other, WaterHitLoc);
					}
				}
				// End:0x34C
				if(Mover(Other) == none)
				{
					// [Explicit Break]
					goto J0x412;
				}
			}
			// End:0x3A2
			if(Other.bWorldGeometry || Mover(Other) != none)
			{
				// End:0x39F
				if(bWallHitter)
				{
					bHitWall = ImpactEffect(HitLocation, HitNormal, HitMaterial, Other, WaterHitLoc);
				}
				// [Explicit Break]
				goto J0x412;
			}
			// End:0x406
			if((Other == Instigator) || Other == LastOther)
			{
				Start = HitLocation + ((X * Other.CollisionRadius) * float(2));
				End = Start + (X * dist);
				// [Explicit Continue]
				goto J0x40F;
			}
			// [Explicit Break]
			goto J0x412;			
		}
		else
		{
			// [Explicit Break]
			goto J0x412;
		}
		J0x40F:

		// [Loop Continue]
		goto J0x7B;
	}
	J0x412:

	// End:0x442
	if(!bHitWall && bWallHitter)
	{
		NoHitEffect(X, InitialStart, LastHitLocation, WaterHitLoc);
	}
	Weapon.bTraceWater = false;
	//return;	
}

defaultproperties
{
	SliceAnims[0]="MultiHit1"
	SliceAnims[1]="MultiHit2"
	SwipePoints[0]=(Weight=3,offset=(Pitch=0,Yaw=2560,Roll=0))
	SwipePoints[1]=(Weight=5,offset=(Pitch=0,Yaw=1500,Roll=0))
	SwipePoints[2]=(Weight=6,offset=(Pitch=0,Yaw=0,Roll=0))
	SwipePoints[3]=(Weight=4,offset=(Pitch=0,Yaw=-1500,Roll=0))
	SwipePoints[4]=(Weight=2,offset=(Pitch=0,Yaw=-3000,Roll=0))
	WallHitPoint=1
	FatiguePerStrike=0.2000000
	bCanBackstab=false
	TraceRange=(Min=165.0000000,Max=165.0000000)
	DamageType=Class'BWBP_SKC_Pro.DT_DTSChest'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_DTSHead'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_DTSLimb'
	KickForce=200
	bReleaseFireOnDie=false
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.DTS.DragonsTooth-Swipe',Volume=5.5000000,Radius=48.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	bAISilent=true
	FireAnim="Melee3"
	FireAnimRate=0.8500000
	FireRate=2.0000000
	AmmoClass=Class'BallisticProV55.Ammo_Knife'
	AmmoPerFire=0
	ShakeRotMag=(X=32.0000000,Y=256.0000000,Z=0.0000000)
	ShakeRotRate=(X=3000.0000000,Y=3000.0000000,Z=3000.0000000)
	ShakeRotTime=2.0000000
	BotRefireRate=0.7000000
	WarnTargetPct=0.8000000
}
