class ChaffGrenade extends BallisticGrenade;

var array<Actor> PokedControls;

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	local ChaffCloudControl C;

	// End:0x65
	if(int(Role) == int(ROLE_Authority))
	{
		C = Spawn(Class'BWBP_SKC_Pro.ChaffCloudControl', self,, HitLocation + (HitNormal * float(2)));
		// End:0x65
		if(C != none)
		{
			C.Instigator = Instigator;
			C.InstigatorController = InstigatorController;
		}
	}
	// End:0x7D
	if(ShakeRadius > float(0))
	{
		ShakeView(HitLocation);
	}
	BlowUp(HitLocation);
	// End:0xE9
	if(ImpactManager != none)
	{
		// End:0xCA
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

function TargetedHurtRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation, optional Actor Victim)
{
	local Actor Victims;
	local float damageScale, dist;
	local Vector Dir;
	local int i;

	// End:0x0B
	if(bHurtEntry)
	{
		return;
	}
	bHurtEntry = true;
	// End:0x2E9
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
			// End:0x2E8
			continue;
		}
		// End:0x2E8
		if(((((Victims != self) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo')) && Victims != Victim) && Victims != HurtWall)
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
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victims, damageScale * DamageAmount, Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * Momentum) * Dir, DamageType);
		}		
	}	
	bHurtEntry = false;
	//return;	
}

defaultproperties
{
	ArmedDetonateOn=1
	ImpactDamage=25
	ImpactDamageType=Class'BWBP_SKC_Pro.DTChaffGrenade'
	WeaponClass=Class'BWBP_SKC_Pro.ChaffGrenadeWeapon'
	ImpactManager=Class'BWBP_SKC_Pro.IM_ChaffGrenade'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BWBP_SKC_Pro.ChaffTrail'
	TrailOffset=(X=1.6000000,Y=0.0000000,Z=6.4000000)
	MyRadiusDamageType=Class'BWBP_SKC_Pro.DTChaffGrenadeRadius'
	ShakeRadius=512.0000000
	ShakeRotMag=(X=512.0000000,Y=400.0000000,Z=256.0000000)
	ShakeRotRate=(X=3000.0000000,Y=2500.0000000,Z=3000.0000000)
	ShakeOffsetMag=(X=20.0000000,Y=30.0000000,Z=30.0000000)
	MotionBlurRadius=768.0000000
	MotionBlurFactor=2.0000000
	MotionBlurTime=10.0000000
	Speed=1750.0000000
	Damage=40.0000000
	DamageRadius=256.0000000
	MyDamageType=Class'BWBP_SKC_Pro.DTChaffGrenadeRadius'
	StaticMesh=StaticMesh'BWBP_SKC_Static.MOAC.MOACProj'
	DrawScale=0.1500000
	bUnlit=false
}
