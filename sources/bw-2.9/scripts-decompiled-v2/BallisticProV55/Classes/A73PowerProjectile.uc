class A73PowerProjectile extends A73Projectile;

var() float FallSpeed;

simulated function Tick(float dt)
{
	local Vector DS;

	// End:0x0B
	if(bScaleDone)
	{
		return;
	}
	DS.X = (default.LifeSpan - LifeSpan) / 0.4000000;
	DS.Y = 0.2000000 + DS.X;
	DS.Z = DS.Y;
	// End:0x8C
	if(DS.X >= 0.8000000)
	{
		DS.X = 0.8000000;
		bScaleDone = true;
		InitEffects();
	}
	SetDrawScale3D(DS);
	//return;	
}

function BlowUp(Vector HitLocation)
{
	// End:0x12
	if(int(Role) < int(ROLE_Authority))
	{
		return;
	}
	// End:0x52
	if(DamageRadius > float(0))
	{
		TargetedHurtRadius((Damage * 0.5000000) * GetDamageOverRangeFactor(), DamageRadius, MyRadiusDamageType, MomentumTransfer, HitLocation, HitActor);
	}
	MakeNoise(1.0000000);
	//return;	
}

simulated function InitProjectile()
{
	InitEffects();
	//return;	
}

simulated function TargetedHurtRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation, optional Actor Victim)
{
	local Actor Target;
	local float damageScale, dist;
	local Vector Dir;

	// End:0x0B
	if(bHurtEntry)
	{
		return;
	}
	bHurtEntry = true;
	DamageRadius += (float(75) * FMin((default.LifeSpan - LifeSpan) / float(3), 1.0000000));
	// End:0x1DE
	foreach VisibleCollidingActors(Class'Engine.Actor', Target, DamageRadius, HitLocation)
	{
		// End:0x1DD
		if(((((Target != self) && int(Target.Role) == int(ROLE_Authority)) && !Target.IsA('FluidSurfaceInfo')) && Target != Victim) && Target != HurtWall)
		{
			Dir = Target.Location - HitLocation;
			dist = FMax(1.0000000, VSize(Dir));
			Dir = Dir / dist;
			damageScale = FMax(1.0000000 - Sqrt(FMax(0.0000000, dist - Target.CollisionRadius) / DamageRadius), 0.0000000);
			// End:0x162
			if((Instigator == none) || Instigator.Controller == none)
			{
				Target.SetDelayedDamageInstigatorController(InstigatorController);
			}
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Target, Square(damageScale) * DamageAmount, Instigator, Target.Location - ((0.5000000 * (Target.CollisionHeight + Target.CollisionRadius)) * Dir), (damageScale * Momentum) * Dir, DamageType);
		}		
	}	
	bHurtEntry = false;
	//return;	
}

defaultproperties
{
	FallSpeed=300.0000000
	ImpactManager=Class'BallisticProV55.IM_A73Lob'
	TrailClass=Class'BallisticProV55.A73PowerTrailEmitter'
	ModeIndex=1
	bPenetrate=false
	MyRadiusDamageType=Class'BallisticProV55.DTA73SkrithPowerRadius'
	bUsePositionalDamage=false
	ShakeRadius=300.0000000
	MotionBlurRadius=250.0000000
	MotionBlurFactor=2.0000000
	MotionBlurTime=2.0000000
	MyDamageType=Class'BallisticProV55.DTA73SkrithPower'
	LightBrightness=225.0000000
	LightRadius=18.0000000
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.A42.A42Projectile'
	LifeSpan=9.0000000
	Skins[0]=FinalBlend'BW_Core_WeaponTex.GunFire.A73ProjFinal'
	Skins[1]=FinalBlend'BW_Core_WeaponTex.GunFire.A73Proj2Final'
	SoundRadius=128.0000000
	bFixedRotationDir=false
	bOrientToVelocity=true
}
