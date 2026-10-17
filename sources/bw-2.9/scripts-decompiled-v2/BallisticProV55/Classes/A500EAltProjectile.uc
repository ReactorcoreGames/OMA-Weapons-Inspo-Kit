class A500EAltProjectile extends BallisticGrenade;

var int BaseImpactDamage;
var int BonusImpactDamage;
var float AcidLoad;

simulated function ApplyImpactEffect(Actor Other, Vector HitLocation)
{
	local int DirectDamage;

	// End:0x35
	if((Instigator == none) || Instigator.Controller == none)
	{
		Other.SetDelayedDamageInstigatorController(InstigatorController);
	}
	DirectDamage = int(float(BaseImpactDamage) + (float(BonusImpactDamage) * AcidLoad));
	Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Other, float(DirectDamage), Instigator, HitLocation, MomentumTransfer * Normal(Velocity), ImpactDamageType);
	ReduceHP(Other);
	//return;	
}

function ReduceHP(Actor Other)
{
	local A500HPReducer hpReducer;

	// End:0xDF
	if(((Pawn(Other) != none) && Pawn(Other).Health > 0) && Vehicle(Other) == none)
	{
		hpReducer = A500HPReducer(Pawn(Other).FindInventoryType(Class'BallisticProV55.A500HPReducer'));
		// End:0xC3
		if(hpReducer == none)
		{
			Pawn(Other).CreateInventory("BallisticProV55.A500HPReducer");
			hpReducer = A500HPReducer(Pawn(Other).FindInventoryType(Class'BallisticProV55.A500HPReducer'));
		}
		hpReducer.AddStack(int(float(12) * AcidLoad));
	}
	//return;	
}

simulated function BlowUp(Vector HitLocation)
{
	local Vector Start;

	Start = Location;
	TargetedHurtRadius(Damage, DamageRadius * AcidLoad, MyRadiusDamageType, MomentumTransfer, HitLocation, HitActor);
	// End:0x4E
	if(int(Role) == int(ROLE_Authority))
	{
		MakeNoise(1.0000000);
	}
	//return;	
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	local A500AcidControl F;
	local Teleporter TB;

	super.Explode(HitLocation, HitNormal);
	// End:0x115
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0xAD
		foreach RadiusActors(Class'Engine.Teleporter', TB, 256.0000000)
		{
			// End:0xA9
			if(Instigator != none)
			{
				Level.Game.Broadcast(self, ("A500 Acid Bomb fired by" @ Instigator.PlayerReplicationInfo.PlayerName) @ "too close to a teleporter!");
			}			
			return;			
		}		
		F = Spawn(Class'BallisticProV55.A500AcidControl', self,, HitLocation + (HitNormal * float(4)), rot(0, 0, 0));
		// End:0x115
		if(F != none)
		{
			F.Instigator = Instigator;
			F.Initialize(HitNormal, AcidLoad);
		}
	}
	Destroy();
	//return;	
}

function AdjustSpeed()
{
	Velocity = Vector(Rotation) * ((default.Speed * 0.2500000) + ((default.Speed * 0.7500000) * AcidLoad));
	//return;	
}

defaultproperties
{
	BaseImpactDamage=50
	BonusImpactDamage=100
	ArmedDetonateOn=1
	ArmedPlayerImpactType=1
	bNoInitialSpin=true
	bAlignToVelocity=true
	DetonateDelay=1.0000000
	ImpactDamageType=Class'BallisticProV55.DTA500Impact'
	ImpactManager=Class'BallisticProV55.IM_A500EAcidExplode'
	SplashManager=Class'BallisticProV55.IM_ProjWater'
	TrailClass=Class'BallisticProV55.A500EProjectileTrail'
	TrailOffset=(X=-8.0000000,Y=0.0000000,Z=0.0000000)
	ModeIndex=1
	MyRadiusDamageType=Class'BallisticProV55.DTA500Splash'
	ShakeRadius=0.0000000
	MotionBlurRadius=384.0000000
	MotionBlurFactor=3.0000000
	MotionBlurTime=4.0000000
	MyDamageType=Class'BallisticProV55.DTA500Splash'
	LightType=1
	LightEffect=21
	LightHue=54
	LightSaturation=100
	LightBrightness=150.0000000
	LightRadius=8.0000000
	bDynamicLight=true
	DrawScale=1.0000000
}
