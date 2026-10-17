class R9000EPrimaryFire extends BallisticProInstantFire;

var FullSound IncFireSound;
var FullSound RADFireSound;

simulated function bool ImpactEffect(Vector HitLocation, Vector HitNormal, Material HitMat, Actor Other, optional Vector WaterHitLoc)
{
	// End:0x48
	if(int(BW.CurrentWeaponMode) == 1)
	{
		BW.TargetedHurtRadius(5.0000000, 96.0000000, DamageType, 1.0000000, HitLocation, Pawn(Other));
	}
	return super(BallisticInstantFire).ImpactEffect(HitLocation, HitNormal, HitMat, Other, WaterHitLoc);
	//return;	
}

function ApplyDamage(Actor Target, int Damage, Pawn Instigator, Vector HitLocation, Vector MomentumDir, Class<DamageType> DamageType)
{
	local int i;
	local R9000EActorFire Burner;

	super(BallisticInstantFire).ApplyDamage(Target, Damage, Instigator, HitLocation, MomentumDir, DamageType);
	// End:0x18B
	if(int(BW.CurrentWeaponMode) == 1)
	{
		// End:0x188
		if(((Pawn(Target) != none) && Pawn(Target).Health > 0) && Vehicle(Target) == none)
		{
			i = 0;
			J0x7E:

			// End:0xEB [Loop If]
			if(i < Target.Attached.Length)
			{
				// End:0xE1
				if(R9000EActorFire(Target.Attached[i]) != none)
				{
					R9000EActorFire(Target.Attached[i]).AddFuel(3.0000000);
					// [Explicit Break]
					goto J0xEB;
				}
				i++;
				// [Loop Continue]
				goto J0x7E;
			}
			J0xEB:

			// End:0x188
			if(i >= Target.Attached.Length)
			{
				Burner = Spawn(Class'BWBP_APC_Pro.R9000EActorFire', Target,, Target.Location + vect(0.0000000, 0.0000000, -30.0000000));
				Burner.Initialize(Target);
				// End:0x188
				if(Instigator != none)
				{
					Burner.Instigator = Instigator;
					Burner.InstigatorController = Instigator.Controller;
				}
			}
		}		
	}
	else
	{
		// End:0x1D6
		if(int(BW.CurrentWeaponMode) == 2)
		{
			// End:0x1D6
			if((Pawn(Target) != none) && Pawn(Target).bProjTarget)
			{
				TryPlague(Target);
			}
		}
	}
	//return;	
}

function TryPlague(Actor Other)
{
	local R9000EPlagueEffect RPE;

	// End:0xBD
	if(AllowPlague(Other))
	{
		// End:0x3C
		foreach Other.BasedActors(Class'BWBP_APC_Pro.R9000EPlagueEffect', RPE)
		{
			RPE.ExtendDuration(2.0000000);			
		}		
		// End:0xBD
		if(RPE == none)
		{
			RPE = Spawn(Class'BWBP_APC_Pro.R9000EPlagueEffect', Other,, Other.Location);
			RPE.Initialize(Other);
			// End:0xBD
			if(Instigator != none)
			{
				RPE.Instigator = Instigator;
				RPE.InstigatorController = Instigator.Controller;
			}
		}
	}
	//return;	
}

function bool AllowPlague(Actor Other)
{
	return ((((Pawn(Other) != none) && Pawn(Other).Health > 0) && Vehicle(Other) == none) && (Pawn(Other).GetTeamNum() == 255) || Pawn(Other).GetTeamNum() != Instigator.GetTeamNum()) && (Level.TimeSeconds - Pawn(Other).SpawnTime) > DeathMatch(Level.Game).SpawnProtectionTime;
	//return;	
}

