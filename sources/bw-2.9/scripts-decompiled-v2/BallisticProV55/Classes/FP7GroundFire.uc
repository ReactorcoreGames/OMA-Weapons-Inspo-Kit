class FP7GroundFire extends BallisticEmitter;

const BURNINTERVAL = 0.2;

var float BurnTime;
var float Damage;
var() Class<DamageType> DamageType;
var AvoidMarker Fear;
var Controller InstigatorController;
var FP7FireControl FireControl;

function Reset()
{
	Destroy();
	//return;	
}

function PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x23
	if(Class'BCoreProV55.BallisticReplicationInfo'.static.IsTactical())
	{
		BurnTime = 7.0000000;
	}
	// End:0x50
	if(int(Level.NetMode) != int(NM_Client))
	{
		SetTimer(0.2000000 + (FRand() * 0.5000000), true);
	}
	BurnTime -= (float(4) * FRand());
	// End:0xB2
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		Emitters[0].Disabled = true;
		Emitters[1].Disabled = true;
		Emitters[2].Disabled = true;
	}
	//return;	
}

simulated function Tick(float dt)
{
	super(Actor).Tick(dt);
	// End:0x1E
	if(BurnTime == float(666))
	{
		return;
	}
	BurnTime -= dt;
	// End:0x48
	if(BurnTime <= float(0))
	{
		Kill();
		BurnTime = 666.0000000;
	}
	//return;	
}

singular simulated event BaseChange()
{
	// End:0x13
	if(Mover(Base) != none)
	{
		Destroy();
	}
	//return;	
}

function Landed(Vector HitNormal)
{
	HitWall(HitNormal, none);
	//return;	
}

function HitWall(Vector HitNormal, Actor Wall)
{
	SetPhysics(0);
	// End:0x20
	if(int(Level.NetMode) == int(NM_Client))
	{
		return;
	}
	bCollideWorld = false;
	SetCollision(true, false, false);
	SetCollisionSize(72.0000000, 72.0000000);
	Fear = Spawn(Class'Engine.AvoidMarker');
	Fear.SetCollisionSize(120.0000000, 120.0000000);
	Fear.StartleBots();
	//return;	
}

function Timer()
{
	local Actor A;

	// End:0x2F
	if((int(Level.NetMode) == int(NM_DedicatedServer)) && BurnTime == float(666))
	{
		Destroy();
	}
	// End:0x43
	if(PhysicsVolume.bWaterVolume)
	{
		return;
	}
	// End:0xFD
	foreach TouchingActors(Class'Engine.Actor', A)
	{
		// End:0x88
		if((Instigator == none) || Instigator.Controller == none)
		{
			A.SetDelayedDamageInstigatorController(InstigatorController);
		}
		// End:0xBE
		if(Pawn(A) != none)
		{
			FireControl.TryDamage(Pawn(A), 0.2000000, DamageType);
			// End:0xFC
			continue;
		}
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(A, Damage, Instigator, A.Location, vect(0.0000000, 0.0000000, 0.0000000), DamageType);		
	}	
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(Fear != none)
	{
		Fear.Destroy();
	}
	super(Actor).Destroyed();
	//return;	
}

simulated function PhysicsVolumeChange(PhysicsVolume NewVolume)
{
	// End:0x37
	if(NewVolume.bWaterVolume)
	{
		// End:0x31
		if(int(Level.NetMode) == int(NM_DedicatedServer))
		{
			Destroy();			
		}
		else
		{
			Kill();
		}
	}
	//return;	
}

defaultproperties
{
	BurnTime=12.0000000
	Damage=30.0000000
	DamageType=Class'BallisticProV55.DTFP7Burned'
	// Reference: SpriteEmitter'BallisticProV55.FP7GroundFire.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		FadeOut=true
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.6000000,Max=0.8000000),Z=(Min=0.4000000,Max=0.6000000))
		FadeOutStartTime=0.5000000
		StartLocationRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=2.0000000,Max=3.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=4.0000000,Max=7.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=60.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlamePartsAlpha'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=125.0000000))
	end object
	Emitters[0]=SpriteEmitter1
	// Reference: SpriteEmitter'BallisticProV55.FP7GroundFire.SpriteEmitter9'
	begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.9000000,Max=1.0000000),Y=(Min=0.6000000,Max=0.7000000),Z=(Min=0.4000000,Max=0.6000000))
		FadeOutStartTime=0.4000000
		FadeInEndTime=0.2000000
		CoordinateSystem=1
		MaxParticles=3
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=15.0000000)
		StartLocationRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=30.0000000,Max=50.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=4.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.BlazingSubdivide'
		TextureUSubdivisions=4
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=65.0000000))
	end object
	Emitters[1]=SpriteEmitter9
	// Reference: SpriteEmitter'BallisticProV55.FP7GroundFire.SpriteEmitter10'
	begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		UniformSize=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=60.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=0,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.4000000,Max=0.8000000),Z=(Min=0.0000000,Max=0.4000000))
		FadeOutStartTime=0.2400000
		FadeInEndTime=0.0750000
		MaxParticles=2
		DetailMode=2
		StartLocationRange=(X=(Min=-30.0000000,Max=30.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=0.0000000,Max=30.0000000))
		StartSizeRange=(X=(Min=7.0000000,Max=70.0000000),Y=(Min=7.0000000,Max=70.0000000),Z=(Min=7.0000000,Max=70.0000000))
		DrawStyle=6
		Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
		LifetimeRange=(Min=0.1000000,Max=0.5000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=30.0000000))
	end object
	Emitters[2]=SpriteEmitter10
	AutoDestroy=true
	Physics=2
	CollisionRadius=2.0000000
	CollisionHeight=2.0000000
	bCollideWorld=true
	bUseCylinderCollision=true
	Mass=30.0000000
	bNotOnDedServer=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.FP7GroundFire.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	FadeOut=true
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.6000000,Max=0.8000000),Z=(Min=0.4000000,Max=0.6000000))
	FadeOutStartTime=0.5000000
	StartLocationRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=2.0000000,Max=3.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=4.0000000,Max=7.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=60.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlamePartsAlpha'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=125.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.FP7GroundFire.SpriteEmitter9'
begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.9000000,Max=1.0000000),Y=(Min=0.6000000,Max=0.7000000),Z=(Min=0.4000000,Max=0.6000000))
	FadeOutStartTime=0.4000000
	FadeInEndTime=0.2000000
	CoordinateSystem=1
	MaxParticles=3
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=15.0000000)
	StartLocationRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=30.0000000,Max=50.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=4.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.BlazingSubdivide'
	TextureUSubdivisions=4
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=65.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.FP7GroundFire.SpriteEmitter10'
begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	UniformSize=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=60.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=0,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.4000000,Max=0.8000000),Z=(Min=0.0000000,Max=0.4000000))
	FadeOutStartTime=0.2400000
	FadeInEndTime=0.0750000
	MaxParticles=2
	DetailMode=2
	StartLocationRange=(X=(Min=-30.0000000,Max=30.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=0.0000000,Max=30.0000000))
	StartSizeRange=(X=(Min=7.0000000,Max=70.0000000),Y=(Min=7.0000000,Max=70.0000000),Z=(Min=7.0000000,Max=70.0000000))
	DrawStyle=6
	Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
	LifetimeRange=(Min=0.1000000,Max=0.5000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=30.0000000))
end object
