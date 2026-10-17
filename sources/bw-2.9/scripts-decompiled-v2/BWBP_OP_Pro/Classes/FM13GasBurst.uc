class FM13GasBurst extends BallisticEmitter;

var Controller InstigatorController;
var FM13FireControl FireControl;
var float Speed;

function Reset()
{
	Destroy();
	//return;	
}

function Landed(Vector HitNormal)
{
	HitWall(HitNormal, none);
	//return;	
}

function HitWall(Vector HitNormal, Actor Wall)
{
	FireControl.SprayWall(Location, HitNormal, Instigator, Wall);
	Destroy();
	//return;	
}

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	Velocity = Vector(Rotation) * Speed;
	// End:0x59
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		Emitters[0].Disabled = true;
		Emitters[1].Disabled = true;
	}
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
	Speed=350.0000000
	// Reference: SpriteEmitter'BWBP_OP_Pro.FM13GasBurst.SpriteEmitter6'
	begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=5.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.6000000,Max=0.6000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.8000000,Max=0.8000000))
		Opacity=0.6200000
		FadeOutStartTime=1.2200000
		FadeInEndTime=0.5800000
		MaxParticles=2
		StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=5
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
	end object
	Emitters[0]=SpriteEmitter6
	// Reference: SpriteEmitter'BWBP_OP_Pro.FM13GasBurst.SpriteEmitter7'
	begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
		ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=5.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.6000000,Max=0.6000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.8000000,Max=0.8000000))
		Opacity=0.5600000
		FadeOutStartTime=1.7400000
		FadeInEndTime=1.0800000
		CoordinateSystem=1
		MaxParticles=4
		StartLocationOffset=(X=4.0000000,Y=0.0000000,Z=0.0000000)
		StartLocationShape=1
		SphereRadiusRange=(Min=40.0000000,Max=40.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=70.0000000,Max=90.0000000),Y=(Min=70.0000000,Max=90.0000000),Z=(Min=70.0000000,Max=90.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=5
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke5'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=3.0000000,Max=3.0000000)
		StartVelocityRadialRange=(Min=15.0000000,Max=15.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[1]=SpriteEmitter7
	AutoDestroy=true
	bNetTemporary=true
	Physics=2
	RemoteRole=2
	LifeSpan=10.0000000
	CollisionRadius=2.0000000
	CollisionHeight=2.0000000
	bCollideWorld=true
	bUseCylinderCollision=true
	Mass=30.0000000
	bNotOnDedServer=false
	bDirectional=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_OP_Pro.FM13GasBurst.SpriteEmitter6'
begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=5.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.6000000,Max=0.6000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.8000000,Max=0.8000000))
	Opacity=0.6200000
	FadeOutStartTime=1.2200000
	FadeInEndTime=0.5800000
	MaxParticles=2
	StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=5
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
end object
// Reference: SpriteEmitter'BWBP_OP_Pro.FM13GasBurst.SpriteEmitter7'
begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
	ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=5.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.6000000,Max=0.6000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.8000000,Max=0.8000000))
	Opacity=0.5600000
	FadeOutStartTime=1.7400000
	FadeInEndTime=1.0800000
	CoordinateSystem=1
	MaxParticles=4
	StartLocationOffset=(X=4.0000000,Y=0.0000000,Z=0.0000000)
	StartLocationShape=1
	SphereRadiusRange=(Min=40.0000000,Max=40.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=70.0000000,Max=90.0000000),Y=(Min=70.0000000,Max=90.0000000),Z=(Min=70.0000000,Max=90.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=5
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke5'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=3.0000000,Max=3.0000000)
	StartVelocityRadialRange=(Min=15.0000000,Max=15.0000000)
	GetVelocityDirectionFrom=3
end object
