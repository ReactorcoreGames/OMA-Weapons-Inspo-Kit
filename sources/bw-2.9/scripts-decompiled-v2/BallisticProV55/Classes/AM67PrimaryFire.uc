class AM67PrimaryFire extends BallisticProInstantFire;

defaultproperties
{
	WaterRangeAtten=0.3000000
	BrassClass=Class'BallisticProV55.Brass_Pistol'
	BrassBone="tip"
	BrassOffset=(X=-30.0000000,Y=1.0000000,Z=0.0000000)
	bDryUncock=true
	DryFireSound=(Sound=Sound'BW_Core_WeaponSound.D49.D49-DryFire',Volume=0.7000000,Radius=24.0000000,Slot=0,Pitch=1.0000000,bAtten=false,bNoOverride=false)
	AmmoClass=Class'BallisticProV55.Ammo_50HV'
	ShakeRotMag=(X=48.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotRate=(X=640.0000000,Y=0.0000000,Z=0.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=-5.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetRate=(X=-100.0000000,Y=0.0000000,Z=0.0000000)
	ShakeOffsetTime=2.0000000
	BotRefireRate=0.7000000
}
