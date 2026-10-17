class M46Mine extends BallisticProjectile;

var() Sound DetonateSound;
var bool bManualMode;
var float TriggerStartTime;

simulated function ProcessTouch(Actor Other, Vector HitLocation)
{
	//return;	
}

function SetManualMode(bool bManual)
{
	//return;	
}

function bool IsStationary()
{
	return true;
	//return;	
}

defaultproperties
{
	DetonateSound=Sound'BW_Core_WeaponSound.OA-AR.OA-AR_GrenadeBeep'
	WeaponClass=Class'BallisticProV55.M46AssaultRifle'
	ImpactManager=Class'BallisticProV55.IM_Grenade'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	ModeIndex=1
	MyRadiusDamageType=Class'BallisticProV55.DTM46GrenadeRadius'
	WallPenetrationForce=64.0000000
	ShakeRadius=512.0000000
	MotionBlurRadius=384.0000000
	MotionBlurFactor=3.0000000
	MotionBlurTime=4.0000000
	MyDamageType=Class'BallisticProV55.DTM46GrenadeRadius'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.OA-AR.OA-AR_Grenade'
	CullDistance=2500.0000000
	bNetTemporary=false
	Physics=0
	LifeSpan=0.0000000
	DrawScale=0.4500000
	bUnlit=false
	CollisionRadius=16.0000000
	CollisionHeight=16.0000000
	bCollideWorld=false
	bProjTarget=true
	bNetNotify=true
}
