class M7A3TazerProj extends BallisticProjectile;

var M7A3Attachment Master;

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
	WeaponClass=Class'BWBP_JCF_Pro.M7A3AssaultRifle'
	ImpactManager=Class'BallisticProV55.IM_XMK5Dart'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BWBP_JCF_Pro.M7A3TazerTrail'
	ModeIndex=1
	MyRadiusDamageType=Class'BWBP_JCF_Pro.DTM7A3Tazer'
	ShakeRadius=0.0000000
	MotionBlurRadius=0.0000000
	MotionBlurFactor=0.0000000
	MotionBlurTime=0.0000000
	Speed=10240.0000000
	Damage=5.0000000
	MyDamageType=Class'BWBP_JCF_Pro.DTM7A3Tazer'
	DrawType=0
	StaticMesh=StaticMesh'BWBP_OP_Static.PD97.BHTazerDart'
	LifeSpan=0.1000000
	DrawScale=1.5000000
	bIgnoreTerminalVelocity=true
}
