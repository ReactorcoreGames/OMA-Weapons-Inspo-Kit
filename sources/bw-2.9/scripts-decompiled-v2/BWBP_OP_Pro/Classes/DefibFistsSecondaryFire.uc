class DefibFistsSecondaryFire extends BallisticMeleeFire;

var int ElectroDamageBonus;
var int ElectroHeal;
var int RequiredBonusCharge;
var int RequiredShockwaveCharge;
var bool bCharged;
var FullSound DischargedFireSound;

simulated function bool HasAmmo()
{
	return true;
	//return;	
}

function ApplyDamage(Actor Target, int Damage, Pawn Instigator, Vector HitLocation, Vector MomentumDir, Class<DamageType> DamageType)
{
	local BallisticPawn BPawn;
	local int PrevHealth;

	// End:0x24
	if((Mover(Target) != none) || Vehicle(Target) != none)
	{
		return;
	}
	BPawn = BallisticPawn(Target);
	// End:0xFF
	if(IsValidHealTarget(BPawn))
	{
		// End:0xFF
		if(DefibFists(BW).ElectroCharge >= RequiredBonusCharge)
		{
			PrevHealth = int(BPawn.ShieldStrength);
			BPawn.GiveAttributedShield(ElectroHeal, Instigator);
			DefibFists(Weapon).PointsHealed += (BPawn.ShieldStrength - float(PrevHealth));
			DefibFists(BW).ElectroCharge -= RequiredBonusCharge;
			DefibFists(BW).LastRegen = Level.TimeSeconds + 0.5000000;
			return;
		}
	}
	// End:0x142
	if(DefibFists(Weapon).ElectroCharge >= RequiredBonusCharge)
	{
		Damage += ElectroDamageBonus;
		DefibFists(Weapon).ElectroCharge -= RequiredBonusCharge;
	}
	super(BallisticInstantFire).ApplyDamage(Target, Damage, Instigator, HitLocation, MomentumDir, DamageType);
	// End:0x1B0
	if((Pawn(Target) != none) && Pawn(Target).bProjTarget)
	{
		Pawn(Target).AddVelocity(vect(0.0000000, 0.0000000, 450.0000000));
	}
	DefibFists(BW).LastRegen = Level.TimeSeconds + float(1);
	//return;	
}

function DoFireEffect()
{
	// End:0x88
	if(DefibFists(Weapon).ElectroCharge >= RequiredShockwaveCharge)
	{
		DefibFists(Weapon).ElectroShockWave(30.0000000, 350.0000000, Class'BWBP_OP_Pro.DTShockGauntletWave', 50000.0000000, Instigator.Location);
		DefibFists(Weapon).ElectroCharge -= 30;
		DefibFistsAttachment(Weapon.ThirdPersonActor).DoWave(true);
	}
	super.DoFireEffect();
	//return;	
}

function bool IsValidHealTarget(Pawn Target)
{
	// End:0x1E
	if((Target == none) || Target == Instigator)
	{
		return false;
	}
	// End:0x34
	if(Target.Health <= 0)
	{
		return false;
	}
	// End:0x4A
	if(!Target.bProjTarget)
	{
		return false;
	}
	// End:0x69
	if(!Level.Game.bTeamGame)
	{
		return false;
	}
	// End:0x7B
	if(Vehicle(Target) != none)
	{
		return false;
	}
	return (Target.Controller != none) && Instigator.Controller.SameTeamAs(Target.Controller);
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

function ServerPlayFiring()
{
	// End:0x74
	if(DefibFists(BW).ElectroCharge < 10)
	{
		Weapon.PlayOwnedSound(DischargedFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);		
	}
	else
	{
		// End:0xDB
		if(BallisticFireSound.Sound != none)
		{
			Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
		}
	}
	CheckClipFinished();
	// End:0x12A
	if((FireCount > 0) && Weapon.HasAnim(FireLoopAnim))
	{
		BW.SafePlayAnim(FireLoopAnim, FireLoopAnimRate, 0.0000000,, "FIRE");		
	}
	else
	{
		BW.SafePlayAnim(FireAnim, FireAnimRate, TweenTime,, "FIRE");
	}
	//return;	
}

function PlayFiring()
{
	// End:0x49
	if((FireCount > 0) && Weapon.HasAnim(FireLoopAnim))
	{
		BW.SafePlayAnim(FireLoopAnim, FireLoopAnimRate, 0.0000000,, "FIRE");		
	}
	else
	{
		BW.SafePlayAnim(FireAnim, FireAnimRate, TweenTime,, "FIRE");
	}
	ClientPlayForceFeedback(FireForce);
	FireCount++;
	// End:0xF4
	if(DefibFists(BW).ElectroCharge < 10)
	{
		Weapon.PlayOwnedSound(DischargedFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);		
	}
	else
	{
		// End:0x15B
		if(BallisticFireSound.Sound != none)
		{
			Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
		}
	}
	CheckClipFinished();
	//return;	
}

defaultproperties
{
	ElectroDamageBonus=50
	ElectroHeal=25
	RequiredBonusCharge=33
	RequiredShockwaveCharge=75
	DischargedFireSound=(Sound=Sound'BW_Core_WeaponSound.M763.M763Swing',Volume=0.0000000,Radius=32.0000000,Slot=0,Pitch=0.0000000,bAtten=true,bNoOverride=false)
	FatiguePerStrike=0.1500000
	bCanBackstab=false
	TraceRange=(Min=130.0000000,Max=130.0000000)
	DamageType=Class'BWBP_OP_Pro.DTShockGauntletAlt'
	DamageTypeHead=Class'BWBP_OP_Pro.DTShockGauntletAlt'
	DamageTypeArm=Class'BWBP_OP_Pro.DTShockGauntletAlt'
	KickForce=2500
	bUseWeaponMag=false
	BallisticFireSound=(Sound=SoundGroup'BW_Core_WeaponSound.MRS38.RSS-ElectroSwing',Volume=1.0000000,Radius=32.0000000,Slot=0,Pitch=1.0000000,bAtten=true,bNoOverride=true)
	bAISilent=true
	PreFireAnim="UppercutPrep"
	FireAnim="Uppercut"
	FireAnimRate=1.5000000
	FireRate=1.0000000
	AmmoClass=Class'BWBP_OP_Pro.Ammo_DefibCharge'
	AmmoPerFire=0
	ShakeRotMag=(X=64.0000000,Y=384.0000000,Z=0.0000000)
	ShakeRotRate=(X=3500.0000000,Y=3500.0000000,Z=3500.0000000)
	ShakeRotTime=2.0000000
	BotRefireRate=0.8000000
	WarnTargetPct=0.0500000
}