function ServerPlayFiring()
{
	// End:0x145
	if(BallisticFireSound.Sound != none)
	{
		Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
		// End:0xD7
		if(int(BW.CurrentWeaponMode) == 1)
		{
			Weapon.PlayOwnedSound(IncFireSound.Sound, BallisticFireSound.Slot, IncFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);			
		}
		else
		{
			// End:0x145
			if(int(BW.CurrentWeaponMode) == 2)
			{
				Weapon.PlayOwnedSound(RADFireSound.Sound, BallisticFireSound.Slot, RADFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
			}
		}
	}
	CheckClipFinished();
	// End:0x1BE
	if(AimedFireAnim != 'None')
	{
		BW.SafePlayAnim(FireAnim, FireAnimRate, TweenTime,, "FIRE");
		// End:0x1BB
		if(BW.BlendFire())
		{
			BW.SafePlayAnim(AimedFireAnim, FireAnimRate, TweenTime, 1, "AIMEDFIRE");
		}		
	}
	else
	{
		// End:0x207
		if((FireCount > 0) && Weapon.HasAnim(FireLoopAnim))
		{
			BW.SafePlayAnim(FireLoopAnim, FireLoopAnimRate, 0.0000000,, "FIRE");			
		}
		else
		{
			BW.SafePlayAnim(FireAnim, FireAnimRate, TweenTime,, "FIRE");
		}
	}
	//return;	
}

function PlayFiring()
{
	// End:0x29
	if(int(ScopeDownOn) == int(1))
	{
		BW.TemporaryScopeDown(0.5000000, 0.9000000);
	}
	// End:0x9C
	if(AimedFireAnim != 'None')
	{
		BW.SafePlayAnim(FireAnim, FireAnimRate, TweenTime,, "FIRE");
		// End:0x99
		if(BW.BlendFire())
		{
			BW.SafePlayAnim(AimedFireAnim, FireAnimRate, TweenTime, 1, "AIMEDFIRE");
		}		
	}
	else
	{
		// End:0xE5
		if((FireCount > 0) && Weapon.HasAnim(FireLoopAnim))
		{
			BW.SafePlayAnim(FireLoopAnim, FireLoopAnimRate, 0.0000000,, "FIRE");			
		}
		else
		{
			BW.SafePlayAnim(FireAnim, FireAnimRate, TweenTime,, "FIRE");
		}
	}
	ClientPlayForceFeedback(FireForce);
	FireCount++;
	// End:0x261
	if(BallisticFireSound.Sound != none)
	{
		Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
		// End:0x1F3
		if(int(BW.CurrentWeaponMode) == 1)
		{
			Weapon.PlayOwnedSound(IncFireSound.Sound, BallisticFireSound.Slot, IncFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);			
		}
		else
		{
			// End:0x261
			if(int(BW.CurrentWeaponMode) == 2)
			{
				Weapon.PlayOwnedSound(RADFireSound.Sound, BallisticFireSound.Slot, RADFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
			}
		}
	}
	CheckClipFinished();
	//return;	
}

defaultproperties
{
	IncFireSound=(Sound=Sound'BW_Core_WeaponSound.FlyBys.Whizzing3',Volume=0.7000000,Radius=384.0000000,Slot=0,Pitch=1.4000000,bAtten=false,bNoOverride=false)
	RADFireSound=(Sound=Sound'BW_Core_WeaponSound.DarkStar.Dark-Fire2',Volume=0.7000000,Radius=256.0000000,Slot=0,Pitch=0.7000000,bAtten=false,bNoOverride=false)
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	Damage=100.0000000
	HeadMult=1.5000000
	LimbMult=0.9000000
	WaterRangeAtten=0.8000000
	DamageType=Class'BWBP_APC_Pro.DTR9000ERifle'
	DamageTypeHead=Class'BWBP_APC_Pro.DTR9000ERifleHead'
	DamageTypeArm=Class'BWBP_APC_Pro.DTR9000ERifle'
	KickForce=3000
	PDamageFactor=0.8000000
	BrassClass=Class'BallisticProV55.Brass_Rifle'
	bBrassOnCock=true
	BrassOffset=(X=-10.0000000,Y=1.0000000,Z=-1.0000000)
	bCockAfterFire=true
	MuzzleFlashClass=Class'BWBP_APC_Pro.R9000EFlashEmitter'
	FireRecoil=378.0000000
	FireChaos=0.5000000
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.R78.R78NS-Fire',Volume=2.0000000,Radius=1024.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	FireEndAnim="None"
	FireRate=1.1000000
	AmmoClass=Class'BWBP_APC_Pro.Ammo_42ERifle'
	ShakeRotMag=(X=400.0000000,Y=32.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-5.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.4000000
	WarnTargetPct=0.5000000
	aimerror=800.0000000
}
