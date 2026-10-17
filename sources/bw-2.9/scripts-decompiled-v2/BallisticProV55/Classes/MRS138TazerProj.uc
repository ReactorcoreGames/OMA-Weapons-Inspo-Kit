class MRS138TazerProj extends BallisticProjectile;

var MRS138Attachment Master;

function DoDamage(Actor Other, Vector HitLocation)
{
	super.DoDamage(Other, HitLocation);
	// End:0xDB
	if(((Pawn(Other) != none) && Master != none) && (Level.TimeSeconds - Pawn(Other).SpawnTime) > DeathMatch(Level.Game).SpawnProtectionTime)
	{
		// End:0xDB
		if(((Pawn(Other).Controller != none) && InstigatorController != none) && !Pawn(Other).Controller.SameTeamAs(InstigatorController))
		{
			Master.GotTarget(Pawn(Other));
		}
	}
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BallisticProV55.MRS138Shotgun'
	ImpactManager=Class'BallisticProV55.IM_MRS138TazerHit'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BallisticProV55.MRS138TazerProjTrail'
	ModeIndex=1
	MyRadiusDamageType=Class'BallisticProV55.DTMRS138TazerLine'
	ShakeRadius=0.0000000
	MotionBlurRadius=0.0000000
	MotionBlurFactor=0.0000000
	MotionBlurTime=0.0000000
	Speed=12800.0000000
	MaxSpeed=12800.0000000
	Damage=5.0000000
	MyDamageType=Class'BallisticProV55.DTMRS138TazerLine'
	DrawType=0
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.OA-SMG.OA-SMG_Dart'
	LifeSpan=0.2000000
	DrawScale=1.5000000
	bIgnoreTerminalVelocity=true
}
