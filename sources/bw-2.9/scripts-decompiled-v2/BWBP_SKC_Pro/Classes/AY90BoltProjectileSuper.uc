class AY90BoltProjectileSuper extends BallisticProjectile;

struct ZappedTarget
{
	var() Pawn Vic;
	var() float Zaps;
};

var() float ZapDamage;
var() float ZapRadius;
var() float ZapInterval;
var bool bPrimed;
var array<ZappedTarget> OldTargets;

simulated function PreBeginPlay()
{
	local BallisticWeapon BW;

	super(Actor).PreBeginPlay();
	// End:0x13
	if(Instigator == none)
	{
		return;
	}
	BW = BallisticWeapon(Instigator.Weapon);
	// End:0x39
	if(BW == none)
	{
		return;
	}
	BW.default.ParamsClasses[int(BW.GameStyleIndex)].static.OverrideProjectileParams(self, 2);
	//return;	
}

simulated function PostBeginPlay()
{
	SetTimer(0.1000000, false);
	super.PostBeginPlay();
	//return;	
}

simulated event Timer()
{
	local Actor Target;

	// End:0x43
	if(StartDelay > float(0))
	{
		StartDelay = 0.0000000;
		bHidden = false;
		SetPhysics(default.Physics);
		SetCollision(default.bCollideActors, default.bBlockActors, default.bBlockPlayers);
		InitProjectile();
	}
	// End:0xC5
	foreach VisibleCollidingActors(Class'Engine.Actor', Target, ZapRadius - float(70), Location)
	{
		// End:0xC4
		if(Target.bCanBeDamaged && Target != Instigator)
		{
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Target, ZapDamage, Instigator, Target.Location, vect(0.0000000, 0.0000000, 0.0000000), Class'BWBP_SKC_Pro.DT_BFGExplode');
		}		
	}	
	SetTimer(ZapInterval, false);
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
	ZapDamage=10.0000000
	ZapRadius=512.0000000
	ZapInterval=0.1000000
	WeaponClass=Class'BWBP_SKC_Pro.AY90SkrithBoltcaster'
	ImpactManager=Class'BWBP_SKC_Pro.IM_SkrithBFGProjectile'
	DamageTypeHead=Class'BWBP_SKC_Pro.DTAY90SkrithHead'
	MyRadiusDamageType=Class'BWBP_SKC_Pro.DTAY90SkrithRadiusSuper'
	ShakeRotMag=(X=256.0000000,Y=200.0000000,Z=128.0000000)
	ShakeRotTime=2.0000000
	ShakeOffsetMag=(X=10.0000000,Y=15.0000000,Z=15.0000000)
	ShakeOffsetTime=2.0000000
	MotionBlurRadius=1024.0000000
	AccelSpeed=100.0000000
	Speed=8500.0000000
	MaxSpeed=1000000.0000000
	bSwitchToZeroCollision=true
	Damage=500.0000000
	DamageRadius=832.0000000
	MomentumTransfer=280000.0000000
	MyDamageType=Class'BWBP_SKC_Pro.DTAY90Skrith'
	LightHue=150
	LightBrightness=192.0000000
	LightRadius=12.0000000
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.DarkStar.DarkProjBig'
	AmbientSound=Sound'IndoorAmbience.electricity1'
	LifeSpan=16.0000000
	DrawScale=10.0000000
	Skins[0]=FinalBlend'BWBP_SKC_Tex.SkrithBow.AY90ProjectileBig2-Final'
	Skins[1]=FinalBlend'BWBP_SKC_Tex.SkrithBow.AY90Projectile1-Final'
	Style=6
	SoundVolume=255
	SoundRadius=75.0000000
	bProjTarget=true
}
