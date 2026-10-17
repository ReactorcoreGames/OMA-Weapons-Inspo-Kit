class CX85Dart extends BallisticProjectile;

var Actor StuckActor;
var bool bPlaced;
var CX85AssaultWeapon Master;

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
	local Vector LastHitLoc, LastHitNorm;
	local Rotator R;
	local CX85DartDirect proj, MasterProj;
	local float boneDist;

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
	R = Rotation;
	LastHitLoc = Location;
	LastHitNorm = Normal(Velocity);
	R = Rotator(LastHitNorm);
	R.Roll = Rand(65536);
	// End:0x12A
	foreach StuckActor.BasedActors(Class'BWBP_OP_Pro.CX85DartDirect', proj)
	{
		// End:0x129
		if(proj.Instigator == Instigator)
		{
			MasterProj = proj;
			// End:0x12A
			break;
		}		
	}	
	// End:0x170
	if(MasterProj != none)
	{
		proj = Spawn(Class'BWBP_OP_Pro.CX85DartDirect', MasterProj,, LastHitLoc, R);
		proj.Tracked = Pawn(StuckActor);		
	}
	else
	{
		Master.bPendingReceive = true;
		proj = Spawn(Class'BWBP_OP_Pro.CX85DartDirect', Master,, LastHitLoc, R);
		proj.Tracked = Pawn(StuckActor);
		proj.SetMaster();
	}
	proj.Instigator = Instigator;
	proj.SetPhysics(0);
	proj.bHardAttach = true;
	// End:0x259
	if((StuckActor != Instigator) && int(StuckActor.DrawType) == int(2))
	{
		StuckActor.AttachToBone(proj, StuckActor.GetClosestBone(LastHitLoc, Velocity, boneDist));		
	}
	else
	{
		proj.SetBase(StuckActor);
	}
	proj.SetRotation(R);
	proj.Velocity = vect(0.0000000, 0.0000000, 0.0000000);
	Destroy();
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BWBP_OP_Pro.CX85AssaultWeapon'
	ImpactManager=Class'BallisticProV55.IM_XMK5Dart'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BallisticProV55.PineappleTrail'
	ModeIndex=1
	MyRadiusDamageType=Class'BWBP_OP_Pro.DTCX85Dart'
	ShakeRadius=0.0000000
	MotionBlurRadius=0.0000000
	MotionBlurFactor=0.0000000
	MotionBlurTime=0.0000000
	AccelSpeed=100000.0000000
	Speed=35000.0000000
	MaxSpeed=100000.0000000
	Damage=3.0000000
	MyDamageType=Class'BWBP_OP_Pro.DTCX85Dart'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.OA-SMG.OA-SMG_Dart'
	LifeSpan=1.5000000
	bIgnoreTerminalVelocity=true
}
