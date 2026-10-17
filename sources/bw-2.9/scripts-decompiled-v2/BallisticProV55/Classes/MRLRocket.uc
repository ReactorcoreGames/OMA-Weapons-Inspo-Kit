class MRLRocket extends BallisticProjectile;

var int RollRange;

simulated event PostBeginPlay()
{
	RotationRate.Roll = int(float(RollRange) * ((FRand() * float(2)) - 1.0000000));
	super.PostBeginPlay();
	//return;	
}

simulated event Landed(Vector HitNormal)
{
	HitWall(HitNormal, Level);
	//return;	
}

function TargetedHurtRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation, optional Actor Victim)
{
	local Actor Victims;
	local float damageScale, dist;
	local Vector Dir;

	// End:0x0B
	if(bHurtEntry)
	{
		return;
	}
	bHurtEntry = true;
	// End:0x3B
	if(Pawn(Victim) == none)
	{
		DamageAmount *= 0.5000000;
		DamageRadius *= 0.7500000;
	}
	// End:0x280
	foreach CollidingActors(Class'Engine.Actor', Victims, DamageRadius, HitLocation)
	{
		// End:0x27F
		if(((((Victims != self) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo')) && Victims != Victim) && Victims != HurtWall)
		{
			// End:0xD4
			if(!FastTrace(Victims.Location, Location))
			{
				continue;				
			}
			Dir = Victims.Location;
			// End:0x13E
			if(Victims.Location.Z > HitLocation.Z)
			{
				Dir.Z = FMax(HitLocation.Z, Dir.Z - Victims.CollisionHeight);				
			}
			else
			{
				Dir.Z = FMin(HitLocation.Z, Dir.Z + Victims.CollisionHeight);
			}
			Dir -= HitLocation;
			dist = FMax(1.0000000, VSize(Dir));
			Dir = Dir / dist;
			damageScale = 1.0000000 - FMax(0.0000000, (dist - Victims.CollisionRadius) / DamageRadius);
			// End:0x206
			if((Instigator == none) || Instigator.Controller == none)
			{
				Victims.SetDelayedDamageInstigatorController(InstigatorController);
			}
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victims, damageScale * DamageAmount, Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * Momentum) * Dir, DamageType);
		}		
	}	
	bHurtEntry = false;
	//return;	
}

defaultproperties
{
	RollRange=192000
	WeaponClass=Class'BallisticProV55.MRocketLauncher'
	ImpactManager=Class'BallisticProV55.IM_MRLRocket'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BallisticProV55.MRLTrailEmitter'
	TrailOffset=(X=-4.0000000,Y=0.0000000,Z=0.0000000)
	bRandomStartRotation=false
	MyRadiusDamageType=Class'BallisticProV55.DT_MRLRadius'
	WallPenetrationForce=32.0000000
	AccelSpeed=10000.0000000
	Speed=4500.0000000
	MaxSpeed=25000.0000000
	Damage=35.0000000
	DamageRadius=420.0000000
	MomentumTransfer=5500.0000000
	MyDamageType=Class'BallisticProV55.DT_MRL'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.MRL.MRLRocket'
	AmbientSound=Sound'BW_Core_WeaponSound.MRL.MRL-RocketFly'
	DrawScale=0.3500000
	SoundVolume=64
	bFixedRotationDir=true
	RotationRate=(Pitch=0,Yaw=0,Roll=32768)
}
