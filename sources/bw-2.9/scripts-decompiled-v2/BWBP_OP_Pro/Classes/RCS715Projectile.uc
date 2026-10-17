class RCS715Projectile extends BallisticGrenade;

function TargetedHurtRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation, optional Actor Victim)
{
	local Actor Victims;
	local float damageScale, dist;
	local Vector Dir;

	// End:0x0B
	if(bHurtEntry)
	{
		return;
	}
	bHurtEntry = true;
	// End:0x36
	if(Victim == none)
	{
		DamageAmount *= 0.5000000;
		DamageRadius *= 0.7500000;
	}
	// End:0x284
	foreach CollidingActors(Class'Engine.Actor', Victims, DamageRadius, HitLocation)
	{
		// End:0x283
		if(((((Victims != self) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo')) && Victims != Victim) && Victims != HurtWall)
		{
			// End:0xCF
			if(!FastTrace(Victims.Location, Location))
			{
				continue;				
			}
			Dir = Victims.Location;
			// End:0x139
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
			// End:0x201
			if((Instigator == none) || Instigator.Controller == none)
			{
				Victims.SetDelayedDamageInstigatorController(InstigatorController);
			}
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victims, Square(damageScale) * DamageAmount, Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), ((damageScale * Momentum) * 0.6000000) * Dir, DamageType);
		}		
	}	
	bHurtEntry = false;
	//return;	
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	local RCS715FireControl F;
	local Teleporter TB;

	// End:0xF9
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0x9B
		foreach RadiusActors(Class'Engine.Teleporter', TB, 256.0000000)
		{
			// End:0x97
			if(Instigator != none)
			{
				Level.Game.Broadcast(self, ("RCS Grenade thrown by" @ Instigator.PlayerReplicationInfo.PlayerName) @ "too close to a teleporter!");
			}			
			return;			
		}		
		F = Spawn(Class'BWBP_OP_Pro.RCS715FireControl', self,, HitLocation - (HitNormal * float(2)), rot(0, 0, 0));
		// End:0xF9
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
	DetonateDelay=0.1500000
	ImpactDamage=15
	ImpactDamageType=Class'BWBP_OP_Pro.DT_RCS715Grenade'
	WeaponClass=Class'BWBP_OP_Pro.RCS715Shotgun'
	ImpactManager=Class'BallisticProV55.IM_Grenade'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BWBP_OP_Pro.RCS715FireTrail'
	TrailOffset=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ModeIndex=1
	MyRadiusDamageType=Class'BWBP_OP_Pro.DT_RCS715Burned'
	ShakeRadius=512.0000000
	MotionBlurRadius=128.0000000
	AccelSpeed=3000.0000000
	Speed=4000.0000000
	MaxSpeed=15000.0000000
	Damage=50.0000000
	DamageRadius=128.0000000
	MomentumTransfer=0.0000000
	MyDamageType=Class'BWBP_OP_Pro.DT_RCS715Grenade'
	LightHue=180
	LightSaturation=100
	LightBrightness=160.0000000
	LightRadius=8.0000000
	StaticMesh=StaticMesh'BWBP_SKC_Static.Bulldog.Frag12Proj'
	LifeSpan=16.0000000
	DrawScale=2.0000000
}
