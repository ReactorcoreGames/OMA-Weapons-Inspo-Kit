class Wendigo_EMPTorpedo extends BallisticProjectile;

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
	// End:0xEF
	if(((int(Level.NetMode) != int(NM_DedicatedServer)) && TrailClass != none) && Trail == none)
	{
		GetAxes(Rotation, X, Y, Z);
		Trail = Spawn(TrailClass, self,, ((Location + (X * TrailOffset.X)) + (Y * TrailOffset.Y)) + (Z * TrailOffset.Z), Rotation);
		// End:0xD7
		if(Emitter(Trail) != none)
		{
			Class'BCoreProV55.BallisticEmitter'.static.ScaleEmitter(Emitter(Trail), DrawScale);
		}
		// End:0xEF
		if(Trail != none)
		{
			Trail.SetBase(self);
		}
	}
	//return;	
}

defaultproperties
{
	WeaponClass=Class'BWBP_APC_Pro.WendigoSMG'
	ImpactManager=Class'BWBP_SKC_Pro.IM_EMPRocketLarge'
	TrailClass=Class'Onslaught.ONSBluePlasmaFireEffect'
	ModeIndex=1
	bTearOnExplode=false
	MyRadiusDamageType=Class'BWBP_SKC_Pro.DT_BFGCharge'
	ShakeRotMag=(X=256.0000000,Y=200.0000000,Z=128.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=10.0000000,Y=15.0000000,Z=15.0000000)
	ShakeOffsetTime=2.0000000
	MotionBlurRadius=300.0000000
	AccelSpeed=1200.0000000
	Speed=3600.0000000
	MaxSpeed=1000000.0000000
	bSwitchToZeroCollision=true
	Damage=70.0000000
	DamageRadius=240.0000000
	MomentumTransfer=10000.0000000
	MyDamageType=Class'BWBP_SKC_Pro.DT_BFGCharge'
	LightHue=180
	LightSaturation=100
	LightBrightness=160.0000000
	LightRadius=8.0000000
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.DarkStar.DarkProjBig'
	bNetTemporary=false
	bSkipActorPropertyReplication=true
	bOnlyDirtyReplication=true
	AmbientSound=Sound'WeaponSounds.ShockRifle.ShockRifleProjectile'
	LifeSpan=16.0000000
	Skins[0]=FinalBlend'BWBP_SKC_Tex.LS14.EMPProjFB'
	Skins[1]=FinalBlend'BWBP_SKC_Tex.LS14.EMPProjFB'
	Style=6
	SoundVolume=255
	SoundRadius=75.0000000
	bProjTarget=true
	RotationRate=(Pitch=0,Yaw=0,Roll=1638)
}
