class ChaffSecondaryFire extends BallisticMeleeFire;

function PlayPreFire()
{
	Weapon.SetBoneScale(0, 1.0000000, ChaffGrenadeWeapon(Weapon).GrenadeBone);
	Weapon.SetBoneScale(1, 1.0000000, ChaffGrenadeWeapon(Weapon).GrenadeBone2);
	// End:0x80
	if(ChaffGrenadeWeapon(Weapon).bPrimed)
	{
		PreFireAnim = 'PrepSmackPrimed';
		FireAnim = 'SmackPrimed';		
	}
	else
	{
		PreFireAnim = 'PrepSmack';
		FireAnim = 'Smack';
	}
	Weapon.PlayAnim(PreFireAnim, PreFireAnimRate, TweenTime);
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

	// End:0x57E [Loop If]
	if(dist > float(0))
	{
		Other = Trace(HitLocation, HitNormal, End, Start, true,, HitMaterial);
		dist -= VSize(HitLocation - Start);
		// End:0x10F
		if((int(Level.NetMode) == int(NM_Client)) && (int(Other.Role) != int(ROLE_Authority)) || Other.bWorldGeometry)
		{
			// [Explicit Break]
			goto J0x57E;
		}
		// End:0x578
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
				goto J0x57B;				
			}
			else
			{
				LastHitLocation = HitLocation;
			}
			// End:0x37A
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
				// End:0x367
				if(ChaffGrenadeWeapon(BW).bPrimed)
				{
					ChaffGrenadeWeapon(BW).ExplodeInHand();
					// [Explicit Break]
					goto J0x57E;
				}
				// End:0x37A
				if(Mover(Other) == none)
				{
					// [Explicit Break]
					goto J0x57E;
				}
			}
			// End:0x50E
			if(Other.bWorldGeometry || Mover(Other) != none)
			{
				// End:0x4B1
				if(Other.bCanBeDamaged)
				{
					i = 0;
					J0x3B7:

					// End:0x41E [Loop If]
					if(i < SwipeHits.Length)
					{
						// End:0x414
						if(SwipeHits[i].Victim == Other)
						{
							// End:0x411
							if(SwipeHits[i].Weight < Weight)
							{
								SwipeHits.Remove(i, 1);
								i--;
								// [Explicit Continue]
								goto J0x414;
							}
							// [Explicit Break]
							goto J0x41E;
						}
						J0x414:

						i++;
						// [Loop Continue]
						goto J0x3B7;
					}
					J0x41E:

					// End:0x4B1
					if(i >= SwipeHits.Length)
					{
						SwipeHits.Length = SwipeHits.Length + 1;
						SwipeHits[SwipeHits.Length - 1].Victim = Other;
						SwipeHits[SwipeHits.Length - 1].Weight = Weight;
						SwipeHits[SwipeHits.Length - 1].HitLoc = HitLocation;
						SwipeHits[SwipeHits.Length - 1].HitDir = X;
						LastOther = Other;
					}
				}
				// End:0x50B
				if(bWallHitter)
				{
					bHitWall = ImpactEffect(HitLocation, HitNormal, HitMaterial, Other, WaterHitLoc);
					// End:0x50B
					if(ChaffGrenadeWeapon(BW).bPrimed)
					{
						ChaffGrenadeWeapon(BW).ExplodeInHand();
					}
				}
				// [Explicit Break]
				goto J0x57E;
			}
			// End:0x572
			if((Other == Instigator) || Other == LastOther)
			{
				Start = HitLocation + ((X * Other.CollisionRadius) * float(2));
				End = Start + (X * dist);
				// [Explicit Continue]
				goto J0x57B;
			}
			// [Explicit Break]
			goto J0x57E;			
		}
		else
		{
			// [Explicit Break]
			goto J0x57E;
		}
		J0x57B:

		// [Loop Continue]
		goto J0x7B;
	}
	J0x57E:

	// End:0x5AE
	if(!bHitWall && bWallHitter)
	{
		NoHitEffect(X, InitialStart, LastHitLocation, WaterHitLoc);
	}
	Weapon.bTraceWater = false;
	//return;	
}

simulated event ModeDoFire()
{
	super.ModeDoFire();
	BW.GunLength = BW.default.GunLength;
	//return;	
}

simulated event ModeHoldFire()
{
	super.ModeHoldFire();
	BW.GunLength = 1.0000000;
	//return;	
}

defaultproperties
{
	SwipePoints[0]=(Weight=6,offset=(Pitch=6000,Yaw=4000,Roll=0))
	SwipePoints[1]=(Weight=5,offset=(Pitch=4500,Yaw=3000,Roll=0))
	SwipePoints[2]=(Weight=4,offset=(Pitch=3000,Yaw=0,Roll=0))
	SwipePoints[3]=(Weight=3,offset=(Pitch=1500,Yaw=1000,Roll=0))
	SwipePoints[4]=(Weight=2,offset=(Pitch=0,Yaw=0,Roll=0))
	SwipePoints[5]=(Weight=1,offset=(Pitch=-1500,Yaw=-1500,Roll=0))
	WallHitPoint=4
	TraceRange=(Min=140.0000000,Max=140.0000000)
	DamageType=Class'BWBP_SKC_Pro.DTChaffSmack'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTChaffSmack'
	DamageTypeArm=Class'BWBP_SKC_Pro.DTChaffSmack'
	bIgnoreReload=true
	bUseWeaponMag=false
	ScopeDownOn=2
	bReleaseFireOnDie=false
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Swing',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=0.8000000,bAtten=true,bNoOverride=true)
	bAISilent=true
	bFireOnRelease=true
	PreFireAnim="PrepSmack"
	FireAnim="Smack"
	PreFireAnimRate=2.0000000
	FireAnimRate=1.5000000
	TweenTime=0.0000000
	FireRate=0.7000000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_Chaff'
	AmmoPerFire=0
	ShakeRotTime=1.0000000
	ShakeOffsetMag=(X=5.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=1.0000000
	BotRefireRate=0.9000000
	WarnTargetPct=0.0500000
}
