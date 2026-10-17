class M58Cloud extends BallisticEmitter;

const Lifetime = 15;

var() float ThermalBlockRadius;

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x48
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		Emitters[0].Disabled = true;
		Emitters[1].Disabled = true;		
	}
	else
	{
		PlaySound(Sound'BW_Core_WeaponSound.T10.T10-Ignite',, 0.7000000,, 128.0000000, 1.0000000, true);
		AmbientSound = Sound'BW_Core_WeaponSound.T10.T10-ToxinLoop';
	}
	SetTimer(15.0000000, false);
	//return;	
}

function Reset()
{
	Destroy();
	//return;	
}

simulated function Timer()
{
	// End:0x23
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		GotoState('DSDying');		
	}
	else
	{
		Kill();
	}
	//return;	
}

simulated function PhysicsVolumeChange(PhysicsVolume NewVolume)
{
	// End:0x18
	if(NewVolume.bWaterVolume)
	{
		Kill();
	}
	//return;	
}

state DSDying
{Begin:

	Sleep(3.0000000);
	Destroy();
	stop;					
}

defaultproperties
{
	// Reference: SpriteEmitter'BallisticProV55.M58Cloud.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=50.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.6000000,Max=0.6000000),Y=(Min=0.6000000,Max=0.6000000),Z=(Min=0.6000000,Max=0.6000000))
		FadeOutStartTime=4.0000000
		FadeInEndTime=0.4000000
		MaxParticles=24
		StartLocationRange=(X=(Min=-128.0000000,Max=128.0000000),Y=(Min=-128.0000000,Max=128.0000000),Z=(Min=-16.0000000,Max=32.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0100000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7500000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.5000000)
		StartSizeRange=(X=(Min=200.0000000,Max=250.0000000),Y=(Min=200.0000000,Max=250.0000000),Z=(Min=200.0000000,Max=250.0000000))
		ParticlesPerSecond=4.0000000
		InitialParticlesPerSecond=4.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.NewSmoke1g'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=6.0000000,Max=6.0000000)
		StartVelocityRange=(X=(Min=-70.0000000,Max=70.0000000),Y=(Min=-70.0000000,Max=70.0000000),Z=(Min=-10.0000000,Max=0.0000000))
	end object
	Emitters[0]=SpriteEmitter1
	// Reference: SpriteEmitter'BallisticProV55.M58Cloud.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=70.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
		FadeOutStartTime=2.6000000
		FadeInEndTime=0.4000000
		MaxParticles=20
		StartLocationRange=(X=(Min=-128.0000000,Max=128.0000000),Y=(Min=-128.0000000,Max=128.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0300000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		ParticlesPerSecond=4.0000000
		InitialParticlesPerSecond=4.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=3.0000000,Max=3.0000000)
	end object
	Emitters[1]=SpriteEmitter0
	AutoDestroy=true
	bNetTemporary=true
	bAlwaysRelevant=true
	RemoteRole=2
	CollisionRadius=192.0000000
	CollisionHeight=192.0000000
	bUseCylinderCollision=true
	bNotOnDedServer=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.M58Cloud.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=50.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.6000000,Max=0.6000000),Y=(Min=0.6000000,Max=0.6000000),Z=(Min=0.6000000,Max=0.6000000))
	FadeOutStartTime=4.0000000
	FadeInEndTime=0.4000000
	MaxParticles=24
	StartLocationRange=(X=(Min=-128.0000000,Max=128.0000000),Y=(Min=-128.0000000,Max=128.0000000),Z=(Min=-16.0000000,Max=32.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0100000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7500000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.5000000)
	StartSizeRange=(X=(Min=200.0000000,Max=250.0000000),Y=(Min=200.0000000,Max=250.0000000),Z=(Min=200.0000000,Max=250.0000000))
	ParticlesPerSecond=4.0000000
	InitialParticlesPerSecond=4.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.NewSmoke1g'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=6.0000000,Max=6.0000000)
	StartVelocityRange=(X=(Min=-70.0000000,Max=70.0000000),Y=(Min=-70.0000000,Max=70.0000000),Z=(Min=-10.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.M58Cloud.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=70.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	FadeOutStartTime=2.6000000
	FadeInEndTime=0.4000000
	MaxParticles=20
	StartLocationRange=(X=(Min=-128.0000000,Max=128.0000000),Y=(Min=-128.0000000,Max=128.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0300000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	ParticlesPerSecond=4.0000000
	InitialParticlesPerSecond=4.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=3.0000000,Max=3.0000000)
end object
