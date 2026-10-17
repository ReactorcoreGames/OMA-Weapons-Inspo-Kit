class M290PrimaryFire extends BallisticProShotgunFire;

simulated function bool AllowFire()
{
	local bool bResult;

	AmmoPerFire = 1;
	bResult = super(BallisticFire).AllowFire();
	AmmoPerFire = 2;
	return bResult;
	//return;	
}

event ModeDoFire()
{
	// End:0x4F
	if(!M290Shotgun(Weapon).bLeftLoaded && M290Shotgun(Weapon).bRightLoaded)
	{
		BW.bFireMode[1].ModeDoFire();		
	}
	else
	{
		super.ModeDoFire();
	}
	//return;	
}

function EjectBrass()
{
	BrassBone = 'EjectorL';
	BrassClass = Class'BallisticProV55.Brass_M290Left';
	super(BallisticFire).EjectBrass();
	BrassBone = 'EjectorR';
	BrassClass = Class'BallisticProV55.Brass_M290Right';
	super(BallisticFire).EjectBrass();
	//return;	
}

function InitEffects()
{
	//return;	
}

function FlashMuzzleFlash()
{
	local Coords C;
	local Actor MuzzleSmoke;
	local Vector Start, X, Y, Z;

	// End:0x36
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || AIController(Instigator.Controller) != none)
	{
		return;
	}
	// End:0x74
	if(!Instigator.IsFirstPerson() || PlayerController(Instigator.Controller).ViewTarget != Instigator)
	{
		return;
	}
	BW.bFireMode[1].MuzzleFlash.Trigger(Weapon, Instigator);
	M290SecondaryFire(BW.bFireMode[1]).MuzzleFlash2.Trigger(Weapon, Instigator);
	// End:0xE9
	if(!Class'BCoreProV55.BallisticMod'.default.bMuzzleSmoke)
	{
		return;
	}
	C = Weapon.GetBoneCoords('tip2');
	Weapon.GetViewAxes(X, Y, Z);
	Start = (C.Origin + (X * float(-180))) + (Y * float(3));
	MuzzleSmoke = Spawn(Class'BallisticProV55.MRT6Smoke', Weapon,, Start, Rotator(X));
	C = Weapon.GetBoneCoords('tip');
	Start = (C.Origin + (X * float(-180))) + (Y * float(3));
	MuzzleSmoke = Spawn(Class'BallisticProV55.MRT6Smoke', Weapon,, Start, Rotator(X));
	// End:0x1EC
	if(!bBrassOnCock)
	{
		EjectBrass();
	}
	//return;	
}

defaultproperties
{
	TraceCount=20
	TracerClass=Class'BallisticProV55.TraceEmitter_Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	MaxHits=18
	TraceRange=(Min=2560.0000000,Max=2560.0000000)
	DamageType=Class'BallisticProV55.DTM290Shotgun'
	DamageTypeHead=Class'BallisticProV55.DTM290ShotgunHead'
	DamageTypeArm=Class'BallisticProV55.DTM290Shotgun'
	KickForce=600
	BrassClass=Class'BallisticProV55.Brass_Shotgun'
	BrassBone="EjectorR"
	bBrassOnCock=true
	BrassOffset=(X=-30.0000000,Y=-5.0000000,Z=5.0000000)
	bCockAfterFire=true
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=1.2000000
	FireRecoil=1536.0000000
	FirePushbackForce=1000.0000000
	FireChaos=0.3000000
	XInaccuracy=512.0000000
	YInaccuracy=378.0000000
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.M290.M290Fire',Volume=1.5000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	FireRate=1.2000000
	AmmoClass=Class'BallisticProV55.Ammo_12Gauge'
	AmmoPerFire=2
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-15.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-300.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.7000000
	WarnTargetPct=0.7500000
}
