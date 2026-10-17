class PD97TazerProj extends BallisticProjectile;

var PD97Attachment Master;

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
	WeaponClass=Class'BWBP_OP_Pro.PD97Bloodhound'
	ImpactManager=Class'BallisticProV55.IM_MRS138TazerHit'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BWBP_OP_Pro.PD97TazerTrail'
	ModeIndex=1
	MyRadiusDamageType=Class'BWBP_OP_Pro.DTPD97Tazer'
	ShakeRadius=0.0000000
	MotionBlurRadius=0.0000000
	MotionBlurFactor=0.0000000
	MotionBlurTime=0.0000000
	Speed=10240.0000000
	Damage=5.0000000
	MyDamageType=Class'BWBP_OP_Pro.DTPD97Tazer'
	DrawType=0
	StaticMesh=StaticMesh'BWBP_OP_Static.PD97.BHTazerDart'
	LifeSpan=0.1000000
	DrawScale=1.5000000
	bIgnoreTerminalVelocity=true
}
