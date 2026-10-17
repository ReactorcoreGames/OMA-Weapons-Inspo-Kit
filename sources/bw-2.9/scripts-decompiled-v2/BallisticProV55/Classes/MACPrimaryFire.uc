class MACPrimaryFire extends BallisticProProjectileFire;

simulated function LaunchBeacon(optional byte i)
{
	local Vector StartTrace, X, Y, Z, Start, End,
		HitLocation, HitNormal;

	local Rotator Aim;
	local Actor Other;

	Weapon.GetViewAxes(X, Y, Z);
	Start = Instigator.Location + Instigator.EyePosition();
	StartTrace = (Start + (X * SpawnOffset.X)) + (Z * SpawnOffset.Z);
	// End:0xB6
	if(!Weapon.WeaponCentered())
	{
		StartTrace = StartTrace + ((Weapon.hand * Y) * SpawnOffset.Y);
	}
	Aim = GetFireAim(StartTrace);
	Aim = Rotator((GetFireSpread()) >> Aim);
	End = Start + (Vector(Aim) * (MaxRange()));
	Other = Trace(HitLocation, HitNormal, End, Start, true);
	// End:0x139
	if(Other != none)
	{
		Aim = Rotator(HitLocation - StartTrace);
	}
	Spawn(Class'BallisticProV55.MACBeacon', Weapon,, StartTrace, Aim);
	//return;	
}

simulated function TurretLaunchBeacon()
{
	local Vector StartTrace, X, Y, Z, Start, End,
		HitLocation, HitNormal;

	local Rotator Aim;
	local Actor Other;

	Weapon.GetViewAxes(X, Y, Z);
	Start = (Instigator.Location + Instigator.EyePosition()) + (X * float(55));
	StartTrace = (Start + (X * SpawnOffset.X)) + (Z * SpawnOffset.Z);
	// End:0xC3
	if(!Weapon.WeaponCentered())
	{
		StartTrace = StartTrace + ((Weapon.hand * Y) * SpawnOffset.Y);
	}
	Aim = GetFireAim(StartTrace);
	Aim = Rotator((GetFireSpread()) >> Aim);
	End = Start + (Vector(Aim) * (MaxRange()));
	Other = Trace(HitLocation, HitNormal, End, Start, true);
	// End:0x146
	if(Other != none)
	{
		Aim = Rotator(HitLocation - StartTrace);
	}
	Spawn(Class'BallisticProV55.MACBeacon', Weapon,, StartTrace, Aim);
	//return;	
}

function PlayFiring()
{
	super(BallisticFire).PlayFiring();
	MACWeapon(Weapon).PlayFiring();
	//return;	
}

function DoFireEffect()
{
	// End:0x46
	if((Instigator != none) && Vehicle(Instigator) != none)
	{
		SpawnOffset.X = 30.0000000;
		SpawnOffset.Z = -14.0000000;
		DoTurretFireEffect();		
	}
	else
	{
		SpawnOffset.X = 28.0000000;
		SpawnOffset.Z = 0.0000000;
		super(BallisticProjectileFire).DoFireEffect();
		// End:0x94
		if(BW.bScopeView && Class'BCoreProV55.BallisticReplicationInfo'.static.IsArena())
		{
			return;
		}
		// End:0x145
		if(Instigator != none)
		{
			// End:0x100
			if(int(Instigator.Physics) == int(2))
			{
				Instigator.TakeDamage(80, Instigator, Instigator.Location, -Vector(Instigator.GetViewRotation()) * float(4000), Class'BallisticProV55.DT_MACSelf');				
			}
			else
			{
				Instigator.TakeDamage(50, Instigator, Instigator.Location, -Vector(Instigator.GetViewRotation()) * float(4000), Class'BallisticProV55.DT_MACSelf');
			}
		}
	}
	//return;	
}

function DoTurretFireEffect()
{
	local Vector StartTrace, X, Y, Z, Start, End,
		HitLocation, HitNormal;

	local Rotator Aim;
	local Actor Other;

	Weapon.GetViewAxes(X, Y, Z);
	Start = (Instigator.Location + Instigator.EyePosition()) + (X * float(55));
	StartTrace = (Start + (X * SpawnOffset.X)) + (Z * SpawnOffset.Z);
	Aim = GetFireAim(StartTrace);
	Aim = Rotator((GetFireSpread()) >> Aim);
	End = Start + (Vector(Aim) * (MaxRange()));
	Other = Trace(HitLocation, HitNormal, End, Start, true);
	// End:0x104
	if(Other != none)
	{
		Aim = Rotator(HitLocation - StartTrace);
	}
	SpawnProjectile(StartTrace, Aim);
	SendFireEffect(none, vect(0.0000000, 0.0000000, 0.0000000), StartTrace, 0);
	DoFireEffect();
	//return;	
}

defaultproperties
{
	SpawnOffset=(X=18.0000000,Y=4.0000000,Z=0.0000000)
	BrassClass=Class'BallisticProV55.Brass_HAMR'
	BrassBone="EmptyShell"
	bBrassOnCock=true
	MuzzleFlashClass=Class'BallisticProV55.R78FlashEmitter'
	FlashScaleFactor=2.5000000
	FireRecoil=2048.0000000
	FirePushbackForce=1000.0000000
	FireChaos=0.5500000
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.Artillery.Art-Fire',Volume=1.0000000,Radius=768.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bSplashDamage=true
	bRecommendSplashDamage=true
	bTossed=true
	FireEndAnim="None"
	FireRate=1.3500000
	AmmoClass=Class'BallisticProV55.Ammo_MAC'
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=16.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.5000000
	ShakeOffsetMag=(X=-25.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-500.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.5000000
	ProjectileClass=Class'BallisticProV55.MACShell'
	BotRefireRate=0.7000000
	WarnTargetPct=0.7500000
}
