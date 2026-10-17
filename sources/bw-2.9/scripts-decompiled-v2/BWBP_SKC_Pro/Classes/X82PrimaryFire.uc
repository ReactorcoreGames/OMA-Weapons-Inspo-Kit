class X82PrimaryFire extends BallisticProInstantFire;

simulated function PreBeginPlay()
{
	// End:0x1B
	if(X82Rifle_TW(Weapon) != none)
	{
		FireChaos = 0.0300000;
	}
	super(BallisticFire).PreBeginPlay();
	//return;	
}

defaultproperties
{
	TraceRange=(Min=30000.0000000,Max=30000.0000000)
	DamageType=Class'BWBP_SKC_Pro.DT_X82Torso'
	DamageTypeHead=Class'BWBP_SKC_Pro.DT_X82Head'
	DamageTypeArm=Class'BWBP_SKC_Pro.DT_X82Torso'
	KickForce=10000
	PenetrateForce=450
	bPenetrate=true
	BrassClass=Class'BWBP_SKC_Pro.Brass_BMG'
	BrassBone="breach"
	BrassOffset=(X=-10.0000000,Y=1.0000000,Z=-1.0000000)
	MuzzleFlashClass=Class'BallisticProV55.M925FlashEmitter'
	FireRecoil=768.0000000
	FirePushbackForce=255.0000000
	FireChaos=0.7000000
	BallisticFireSound=(Sound=Sound'BWBP_SKC_Sounds.X82.X82-Fire',Volume=10.0000000,Radius=1024.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=true)
	FireEndAnim="None"
	FireRate=0.7500000
	AmmoClass=Class'BWBP_SKC_Pro.Ammo_50BMG'
	ShakeRotMag=(X=450.0000000,Y=64.0000000,Z=0.0000000)
	ShakeRotRate=(X=12400.0000000,Y=12400.0000000,Z=12400.0000000)
	ShakeRotTime=2.5000000
	ShakeOffsetMag=(X=-25.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-500.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.2500000
	BotRefireRate=0.3000000
	WarnTargetPct=0.7000000
	aimerror=950.0000000
}
