class HVPCMk66Projectile extends BallisticProjectile;

//var delegate<OnDie> __OnDie__Delegate;

delegate OnDie(Actor cam)
{
	//return;	
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	OnDie(self);
	super.Explode(HitLocation, HitNormal);
	//return;	
}

simulated function InitEffects()
{
	local Vector X, Y, Z;

	bDynamicLight = default.bDynamicLight;
	// End:0xC1
	if(((int(Level.NetMode) != int(NM_DedicatedServer)) && TrailClass != none) && Trail == none)
	{
		GetAxes(Rotation, X, Y, Z);
		Trail = Spawn(TrailClass, self,, ((Location + (X * TrailOffset.X)) + (Y * TrailOffset.Y)) + (Z * TrailOffset.Z), Rotation);
		// End:0xC1
		if(Trail != none)
		{
			Trail.SetBase(self);
		}
	}
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BWBP_SKC_Pro.HVPCMk66PlasmaCannon'
	ImpactManager=Class'BWBP_SKC_Pro.IM_HVPCMk66Projectile'
	TrailClass=Class'BWBP_SKC_Pro.HVPCMk66BFGTrail'
	MyRadiusDamageType=Class'BWBP_SKC_Pro.DT_BFGCharge'
	ShakeRotMag=(X=256.0000000,Y=200.0000000,Z=128.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=10.0000000,Y=15.0000000,Z=15.0000000)
	ShakeOffsetTime=2.0000000
	MotionBlurRadius=512.0000000
	Speed=3000.0000000
	MaxSpeed=3000.0000000
	bSwitchToZeroCollision=true
	Damage=500.0000000
	DamageRadius=1280.0000000
	MomentumTransfer=100000.0000000
	MyDamageType=Class'BWBP_SKC_Pro.DT_BFGCharge'
	LightHue=110
	LightSaturation=20
	LightBrightness=160.0000000
	LightRadius=12.0000000
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.DarkStar.DarkProjBig'
	AmbientSound=Sound'IndoorAmbience.electricity1'
	LifeSpan=16.0000000
	Skins[0]=FinalBlend'BWBP_SKC_Tex.BFG.BFGProj2FB'
	Skins[1]=FinalBlend'BWBP_SKC_Tex.BFG.BFGProjFB'
	Style=6
	SoundVolume=255
	SoundRadius=75.0000000
	bProjTarget=true
	RotationRate=(Pitch=0,Yaw=0,Roll=1638)
}
