class SMATRocketIce extends BallisticProjectile;

var array<Actor> PokedControls;

simulated event Landed(Vector HitNormal)
{
	HitWall(HitNormal, Level);
	//return;	
}

simulated function ApplyImpactEffect(Actor Other, Vector HitLocation)
{
	super.ApplyImpactEffect(Other, HitLocation);
	// End:0x3B
	if(Pawn(Other) != none)
	{
		ApplySlowdown(Pawn(Other), Damage / float(5));
	}
	//return;	
}

function TargetedHurtRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation, optional Actor Excluded)
{
	local Actor Victims;
	local float damageScale, dist;
	local Vector Dir, Dummy;
	local int i;

	// End:0x0B
	if(bHurtEntry)
	{
		return;
	}
	bHurtEntry = true;
	// End:0x364
	foreach VisibleCollidingActors(Class'Engine.Actor', Victims, DamageRadius, HitLocation)
	{
		// End:0xDD
		if(FP7GroundFire(Victims) != none)
		{
			i = 0;
			J0x44:

			// End:0x83 [Loop If]
			if((i < PokedControls.Length) && FP7GroundFire(Victims).FireControl != PokedControls[i])
			{
				i++;
				// [Loop Continue]
				goto J0x44;
			}
			// End:0xDA
			if(i == PokedControls.Length)
			{
				PokedControls[PokedControls.Length] = FP7GroundFire(Victims).FireControl;
				FP7GroundFire(Victims).FireControl.NotifyPutOut(HitLocation, DamageRadius);
			}
			// End:0x363
			continue;
		}
		// End:0x363
		if(((((Victims != self) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo')) && Victims != Excluded) && Victims != HurtWall)
		{
			Dir = Victims.Location;
			// End:0x1A7
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
			// End:0x26F
			if((Instigator == none) || Instigator.Controller == none)
			{
				Victims.SetDelayedDamageInstigatorController(InstigatorController);
			}
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victims, Square(damageScale) * DamageAmount, Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * Momentum) * Dir, DamageType);
			// End:0x363
			if((Pawn(Victims) != none) && Level.Game.ReduceDamage(int(Damage), xPawn(Victims), Instigator, Victims.Location, Dummy, DamageType) > 0)
			{
				ApplySlowdown(Pawn(Victims), Damage / float(6));
			}
		}		
	}	
	bHurtEntry = false;
	//return;	
}

function ApplySlowdown(Pawn Target, float Duration)
{
	Class'BCoreProV55.BCSprintControl'.static.AddSlowTo(Target, 0.3000000, Duration);
	//return;	
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	local SMATIceCloudControl C;

	// End:0x18
	if(ShakeRadius > float(0))
	{
		ShakeView(HitLocation);
	}
	BlowUp(HitLocation);
	// End:0x84
	if(ImpactManager != none)
	{
		// End:0x65
		if(Instigator == none)
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, 0, Level.GetLocalPlayerController());			
		}
		else
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, 0, Instigator);
		}
	}
	// End:0xD5
	if(int(Role) == int(ROLE_Authority))
	{
		C = Spawn(Class'BWBP_SKC_Pro.SMATIceCloudControl', self,, HitLocation - (HitNormal * float(2)));
		// End:0xD5
		if(C != none)
		{
			C.Instigator = Instigator;
		}
	}
	Destroy();
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BWBP_SKC_Pro.SMATLauncher'
	ImpactManager=Class'BWBP_SKC_Pro.IM_SMATCryo'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BWBP_SKC_Pro.SMATRocketTrailIce'
	TrailOffset=(X=-4.0000000,Y=0.0000000,Z=0.0000000)
	MyRadiusDamageType=Class'BWBP_SKC_Pro.DTSMAT_IceRadius'
	MotionBlurRadius=768.0000000
	MotionBlurFactor=2.0000000
	MotionBlurTime=10.0000000
	Speed=600.0000000
	MaxSpeed=14000.0000000
	Damage=100.0000000
	DamageRadius=1024.0000000
	MomentumTransfer=20000.0000000
	MyDamageType=Class'BWBP_SKC_Pro.DTSMAT_IceRocket'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.MRL.MRLRocket'
	AmbientSound=Sound'BW_Core_WeaponSound.MRL.MRL-RocketFly'
	SoundVolume=64
	bCollideActors=false
	bFixedRotationDir=true
	RotationRate=(Pitch=0,Yaw=0,Roll=32768)
}
