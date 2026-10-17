class FM13SecondaryFire extends BallisticProjectileFire;

var() FullSound DragonSound;

simulated function ServerPlayFiring()
{
	super(BallisticFire).ServerPlayFiring();
	// End:0x6D
	if(DragonSound.Sound != none)
	{
		Weapon.PlayOwnedSound(DragonSound.Sound, DragonSound.Slot, DragonSound.Volume, DragonSound.bNoOverride, DragonSound.Radius, DragonSound.Pitch, DragonSound.bAtten);
	}
	//return;	
}

simulated function PlayFiring()
{
	super(BallisticFire).PlayFiring();
	// End:0x6D
	if(DragonSound.Sound != none)
	{
		Weapon.PlayOwnedSound(DragonSound.Sound, DragonSound.Slot, DragonSound.Volume, DragonSound.bNoOverride, DragonSound.Radius, DragonSound.Pitch, DragonSound.bAtten);
	}
	//return;	
}

simulated function bool AllowFire()
{
	// End:0x0D
	if(!CheckReloading())
	{
		return false;
	}
	// End:0x1A
	if(!CheckWeaponMode())
	{
		return false;
	}
	// End:0x35
	if(!FM13Shotgun(BW).bAltLoaded)
	{
		return false;
	}
	return true;
	//return;	
}

simulated function ModeDoFire()
{
	super(BallisticFire).ModeDoFire();
	FM13Shotgun(BW).bAltLoaded = false;
	FM13Shotgun(BW).PrepPriFire();
	//return;	
}

function SpawnProjectile(Vector Start, Rotator Dir)
{
	proj = Spawn(ProjectileClass,,, Start, Dir);
	// End:0x68
	if(FM13Grenade(proj) != none)
	{
		proj.Instigator = Instigator;
		FM13Grenade(proj).FireControl = FM13Shotgun(Weapon).FireControl;
	}
	//return;	
}

defaultproperties
{
	DragonSound=(Sound=Sound'BWBP_OP_Sounds.FM13.FM13-RoarBig',Volume=1.8000000,Radius=1024.0000000,Slot=0,Pitch=0.5000000,bAtten=false,bNoOverride=true)
	BrassClass=Class'BallisticProV55.Brass_Shotgun'
	BrassOffset=(X=-1.0000000,Y=0.0000000,Z=-1.0000000)
	bUseWeaponMag=false
	FlashScaleFactor=2.0000000
	AimedFireAnim="SightFire"
	FireRecoil=1280.0000000
	FireChaos=0.5000000
	BallisticFireSound=(Sound=SoundGroup'BWBP_OP_Sounds.FM13.FM13-Fire',Volume=1.3000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bSplashDamage=true
	bLeadTarget=false
	bInstantHit=true
	FireEndAnim="None"
	FireAnimRate=1.1000000
	FireRate=0.7500000
	AmmoClass=Class'BWBP_OP_Pro.Ammo_RCS715Grenades'
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-30.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'BWBP_OP_Pro.FM13Grenade'
	BotRefireRate=0.3000000
	WarnTargetPct=0.7500000
}
