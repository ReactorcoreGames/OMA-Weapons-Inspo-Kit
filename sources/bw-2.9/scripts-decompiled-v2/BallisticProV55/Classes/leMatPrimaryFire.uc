class leMatPrimaryFire extends BallisticProInstantFire;

function ServerPlayFiring()
{
	super(BallisticFire).ServerPlayFiring();
	leMatRevolver(Weapon).RevolverFired();
	//return;	
}

function PlayFiring()
{
	super(BallisticFire).PlayFiring();
	leMatRevolver(Weapon).RevolverFired();
	//return;	
}

defaultproperties
{
	TraceRange=(Min=8000.0000000,Max=8000.0000000)
	DecayRange=(Min=768.0000000,Max=2816.0000000)
	DamageType=Class'BallisticProV55.DTleMatRevolver'
	DamageTypeHead=Class'BallisticProV55.DTleMatrevolverHead'
	DamageTypeArm=Class'BallisticProV55.DTleMatRevolver'
	PenetrateForce=150
	bPenetrate=true
	DryFireSound=(Sound=Sound'BW_Core_WeaponSound.D49.D49-DryFire',Volume=0.6000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	MuzzleFlashClass=Class'BallisticProV55.D49FlashEmitter'
	FlashScaleFactor=0.6000000
	AimedFireAnim="SightFire"
	FireRecoil=300.0000000
	FireChaos=0.0400000
	XInaccuracy=64.0000000
	YInaccuracy=64.0000000
	BallisticFireSound=(Sound=Sound'BW_Core_WeaponSound.leMat.LM-Fire',Volume=1.2000000,Radius=512.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	FireEndAnim="None"
	FireAnimRate=1.5000000
	FireRate=0.3200000
	AmmoClass=Class'BallisticProV55.Ammo_leMat'
	ShakeRotMag=(X=48.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=640.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-160.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.9000000
	WarnTargetPct=0.3500000
}
