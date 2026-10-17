class MRT6SecondaryFire extends BallisticProShotgunFire;

var() Actor MuzzleFlash2;

event ModeDoFire()
{
	// End:0x8D
	if(AllowFire())
	{
		// End:0x59
		if(!MRT6Shotgun(Weapon).bLeftLoaded)
		{
			bCockAfterFire = true;
			MRT6Shotgun(Weapon).bRightLoaded = false;
			FireAnim = 'FireRight';
			AimedFireAnim = 'FireRight';			
		}
		else
		{
			bCockAfterFire = false;
			MRT6Shotgun(Weapon).bLeftLoaded = false;
			FireAnim = 'FireLeft';
			AimedFireAnim = 'FireLeft';
		}
	}
	super.ModeDoFire();
	//return;	
}

simulated function SendFireEffect(Actor Other, Vector HitLocation, Vector HitNormal, int Surf, optional Vector WaterHitLoc)
{
	MRT6Attachment(Weapon.ThirdPersonActor).MRT6UpdateHit(Other, HitLocation, HitNormal, Surf, !MRT6Shotgun(Weapon).bRightLoaded);
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
	super(BallisticFire).InitEffects();
	// End:0x6A
	if((MuzzleFlashClass != none) && (MuzzleFlash2 == none) || MuzzleFlash2.bDeleteMe)
	{
		Class'BCoreProV55.BUtil'.static.InitMuzzleFlash(MuzzleFlash2, MuzzleFlashClass, Weapon.DrawScale * FlashScaleFactor, Weapon, 'tip2');
	}
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
	// End:0xD0
	if(!MRT6Shotgun(Weapon).bRightLoaded && MuzzleFlash2 != none)
	{
		C = Weapon.GetBoneCoords('tip2');
		MuzzleFlash2.Trigger(Weapon, Instigator);		
	}
	else
	{
		// End:0x10E
		if(MuzzleFlash != none)
		{
			C = Weapon.GetBoneCoords('tip');
			MuzzleFlash.Trigger(Weapon, Instigator);
		}
	}
	// End:0x124
	if(!Class'BCoreProV55.BallisticMod'.default.bMuzzleSmoke)
	{
		return;
	}
	Start = ((C.Origin + (C.XAxis * float(-5))) + (C.YAxis * float(3))) + (C.ZAxis * float(0));
	MuzzleSmoke = Spawn(Class'BallisticProV55.MRT6Smoke', Weapon,, Start, Rotator(C.XAxis));
	// End:0x1A5
	if(!bBrassOnCock)
	{
		EjectBrass();
	}
	//return;	
}

defaultproperties
{
	HipSpreadFactor=1.2500000
	TraceCount=7
	TracerClass=Class'BallisticProV55.TraceEmitter_MRTsix'
	ImpactManager=Class'BallisticProV55.IM_Shell'
	TraceRange=(Min=5000.0000000,Max=5000.0000000)
	DamageType=Class'BallisticProV55.DTMRT6Shotgun'
	DamageTypeHead=Class'BallisticProV55.DTMRT6ShotgunHead'
	DamageTypeArm=Class'BallisticProV55.DTMRT6Shotgun'
	KickForce=400
	PenetrateForce=100
	bPenetrate=true
	BrassClass=Class'BallisticProV55.Brass_MRT6Left'
	BrassBone="EjectorR"
	bBrassOnCock=true
	BrassOffset=(X=15.0000000,Y=-13.0000000,Z=7.0000000)
	bCockAfterFire=true
	MuzzleFlashClass=Class'BallisticProV55.MRT6FlashEmitter'
	FlashScaleFactor=1.2000000
	FireRecoil=378.0000000
	FirePushbackForce=600.0000000
	FireChaos=0.2000000
	XInaccuracy=378.0000000
	YInaccuracy=378.0000000
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.MRT6.MRT6SingleFire',Volume=1.0000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	FireAnim="FireRight"
	FireRate=0.4000000
	AmmoClass=Class'BallisticProV55.Ammo_12Gauge'
	ShakeRotMag=(X=64.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=960.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-5.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-100.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.7000000
	WarnTargetPct=0.5000000
}
