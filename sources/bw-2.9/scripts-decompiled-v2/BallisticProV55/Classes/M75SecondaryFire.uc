class M75SecondaryFire extends BallisticRailgunFire;

const MAX_RAIL_POWER = 1.3f;

var float RailPower;
var float RailDamageBonusFactor;
var float RailWallPenetrationForceBonus;
var int RailPenetrateForceBonus;
var float RailKickForceBonus;
var float RailFireRecoilPenalty;

simulated event ModeDoFire()
{
	RailPower = FMin(RailPower, 1.0000000);
	Damage = default.Damage * (float(1) + (RailDamageBonusFactor * RailPower));
	WallPenetrationForce = default.WallPenetrationForce + (RailWallPenetrationForceBonus * Square(RailPower));
	PenetrateForce = int(float(default.PenetrateForce) + (float(RailPenetrateForceBonus) * RailPower));
	KickForce = int(float(default.KickForce) + (RailKickForceBonus * RailPower));
	FireRecoil = default.FireRecoil + (RailFireRecoilPenalty * RailPower);
	super.ModeDoFire();
	RailPower = 0.0000000;
	Weapon.ThirdPersonActor.SoundPitch = 32;
	Weapon.ThirdPersonActor.SoundVolume = 64;
	Weapon.ThirdPersonActor.SoundRadius = 128.0000000;
	//return;	
}

simulated function ModeTick(float DeltaTime)
{
	// End:0x43
	if(bIsFiring)
	{
		RailPower = FMin(1.3000000, RailPower + (0.5000000 * DeltaTime));
		// End:0x40
		if(RailPower >= 1.3000000)
		{
			bIsFiring = false;
		}		
	}
	else
	{
		// End:0x69
		if(RailPower > float(0))
		{
			RailPower = FMax(0.0000000, RailPower - DeltaTime);
		}
	}
	super(BallisticFire).ModeTick(DeltaTime);
	// End:0x115
	if((RailPower > float(0)) && RailPower <= 1.0000000)
	{
		Weapon.ThirdPersonActor.SoundPitch = byte(float(32) + (RailPower * float(12)));
		Weapon.ThirdPersonActor.SoundVolume = byte(float(64) + (float(190) * RailPower));
		Weapon.ThirdPersonActor.SoundRadius = 128.0000000 + (float(768) * RailPower);
	}
	//return;	
}

simulated function SendFireEffect(Actor Other, Vector HitLocation, Vector HitNormal, int Surf, optional Vector WaterHitLoc)
{
	M75Attachment(Weapon.ThirdPersonActor).RailPower = byte(float(64) + (float(191) * FMin(RailPower, 1.0000000)));
	super.SendFireEffect(Other, HitLocation, HitNormal, Surf, WaterHitLoc);
	//return;	
}

simulated function bool ImpactEffect(Vector HitLocation, Vector HitNormal, Material HitMat, Actor Other, optional Vector WaterHitLoc)
{
	BallisticWeapon(Weapon).TargetedHurtRadius(25.0000000 * FMin(RailPower, 1.0000000), 32.0000000 + (32.0000000 * FMin(RailPower, 1.0000000)), DamageType, 5000.0000000, HitLocation, Pawn(Other));
	return super(BallisticInstantFire).ImpactEffect(HitLocation, HitNormal, HitMat, Other, WaterHitLoc);
	//return;	
}

function WallEnterEffect(Vector HitLocation, Vector HitNormal, Vector X, Actor Other, Material HitMat)
{
	BallisticWeapon(Weapon).TargetedHurtRadius(25.0000000 * FMin(RailPower, 1.0000000), 32.0000000 + (96.0000000 * FMin(RailPower, 1.0000000)), DamageType, 5000.0000000, HitLocation, Pawn(Other));
	super.WallEnterEffect(HitLocation, HitNormal, X, Other, HitMat);
	//return;	
}

defaultproperties
{
	RailDamageBonusFactor=0.7500000
	RailWallPenetrationForceBonus=1280.0000000
	RailPenetrateForceBonus=1000
	RailKickForceBonus=10000.0000000
	RailFireRecoilPenalty=3072.0000000
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	WallPenetrationForce=128.0000000
	DamageType=Class'BallisticProV55.DTM75RailgunCharged'
	DamageTypeHead=Class'BallisticProV55.DTM75RailgunChargedHead'
	DamageTypeArm=Class'BallisticProV55.DTM75RailgunCharged'
	KickForce=10000
	PenetrateForce=500
	bPenetrate=true
	BrassClass=Class'BallisticProV55.Brass_Railgun'
	BrassOffset=(X=-33.0000000,Y=-4.0000000,Z=-4.0000000)
	bCockAfterFire=true
	MuzzleFlashClass=Class'BallisticProV55.M75FlashEmitter'
	FireRecoil=1024.0000000
	FirePushbackForce=1300.0000000
	FireChaos=0.7500000
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.M75.M75Fire',Volume=1.0000000,Radius=768.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	bFireOnRelease=true
	FireEndAnim="'"
	FireRate=1.5000000
	AmmoClass=Class'BallisticProV55.Ammo_20mmRailgun'
	ShakeRotMag=(X=400.0000000,Y=32.0000000,Z=0.0000000)
	ShakeRotRate=(X=10000.0000000,Y=10000.0000000,Z=10000.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-5.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-1000.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.3000000
	WarnTargetPct=0.7500000
	aimerror=800.0000000
}
