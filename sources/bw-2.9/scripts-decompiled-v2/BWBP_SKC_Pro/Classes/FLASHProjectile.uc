class FLASHProjectile extends BallisticGrenade;

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	local FLASHFireControl F;

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
	// End:0xF1
	if(int(Role) == int(ROLE_Authority))
	{
		F = Spawn(Class'BWBP_SKC_Pro.FLASHFireControl', self,, HitLocation - (HitNormal * float(2)), rot(0, 0, 0));
		// End:0xF1
		if(F != none)
		{
			F.Instigator = Instigator;
			F.Initialize();
		}
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
	ImpactDamage=50
	ImpactDamageType=Class'BWBP_SKC_Pro.DT_FLASH'
	WeaponClass=Class'BWBP_SKC_Pro.FLASHLauncher'
	ImpactManager=Class'BWBP_SKC_Pro.IM_FlareExplode'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BWBP_SKC_Pro.FLASHRocketTrail'
	TrailOffset=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	MyRadiusDamageType=Class'BWBP_SKC_Pro.DT_FLASHRadius'
	ShakeRadius=512.0000000
	MotionBlurRadius=384.0000000
	MotionBlurFactor=3.0000000
	MotionBlurTime=4.0000000
	Speed=4500.0000000
	Damage=80.0000000
	DamageRadius=300.0000000
	MomentumTransfer=10000.0000000
	MyDamageType=Class'BWBP_SKC_Pro.DT_FLASHRadius'
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.MRL.MRLRocket'
	AmbientSound=Sound'BWBP_SKC_Sounds.Misc.M202-Flyby'
	DrawScale=1.0000000
	AmbientGlow=32
	SoundVolume=255
	RotationRate=(Pitch=0,Yaw=0,Roll=32768)
}
