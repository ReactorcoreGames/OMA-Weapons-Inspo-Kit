class PD97Dart extends BallisticProjectile;

var Actor StuckActor;
var bool bPlaced;
var PD97Bloodhound Master;

simulated function bool Impact(Actor Other, Vector HitLocation)
{
	// End:0x4A
	if(Pawn(Other) != none)
	{
		StuckActor = Other;
		HitActor = Other;
		Explode(HitLocation, Normal(HitLocation - Other.Location));
		return true;
	}
	return false;
	//return;	
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	local PD97DartControl DC;

	// End:0x0B
	if(bPlaced)
	{
		return;
	}
	bPlaced = true;
	// End:0x74
	if(ImpactManager != none)
	{
		// End:0x55
		if(Instigator == none)
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, 0, Level.GetLocalPlayerController());			
		}
		else
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, 0, Instigator);
		}
	}
	// End:0xA8
	if(((int(Role) < int(ROLE_Authority)) || Pawn(StuckActor) == none) || Master == none)
	{
		Destroy();
		return;
	}
	// End:0x105
	foreach StuckActor.BasedActors(Class'BWBP_OP_Pro.PD97DartControl', DC)
	{
		// End:0x104
		if((DC.Instigator == Instigator) && !DC.bTearOff)
		{
			DC.AddDart();
			Destroy();			
			return;
		}		
	}	
	// End:0x14C
	if((Level.TimeSeconds - Pawn(StuckActor).SpawnTime) < DeathMatch(Level.Game).SpawnProtectionTime)
	{
		return;
	}
	// End:0x1DE
	if(((Pawn(StuckActor).Controller != none) && Instigator.Controller != none) && Pawn(StuckActor).Controller.SameTeamAs(Instigator.Controller))
	{
		DC = Spawn(Class'BWBP_OP_Pro.PD97HealControl', StuckActor,, StuckActor.Location, StuckActor.Rotation);		
	}
	else
	{
		DC = Spawn(Class'BWBP_OP_Pro.PD97DartControl', StuckActor,, StuckActor.Location, StuckActor.Rotation);
	}
	DC.Initialize(Pawn(StuckActor), Master);
	// End:0x25D
	if(Instigator.Controller != none)
	{
		DC.InstigatorController = Instigator.Controller;
	}
	Master.AddControl(DC);
	Destroy();
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BWBP_OP_Pro.PD97Bloodhound'
	ImpactManager=Class'BallisticProV55.IM_XMK5Dart'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BWBP_OP_Pro.PD97DartTrail'
	MyRadiusDamageType=Class'BWBP_OP_Pro.DTPD97Dart'
	ShakeRadius=0.0000000
	MotionBlurRadius=0.0000000
	MotionBlurFactor=0.0000000
	MotionBlurTime=0.0000000
	Speed=15000.0000000
	Damage=20.0000000
	MyDamageType=Class'BWBP_OP_Pro.DTPD97Dart'
	StaticMesh=StaticMesh'BWBP_OP_Static.PD97.BHPoisonDart'
	LifeSpan=2.5000000
	bIgnoreTerminalVelocity=true
}
