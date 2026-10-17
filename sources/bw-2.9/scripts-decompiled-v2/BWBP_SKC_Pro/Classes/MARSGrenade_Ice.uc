class MARSGrenade_Ice extends BallisticGrenade;

var array<Actor> PokedControls;

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
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
	Destroy();
	//return;	
}

simulated function ApplyImpactEffect(Actor Other, Vector HitLocation)
{
	super.ApplyImpactEffect(Other, HitLocation);
	// End:0x5F
	if((Pawn(Other) != none) && (int(PlayerImpactType) == int(1)) || int(DetonateOn) == int(1))
	{
		ApplySlowdown(Pawn(Other), Damage / float(8));
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
			if((Pawn(Victims) != none) && Level.Game.ReduceDamage(int(DamageAmount), xPawn(Victims), Instigator, Victims.Location, Dummy, DamageType) > 0)
			{
				ApplySlowdown(Pawn(Victims), Damage / float(8));
			}
		}		
	}	
	bHurtEntry = false;
	//return;	
}

function ApplySlowdown(Pawn P, float Duration)
{
	Class'BCoreProV55.BCSprintControl'.static.AddSlowTo(P, 0.7000000, Duration);
	//return;	
}

defaultproperties
{
	UnarmedDetonateOn=2
	ArmedDetonateOn=1
	ArmedPlayerImpactType=1
	ReflectImpactManager=Class'BallisticProV55.IM_GunHit'
	bNoInitialSpin=true
	bAlignToVelocity=true
	ArmingDelay=0.1500000
	DetonateDelay=1.0000000
	ImpactDamage=50
	ImpactDamageType=Class'BWBP_SKC_Pro.DT_MARSGrenadeDirect'
	WeaponClass=Class'BWBP_SKC_Pro.MARSAssaultRifle'
	ImpactManager=Class'BWBP_SKC_Pro.IM_CryoGrenade'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BWBP_SKC_Pro.ChaffTrail'
	TrailOffset=(X=1.6000000,Y=0.0000000,Z=6.4000000)
	ModeIndex=1
	MyRadiusDamageType=Class'BWBP_SKC_Pro.DT_MARSGrenadeIceRadius'
	Speed=3500.0000000
	Damage=50.0000000
	DamageRadius=512.0000000
	MomentumTransfer=0.0000000
	MyDamageType=Class'BWBP_SKC_Pro.DT_MARSGrenadeIceRadius'
	ImpactSound=SoundGroup'BW_Core_WeaponSound.NRP57.NRP57-Concrete'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.M900.M900Grenade'
	bUnlit=false
	bIgnoreTerminalVelocity=true
}
