class Supercharger_ProtonTorpedo extends G5Rocket;

var() Sound ComboSound;
var() float ComboDamage;
var() float ComboRadius;
var() float ComboMomentumTransfer;
var ShockBall ShockBallEffect;
var() int ComboAmmoCost;
var Class<DamageType> ComboDamageType;
var Class<DamageType> ComboDamageType2;
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

event TakeDamage(int Damage, Pawn EventInstigator, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x71
	if((DamageType == ComboDamageType) || DamageType == ComboDamageType2)
	{
		Instigator = EventInstigator;
		SuperExplosion();
		// End:0x71
		if(EventInstigator.Weapon != none)
		{
			EventInstigator.Weapon.ConsumeAmmo(0, float(ComboAmmoCost), true);
			Instigator = EventInstigator;
		}
	}
	//return;	
}

function SuperExplosion()
{
	local Vector HitLocation, HitNormal;

	HurtRadius(ComboDamage, ComboRadius, Class'XWeapons.DamTypeShockCombo', ComboMomentumTransfer, Location);
	Spawn(Class'XEffects.ShockCombo');
	// End:0xA7
	if((int(Level.NetMode) != int(NM_DedicatedServer)) && EffectIsRelevant(Location, false))
	{
		HitActor = Trace(HitLocation, HitNormal, Location - vect(0.0000000, 0.0000000, 120.0000000), Location, false);
		// End:0xA7
		if(HitActor != none)
		{
			Spawn(Class'XEffects.ComboDecal', self,, HitLocation, Rotator(vect(0.0000000, 0.0000000, -1.0000000)));
		}
	}
	PlaySound(ComboSound, 0, 1.0000000,, 800.0000000);
	Destroy();
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
	ComboSound=Sound'WeaponSounds.ShockRifle.ShockComboFire'
	ComboDamage=200.0000000
	ComboRadius=275.0000000
	ComboMomentumTransfer=150000.0000000
	ComboAmmoCost=10
	ComboDamageType=Class'BWBP_SKC_Pro.DTCYLORifle'
	ComboDamageType2=Class'BallisticProV55.DTRX22ABurned'
	ImpactManager=Class'BWBP_SKC_Pro.IM_EMPRocket'
	TrailClass=Class'BWBP_SKC_Pro.Supercharger_PhotonTrail'
	bTearOnExplode=false
	MyRadiusDamageType=Class'BWBP_SKC_Pro.DT_BFGCharge'
	ShakeRotMag=(X=512.0000000,Y=200.0000000,Z=128.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=20.0000000,Y=15.0000000,Z=15.0000000)
	ShakeOffsetTime=2.0000000
	MotionBlurRadius=100.0000000
	AccelSpeed=600.0000000
	Speed=600.0000000
	MaxSpeed=700.0000000
	bSwitchToZeroCollision=true
	Damage=50.0000000
	DamageRadius=400.0000000
	MomentumTransfer=10000.0000000
	MyDamageType=Class'BWBP_SKC_Pro.DT_BFGCharge'
	LightHue=180
	LightBrightness=160.0000000
	LightRadius=8.0000000
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.DarkStar.DarkProjBig'
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
