class RaygunProjectile extends BallisticProjectile;

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	local int Surf;

	// End:0x0B
	if(bExploded)
	{
		return;
	}
	// End:0x32
	if((ShakeRadius > float(0)) || MotionBlurRadius > float(0))
	{
		ShakeView(HitLocation);
	}
	// End:0xCC
	if((ImpactManager != none) && int(Level.NetMode) != int(NM_DedicatedServer))
	{
		// End:0x76
		if(bCheckHitSurface)
		{
			CheckSurface(HitLocation, HitNormal, Surf);
		}
		// End:0xAD
		if(Instigator == none)
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, 1, Level.GetLocalPlayerController());			
		}
		else
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, 1, Instigator);
		}
	}
	BlowUp(HitLocation);
	bExploded = true;
	// End:0x161
	if((!bNetTemporary && bTearOnExplode) && (int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
	{
		Velocity = vect(0.0000000, 0.0000000, 0.0000000);
		SetCollision(false, false, false);
		TearOffHitNormal = HitNormal;
		bTearOff = true;
		GotoState('NetTrapped');		
	}
	else
	{
		Destroy();
	}
	//return;	
}

function DoDamage(Actor Other, Vector HitLocation)
{
	local RaygunPlagueEffect RPE;

	super.DoDamage(Other, HitLocation);
	// End:0x7F
	if(((Pawn(Other) != none) && Pawn(Other).Health > 0) && Vehicle(Other) == none)
	{
		// End:0x7E
		foreach Other.BasedActors(Class'BWBP_OP_Pro.RaygunPlagueEffect', RPE)
		{
			RPE.ExtendDuration(0.5000000);
			// End:0x7E
			break;			
		}		
	}
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BWBP_OP_Pro.Raygun'
	ImpactManager=Class'BWBP_OP_Pro.IM_Raygun'
	TrailClass=Class'BWBP_OP_Pro.RaygunShotTrail'
	DamageTypeHead=Class'BWBP_OP_Pro.DTRaygun'
	MyRadiusDamageType=Class'BWBP_OP_Pro.DTRaygun'
	bUsePositionalDamage=true
	AccelSpeed=80000.0000000
	MaxDamageGainFactor=0.5000000
	DamageGainStartTime=0.0500000
	DamageGainEndTime=0.2000000
	Speed=4500.0000000
	MaxSpeed=10000.0000000
	Damage=42.0000000
	MyDamageType=Class'BWBP_OP_Pro.DTRaygun'
	ExploWallOut=12.0000000
	LightType=1
	LightHue=30
	LightSaturation=24
	LightBrightness=64.0000000
	LightRadius=24.0000000
	StaticMesh=StaticMesh'WeaponStaticMesh.LinkProjectile'
	bDynamicLight=true
	LifeSpan=1.0000000
	Skins[0]=FinalBlend'BW_Core_WeaponTex.GunFire.A73ProjFinal'
	Skins[1]=FinalBlend'BW_Core_WeaponTex.GunFire.A73Proj2Final'
	Style=6
	SoundVolume=255
	SoundRadius=128.0000000
}
