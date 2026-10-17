class G51Grenade_Chaff extends BallisticGrenade;

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	local RX22AActorFire BurnA;
	local FP7ActorBurner BurnB;
	local BOGPFlareActorBurner BurnC;
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
	// End:0x113
	foreach RadiusActors(Class'BallisticProV55.RX22AActorFire', BurnA, 100.0000000, HitLocation)
	{
		BurnA.FuelOut();		
	}	
	// End:0x14C
	foreach RadiusActors(Class'BallisticProV55.FP7ActorBurner', BurnB, 100.0000000, HitLocation)
	{
		BurnB.bDynamicLight = false;
		BurnB.Destroy();		
	}	
	// End:0x185
	foreach RadiusActors(Class'BallisticProV55.BOGPFlareActorBurner', BurnC, 100.0000000, HitLocation)
	{
		BurnC.bDynamicLight = false;
		BurnC.Destroy();		
	}	
	Destroy();
	//return;	
}

defaultproperties
{
	ArmedDetonateOn=1
	bNoInitialSpin=true
	bAlignToVelocity=true
	DetonateDelay=1.0000000
	ImpactDamage=90
	ImpactDamageType=Class'BWBP_SKC_Pro.DTChaffGrenade_R'
	WeaponClass=Class'BWBP_SKC_Pro.G51Carbine'
	ImpactManager=Class'BWBP_SKC_Pro.IM_ChaffGrenade'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BWBP_SKC_Pro.ChaffTrail'
	TrailOffset=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ModeIndex=1
	MyRadiusDamageType=Class'BWBP_SKC_Pro.DTChaffGrenadeRadius_R'
	ShakeRadius=512.0000000
	MotionBlurRadius=768.0000000
	MotionBlurFactor=2.0000000
	MotionBlurTime=10.0000000
	Speed=3750.0000000
	MaxSpeed=4500.0000000
	Damage=65.0000000
	DamageRadius=192.0000000
	MyDamageType=Class'BWBP_SKC_Pro.DTChaffGrenadeRadius'
	StaticMesh=StaticMesh'BWBP_SKC_Static.MJ51.MOACProjLaunched'
	DrawScale=0.1200000
	bUnlit=false
}
