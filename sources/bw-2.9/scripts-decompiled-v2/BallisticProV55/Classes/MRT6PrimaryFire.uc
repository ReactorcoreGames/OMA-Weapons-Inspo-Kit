class MRT6PrimaryFire extends BallisticProShotgunFire;

event ModeDoFire()
{
	// End:0x4F
	if(!MRT6Shotgun(Weapon).bLeftLoaded && MRT6Shotgun(Weapon).bRightLoaded)
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
	BrassClass = Class'BallisticProV55.Brass_MRT6Left';
	super(BallisticFire).EjectBrass();
	BrassBone = 'EjectorR';
	BrassClass = Class'BallisticProV55.Brass_MRT6Right';
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
	local Vector Start;
	local Actor MuzzleSmoke;

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
	MRT6SecondaryFire(BW.bFireMode[1]).MuzzleFlash2.Trigger(Weapon, Instigator);
	// End:0xE9
	if(!Class'BCoreProV55.BallisticMod'.default.bMuzzleSmoke)
	{
		return;
	}
	C = Weapon.GetBoneCoords('tip2');
	Start = ((C.Origin + (C.XAxis * float(-5))) + (C.YAxis * float(3))) + (C.ZAxis * float(0));
	MuzzleSmoke = Spawn(Class'BallisticProV55.MRT6Smoke', Weapon,, Start, Rotator(C.XAxis));
	C = Weapon.GetBoneCoords('tip');
	Start = ((C.Origin + (C.XAxis * float(-5))) + (C.YAxis * float(3))) + (C.ZAxis * float(0));
	MuzzleSmoke = Spawn(Class'BallisticProV55.MRT6Smoke', Weapon,, Start, Rotator(C.XAxis));
	// End:0x20E
	if(!bBrassOnCock)
	{
		EjectBrass();
	}
	//return;	
}

defaultproperties
{
	HipSpreadFactor=1.2500000
	TraceCount=14
	TracerClass=Class'BallisticProV55.TraceEmitter_MRTsix'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=2048.0000000,Max=2048.0000000)
	DamageType=Class'BallisticProV55.DTMRT6Shotgun'
	DamageTypeHead=Class'BallisticProV55.DTMRT6ShotgunHead'
	DamageTypeArm=Class'BallisticProV55.DTMRT6Shotgun'
	KickForce=400
	BrassClass=Class'BallisticProV55.Brass_Shotgun'
	BrassBone="EjectorR"
	bBrassOnCock=true
	BrassOffset=(X=15.0000000,Y=-13.0000000,Z=7.0000000)
	bCockAfterFire=true
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=1.2000000
	FireRecoil=1024.0000000
	FirePushbackForce=1200.0000000
	FireChaos=0.4500000
	XInaccuracy=600.0000000
	YInaccuracy=378.0000000
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.MRT6.MRT6Fire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	FireRate=0.8000000
	AmmoClass=Class'BallisticProV55.Ammo_12Gauge'
	AmmoPerFire=2
	ShakeRotMag=(X=128.0000000,Y=64.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-10.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-100.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.7000000
	WarnTargetPct=0.7500000
}
