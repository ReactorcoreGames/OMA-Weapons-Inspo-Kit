class AY90ActorExploder extends BallisticEmitter;

var Actor Victim;
var() Class<DamageType> DamageType;
var() Class<DamageType> MyRadiusDamageType;
var() Class<BCImpactManager> ImpactManager;
var() int Damage;
var() int StickDamage;
var() int DamageRadius;
var() bool bDetonated;
var() bool bExploded;
var() Sound ArmingSound;
var Controller InstigatorController;
var() ProjectileEffectParams.ERadiusFallOffType RadiusFallOffType;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		bDetonated;

	// Pos:0x00D
	reliable if(int(Role) == int(ROLE_Authority))
		Victim;
}

simulated event PostNetBeginPlay()
{
	super(Actor).PostNetBeginPlay();
	// End:0x2E
	if((int(Role) < int(ROLE_Authority)) && Victim != none)
	{
		Initialize(Victim);
	}
	//return;	
}

function PreBeginPlay()
{
	super(Actor).PreBeginPlay();
	Instigator = Pawn(Owner);
	// End:0x35
	if(Instigator != none)
	{
		InstigatorController = Instigator.Controller;
	}
	//return;	
}

simulated event PostNetReceive()
{
	super(Actor).PostNetReceive();
	// End:0x21
	if(bDetonated)
	{
		Explode(Location, Vector(Rotation));
	}
	//return;	
}

function Reset()
{
	Destroy();
	//return;	
}

simulated function Initialize(Actor V)
{
	// End:0x0D
	if(V == none)
	{
		return;
	}
	Victim = V;
	SetTimer(1.0000000, true);
	SetLocation(Victim.Location - (vect(0.0000000, 0.0000000, 1.0000000) * Victim.CollisionHeight));
	SetRotation(Victim.Rotation + rot(0, -16384, 0));
	SetBase(Victim);
	// End:0x9F
	if(int(Role) == int(ROLE_Authority))
	{
		PlaySound(ArmingSound,, 2.0000000,, 256.0000000);
	}
	//return;	
}

simulated event Timer()
{
	// End:0x15
	if(int(Role) < int(ROLE_Authority))
	{
		return;		
	}
	else
	{
		bDetonated = true;
		// End:0xAF
		if((Victim != none) && int(Level.NetMode) != int(NM_Client))
		{
			// End:0x78
			if((Instigator == none) || Instigator.Controller == none)
			{
				Victim.SetDelayedDamageInstigatorController(InstigatorController);
			}
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victim, float(StickDamage), Instigator, Location, vect(0.0000000, 0.0000000, 0.0000000), DamageType);
		}
		Explode(Location, Vector(Rotation));
		Kill();
	}
	//return;	
}

simulated event Tick(float dt)
{
	super(Actor).Tick(dt);
	// End:0x2D
	if((Victim == none) || Victim.bDeleteMe)
	{
		Destroy();
	}
	// End:0x49
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		Destroy();
	}
	// End:0x7C
	if((xPawn(Victim) != none) && xPawn(Victim).bDeRes)
	{
		SetBase(none);
		Kill();
	}
	//return;	
}

function BlowUp(Vector HitLocation)
{
	// End:0x12
	if(int(Role) < int(ROLE_Authority))
	{
		return;
	}
	// End:0x1D
	if(DamageRadius > 0)
	{
	}
	MakeNoise(1.0000000);
	//return;	
}

simulated function Explode(Vector HitLocation, Vector HitNormal)
{
	local int Surf;

	// End:0x0B
	if(bExploded)
	{
		return;
	}
	// End:0x8F
	if((ImpactManager != none) && int(Level.NetMode) != int(NM_DedicatedServer))
	{
		// End:0x6C
		if(Instigator == none)
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, Surf, Level.GetLocalPlayerController());			
		}
		else
		{
			ImpactManager.static.StartSpawn(HitLocation, HitNormal, Surf, Instigator);
		}
	}
	BlowUp(HitLocation);
	bExploded = true;
	// End:0xE0
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
	{
		GotoState('NetTrapped');		
	}
	else
	{
		Destroy();
	}
	//return;	
}

function TargetedHurtRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation, optional Actor Victim)
{
	local Actor Victims;
	local float damageScale, dist;
	local Vector Dir;
	local bool can_see;

	// End:0x0B
	if(bHurtEntry)
	{
		return;
	}
	bHurtEntry = true;
	// End:0x28D
	foreach CollidingActors(Class'Engine.Actor', Victims, DamageRadius, HitLocation)
	{
		// End:0x28C
		if((((Victims.bCanBeDamaged && Victims != self) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo')) && Victims != Victim)
		{
			can_see = FastTrace(Victims.Location, Location);
			damageScale = 1.0000000;
			Dir = Victims.Location;
			// End:0x122
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
			Dir /= dist;
			// End:0x1E5
			if(can_see)
			{
				// End:0x1C8
				if(int(RadiusFallOffType) != int(2))
				{
					damageScale = 1.0000000 - FMax(0.0000000, (dist - Victims.CollisionRadius) / DamageRadius);
				}
				// End:0x1E5
				if(int(RadiusFallOffType) == int(1))
				{
					damageScale = Square(damageScale);
				}
			}
			// End:0x21A
			if((Instigator == none) || Instigator.Controller == none)
			{
				Victims.SetDelayedDamageInstigatorController(InstigatorController);
			}
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victims, damageScale * DamageAmount, Instigator, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), damageScale * Dir, DamageType);
		}		
	}	
	bHurtEntry = false;
	//return;	
}

defaultproperties
{
	DamageType=Class'BWBP_SKC_Pro.DTAY90Skrith'
	MyRadiusDamageType=Class'BWBP_SKC_Pro.DTAY90Skrith'
	ImpactManager=Class'BWBP_SKC_Pro.IM_SkrithbowSticky'
	Damage=150
	StickDamage=150
	DamageRadius=256
	ArmingSound=Sound'BWBP_SKC_Sounds.SkrithBow.Skrithbow-Fuse'
	RadiusFallOffType=1
	// Reference: SpriteEmitter'BWBP_SKC_Pro.AY90ActorExploder.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.4000000
		FadeOutStartTime=1.3000000
		FadeInEndTime=1.3000000
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=9.0000000,Y=0.0000000,Z=0.0000000)
		StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
		InitialParticlesPerSecond=100.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=3.0000000,Max=3.0000000)
	end object
	Emitters[0]=SpriteEmitter0
	// Reference: SpriteEmitter'BWBP_SKC_Pro.AY90ActorExploder.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=255,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		FadeInEndTime=0.2500000
		CoordinateSystem=1
		MaxParticles=40
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
		StartSizeRange=(X=(Min=7.0000000,Max=7.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		ParticlesPerSecond=4.0000000
		Texture=Texture'AW-2004Particles.Energy.AirBlast'
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		InitialDelayRange=(Min=0.3000000,Max=0.3000000)
	end object
	Emitters[1]=SpriteEmitter2
	// Reference: SpriteEmitter'BWBP_SKC_Pro.AY90ActorExploder.SpriteEmitter3'
	begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.7500000,Color=(R=0,G=0,B=255,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		Opacity=0.2500000
		CoordinateSystem=1
		MaxParticles=40
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=17.0000000,Max=17.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		ParticlesPerSecond=4.0000000
		Texture=Texture'AW-2004Particles.Energy.EclipseCircle'
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		InitialDelayRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[2]=SpriteEmitter3
	// Reference: SpriteEmitter'BWBP_SKC_Pro.AY90ActorExploder.SpriteEmitter5'
	begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
		FadeOut=true
		UniformSize=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-1500.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.9200000
		StartLocationShape=1
		SphereRadiusRange=(Min=0.0000000,Max=25.0000000)
		StartSizeRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=2.0000000,Max=2.0000000),Z=(Min=2.0000000,Max=2.0000000))
		Texture=Texture'BW_Core_WeaponTex.GunFire.A73MuzzleFlash'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		SubdivisionStart=1
		SubdivisionEnd=1
		LifetimeRange=(Min=0.4010000,Max=0.4010000)
		StartVelocityRange=(X=(Min=-150.0000000,Max=150.0000000),Y=(Min=-150.0000000,Max=150.0000000),Z=(Min=-150.0000000,Max=150.0000000))
	end object
	Emitters[3]=SpriteEmitter5
	AutoDestroy=true
	LightType=1
	LightEffect=21
	LightHue=192
	LightSaturation=100
	LightBrightness=200.0000000
	LightRadius=15.0000000
	bDynamicLight=true
	RemoteRole=2
	bFullVolume=true
	bHardAttach=true
	SoundVolume=255
	SoundRadius=128.0000000
	bNotOnDedServer=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_SKC_Pro.AY90ActorExploder.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.4000000
	FadeOutStartTime=1.3000000
	FadeInEndTime=1.3000000
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=9.0000000,Y=0.0000000,Z=0.0000000)
	StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
	InitialParticlesPerSecond=100.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=3.0000000,Max=3.0000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.AY90ActorExploder.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=255,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	FadeInEndTime=0.2500000
	CoordinateSystem=1
	MaxParticles=40
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
	StartSizeRange=(X=(Min=7.0000000,Max=7.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	ParticlesPerSecond=4.0000000
	Texture=Texture'AW-2004Particles.Energy.AirBlast'
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	InitialDelayRange=(Min=0.3000000,Max=0.3000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.AY90ActorExploder.SpriteEmitter3'
begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.7500000,Color=(R=0,G=0,B=255,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	Opacity=0.2500000
	CoordinateSystem=1
	MaxParticles=40
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=17.0000000,Max=17.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	ParticlesPerSecond=4.0000000
	Texture=Texture'AW-2004Particles.Energy.EclipseCircle'
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	InitialDelayRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.AY90ActorExploder.SpriteEmitter5'
begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
	FadeOut=true
	UniformSize=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-1500.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.9200000
	StartLocationShape=1
	SphereRadiusRange=(Min=0.0000000,Max=25.0000000)
	StartSizeRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=2.0000000,Max=2.0000000),Z=(Min=2.0000000,Max=2.0000000))
	Texture=Texture'BW_Core_WeaponTex.GunFire.A73MuzzleFlash'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	SubdivisionStart=1
	SubdivisionEnd=1
	LifetimeRange=(Min=0.4010000,Max=0.4010000)
	StartVelocityRange=(X=(Min=-150.0000000,Max=150.0000000),Y=(Min=-150.0000000,Max=150.0000000),Z=(Min=-150.0000000,Max=150.0000000))
end object
