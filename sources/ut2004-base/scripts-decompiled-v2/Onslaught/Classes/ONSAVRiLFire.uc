class ONSAVRiLFire extends ProjectileFire;

var Vector KickMomentum;
var float ReloadAnimDelay;

function PlayFiring()
{
	super(WeaponFire).PlayFiring();
	// End:0x26
	if(Weapon.HasAnim(ReloadAnim))
	{
		SetTimer(ReloadAnimDelay, false);
	}
	//return;	
}

function Projectile SpawnProjectile(Vector Start, Rotator Dir)
{
	local Projectile P;

	P = super.SpawnProjectile(Start, Dir);
	// End:0x32
	if(P != none)
	{
		P.SetOwner(Weapon);
	}
	return P;
	//return;	
}

function Timer()
{
	// End:0x5B
	if(int(Weapon.ClientState) == int(4))
	{
		Weapon.PlayAnim(ReloadAnim, ReloadAnimRate, TweenTime);
		Weapon.PlaySound(ReloadSound, 0,,, 512.0000000,, false);
		ClientPlayForceFeedback(ReloadForce);
	}
	//return;	
}

function ShakeView()
{
	super(WeaponFire).ShakeView();
	// End:0x36
	if(Instigator != none)
	{
		Instigator.AddVelocity(KickMomentum >> Instigator.Rotation);
	}
	//return;	
}

function float MaxRange()
{
	return 15000.0000000;
	//return;	
}

function StartBerserk()
{
	// End:0x39
	if((Level.GRI != none) && Level.GRI.WeaponBerserk > 1.0000000)
	{
		return;
	}
	super(WeaponFire).StartBerserk();
	ReloadAnimDelay = default.ReloadAnimDelay * 0.7500000;
	//return;	
}

function StopBerserk()
{
	// End:0x39
	if((Level.GRI != none) && Level.GRI.WeaponBerserk > 1.0000000)
	{
		return;
	}
	super(WeaponFire).StopBerserk();
	ReloadAnimDelay = default.ReloadAnimDelay;
	//return;	
}

function StartSuperBerserk()
{
	super(WeaponFire).StartSuperBerserk();
	ReloadAnimDelay = default.ReloadAnimDelay / Level.GRI.WeaponBerserk;
	//return;	
}

defaultproperties
{
	KickMomentum=(X=-350.0000000,Y=0.0000000,Z=175.0000000)
	ReloadAnimDelay=1.0000000
	ProjSpawnOffset=(X=25.0000000,Y=6.0000000,Z=-6.0000000)
	bSplashDamage=true
	bModeExclusive=false
	FireAnimRate=1.1000000
	ReloadAnimRate=1.3500000
	TweenTime=0.0000000
	FireSound=Sound'ONSVehicleSounds-S.AVRiL.AvrilFire01'
	ReloadSound=Sound'ONSVehicleSounds-S.AVRiL.AvrilReload01'
	FireForce="AVRiLFire"
	ReloadForce="AVRiLReload"
	FireRate=4.0000000
	AmmoClass=Class'Onslaught.ONSAVRiLAmmo'
	AmmoPerFire=1
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-20.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	ProjectileClass=Class'Onslaught.ONSAVRiLRocket'
	BotRefireRate=0.5000000
	WarnTargetPct=1.0000000
}
