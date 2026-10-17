class R9PrimaryFire extends BallisticProInstantFire;

var FullSound FreezeFireSound;
var FullSound LaserFireSound;

function ApplyDamage(Actor Victim, int Damage, Pawn Instigator, Vector HitLocation, Vector MomentumDir, Class<DamageType> DamageType)
{
	// End:0x9F
	if(int(BW.CurrentWeaponMode) == 1)
	{
		super(BallisticInstantFire).ApplyDamage(Victim, Damage, Instigator, HitLocation, MomentumDir, DamageType);
		// End:0x9A
		if(((Pawn(Victim) != none) && Pawn(Victim).Health > 0) && Vehicle(Victim) == none)
		{
			Class'BCoreProV55.BCSprintControl'.static.AddSlowTo(Pawn(Victim), 0.7000000, 1.0000000);
		}
		return;		
	}
	else
	{
		// End:0x10B
		if(int(BW.CurrentWeaponMode) == 2)
		{
			// End:0x10B
			if((Pawn(Victim) != none) && Pawn(Victim).bProjTarget)
			{
				Damage += R9RangerRifle(BW).ManageHeatInteraction(Pawn(Victim), int(HeatPerShot));
			}
		}
	}
	super(BallisticInstantFire).ApplyDamage(Victim, Damage, Instigator, HitLocation, MomentumDir, DamageType);
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
			Weapon.PlayOwnedSound(FreezeFireSound.Sound, BallisticFireSound.Slot, FreezeFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);			
		}
		else
		{
			// End:0x145
			if(int(BW.CurrentWeaponMode) == 2)
			{
				Weapon.PlayOwnedSound(LaserFireSound.Sound, BallisticFireSound.Slot, LaserFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
			}
		}
	}
	CheckClipFinished();
	PlayFireAnimations();
	//return;	
}

function PlayFiring()
{
	// End:0x29
	if(int(ScopeDownOn) == int(1))
	{
		BW.TemporaryScopeDown(0.5000000, 0.9000000);
	}
	PlayFireAnimations();
	ClientPlayForceFeedback(FireForce);
	FireCount++;
	// End:0x116
	if(BallisticFireSound.Sound != none)
	{
		Weapon.PlayOwnedSound(BallisticFireSound.Sound, BallisticFireSound.Slot, BallisticFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
		// End:0x116
		if(int(BW.CurrentWeaponMode) == 2)
		{
			Weapon.PlayOwnedSound(LaserFireSound.Sound, BallisticFireSound.Slot, LaserFireSound.Volume, BallisticFireSound.bNoOverride, BallisticFireSound.Radius, BallisticFireSound.Pitch, BallisticFireSound.bAtten);
		}
	}
	CheckClipFinished();
	//return;	
}

defaultproperties
{
	FreezeFireSound=(Sound=Sound'BW_Core_WeaponSound.A42.A42-Impact',Volume=0.7000000,Radius=384.0000000,Slot=0,Pitch=1.4000000,bAtten=false,bNoOverride=false)
	LaserFireSound=(Sound=Sound'BW_Core_WeaponSound.R9.EnergyRelayExplode',Volume=3.0000000,Radius=256.0000000,Slot=0,Pitch=0.0000000,bAtten=false,bNoOverride=false)
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	RangeAtten=0.5000000
	DamageType=Class'BallisticProV55.DTR9Rifle'
	DamageTypeHead=Class'BallisticProV55.DTR9RifleHead'
	DamageTypeArm=Class'BallisticProV55.DTR9Rifle'
	KickForce=6000
	PenetrateForce=150
	bPenetrate=true
	BrassClass=Class'BallisticProV55.Brass_Rifle'
	BrassOffset=(X=-40.0000000,Y=-2.0000000,Z=6.0000000)
	bCockAfterEmpty=true
	ClipFinishSound=(Sound=Sound'BW_Core_WeaponSound.NRP57.NRP57-ClipOut',Volume=0.8000000,Radius=24.0000000,Slot=0,Pitch=1.2500000,bAtten=true,bNoOverride=false)
	DryFireSound=(Sound=Sound'BW_Core_WeaponSound.Misc.DryRifle',Volume=0.7000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MuzzleFlashClass=Class'BallisticProV55.R9FlashEmitter'
	FlashScaleFactor=1.4000000
	AimedFireAnim="AimedFire"
	FireRecoil=192.0000000
	FireChaos=0.4500000
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.USSR.USSR-Fire',Volume=0.8000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	HeatPerShot=45.0000000
	FireEndAnim="None"
	FireRate=0.2250000
	AmmoClass=Class'BallisticProV55.Ammo_348Rifle'
	ShakeRotMag=(X=48.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=640.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-15.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-300.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.7000000
	WarnTargetPct=0.4000000
	aimerror=800.0000000
}
