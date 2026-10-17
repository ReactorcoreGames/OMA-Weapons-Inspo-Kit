class G28GasCloud extends BallisticEmitter;

var G28CloudControl MyControl;
var float Density;
var() Sound IgniteSound;
var Pawn Ignitioneer;

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	MyControl = G28CloudControl(Owner);
	// End:0x55
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		Emitters[0].Disabled = true;
		Emitters[1].Disabled = true;
	}
	//return;	
}

function Reset()
{
	Destroy();
	//return;	
}

simulated function Terminate(float Delay)
{
	SetTimer(Delay, false);
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

simulated function Destroyed()
{
	// End:0x1B
	if(MyControl != none)
	{
		MyControl.CloudDie(self);
	}
	super(Actor).Destroyed();
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
	Density=1.0000000
	// Reference: SpriteEmitter'BWBP_SKC_Pro.G28GasCloud.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=20.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=150,G=150,B=255,A=200))
		ColorScale[1]=(RelativeTime=0.4000000,Color=(R=150,G=150,B=255,A=200))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=58,G=58,B=64,A=64))
		ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.9000000,Max=0.9000000))
		Opacity=0.4900000
		FadeOutStartTime=1.0500000
		FadeInEndTime=1.0500000
		CoordinateSystem=1
		MaxParticles=200
		StartLocationRange=(X=(Min=-96.0000000,Max=96.0000000),Y=(Min=-32.0000000,Max=32.0000000),Z=(Min=-32.0000000,Max=32.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0100000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.3000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=150.0000000,Max=200.0000000),Y=(Min=150.0000000,Max=200.0000000),Z=(Min=150.0000000,Max=200.0000000))
		InitialParticlesPerSecond=0.7000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.NewSmoke1g'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=3.0000000,Max=3.0000000)
		StartVelocityRange=(X=(Min=-15.0000000,Max=15.0000000),Y=(Min=-15.0000000,Max=15.0000000),Z=(Min=-10.0000000,Max=0.0000000))
	end object
	Emitters[0]=SpriteEmitter1
	// Reference: SpriteEmitter'BWBP_SKC_Pro.G28GasCloud.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=150,G=150,B=255,A=200))
		ColorScale[1]=(RelativeTime=0.4000000,Color=(R=150,G=150,B=255,A=200))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=58,G=58,B=64,A=64))
		ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.9000000,Max=0.9000000))
		Opacity=0.5800000
		FadeOutStartTime=1.4500000
		FadeInEndTime=0.6750000
		CoordinateSystem=1
		MaxParticles=20
		StartLocationRange=(X=(Min=-64.0000000,Max=64.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0300000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		InitialParticlesPerSecond=0.7500000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.5000000,Max=2.5000000)
	end object
	Emitters[1]=SpriteEmitter0
	AutoDestroy=true
	CollisionRadius=192.0000000
	CollisionHeight=192.0000000
	bCollideActors=true
	bUseCylinderCollision=true
	bNotOnDedServer=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_SKC_Pro.G28GasCloud.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=20.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=150,G=150,B=255,A=200))
	ColorScale[1]=(RelativeTime=0.4000000,Color=(R=150,G=150,B=255,A=200))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=58,G=58,B=64,A=64))
	ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.9000000,Max=0.9000000))
	Opacity=0.4900000
	FadeOutStartTime=1.0500000
	FadeInEndTime=1.0500000
	CoordinateSystem=1
	MaxParticles=200
	StartLocationRange=(X=(Min=-96.0000000,Max=96.0000000),Y=(Min=-32.0000000,Max=32.0000000),Z=(Min=-32.0000000,Max=32.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0100000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.3000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=150.0000000,Max=200.0000000),Y=(Min=150.0000000,Max=200.0000000),Z=(Min=150.0000000,Max=200.0000000))
	InitialParticlesPerSecond=0.7000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.NewSmoke1g'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=3.0000000,Max=3.0000000)
	StartVelocityRange=(X=(Min=-15.0000000,Max=15.0000000),Y=(Min=-15.0000000,Max=15.0000000),Z=(Min=-10.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.G28GasCloud.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=150,G=150,B=255,A=200))
	ColorScale[1]=(RelativeTime=0.4000000,Color=(R=150,G=150,B=255,A=200))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=58,G=58,B=64,A=64))
	ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.9000000,Max=0.9000000))
	Opacity=0.5800000
	FadeOutStartTime=1.4500000
	FadeInEndTime=0.6750000
	CoordinateSystem=1
	MaxParticles=20
	StartLocationRange=(X=(Min=-64.0000000,Max=64.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0300000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	InitialParticlesPerSecond=0.7500000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.5000000,Max=2.5000000)
end object
