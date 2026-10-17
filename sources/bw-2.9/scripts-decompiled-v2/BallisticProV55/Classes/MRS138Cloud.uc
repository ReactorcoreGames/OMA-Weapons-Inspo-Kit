class MRS138Cloud extends BallisticEmitter;

var AvoidMarker Fear;
var MRS138CloudControl MyControl;
var float Density;

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	MyControl = MRS138CloudControl(Owner);
	// End:0xA1
	if(int(Level.NetMode) != int(NM_Client))
	{
		Fear = Spawn(Class'Engine.AvoidMarker');
		Fear.SetCollisionSize(200.0000000, 200.0000000);
		Fear.StartleBots();
		// End:0xA1
		if(int(Level.NetMode) == int(NM_DedicatedServer))
		{
			Emitters[0].Disabled = true;
			Emitters[1].Disabled = true;
		}
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
	// End:0x32
	if(Fear != none)
	{
		Fear.Destroy();
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
	// Reference: SpriteEmitter'BallisticProV55.MRS138Cloud.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=20.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=225,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.0321430,Color=(R=255,G=192,B=128,A=255))
		ColorScale[2]=(RelativeTime=0.0964290,Color=(R=64,G=128,B=0,A=255))
		ColorScale[3]=(RelativeTime=0.1142860,Color=(R=75,G=128,B=0,A=255))
		ColorScale[4]=(RelativeTime=1.0000000,Color=(R=50,G=75,B=0,A=255))
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
		Texture=Texture'BW_Core_WeaponTex.Effects.Smoke7'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=3.0000000,Max=3.0000000)
		StartVelocityRange=(X=(Min=-15.0000000,Max=15.0000000),Y=(Min=-15.0000000,Max=15.0000000),Z=(Min=-10.0000000,Max=0.0000000))
	end object
	Emitters[0]=SpriteEmitter1
	// Reference: SpriteEmitter'BallisticProV55.MRS138Cloud.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=225,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.0321430,Color=(R=255,G=192,B=128,A=255))
		ColorScale[2]=(RelativeTime=0.0964290,Color=(R=64,G=128,B=0,A=255))
		ColorScale[3]=(RelativeTime=0.1142860,Color=(R=75,G=128,B=0,A=255))
		ColorScale[4]=(RelativeTime=1.0000000,Color=(R=50,G=75,B=0,A=255))
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
	CollisionRadius=142.0000000
	CollisionHeight=142.0000000
	bCollideActors=true
	bUseCylinderCollision=true
	bNotOnDedServer=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.MRS138Cloud.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=20.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=225,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.0321430,Color=(R=255,G=192,B=128,A=255))
	ColorScale[2]=(RelativeTime=0.0964290,Color=(R=64,G=128,B=0,A=255))
	ColorScale[3]=(RelativeTime=0.1142860,Color=(R=75,G=128,B=0,A=255))
	ColorScale[4]=(RelativeTime=1.0000000,Color=(R=50,G=75,B=0,A=255))
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
	Texture=Texture'BW_Core_WeaponTex.Effects.Smoke7'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=3.0000000,Max=3.0000000)
	StartVelocityRange=(X=(Min=-15.0000000,Max=15.0000000),Y=(Min=-15.0000000,Max=15.0000000),Z=(Min=-10.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.MRS138Cloud.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=225,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.0321430,Color=(R=255,G=192,B=128,A=255))
	ColorScale[2]=(RelativeTime=0.0964290,Color=(R=64,G=128,B=0,A=255))
	ColorScale[3]=(RelativeTime=0.1142860,Color=(R=75,G=128,B=0,A=255))
	ColorScale[4]=(RelativeTime=1.0000000,Color=(R=50,G=75,B=0,A=255))
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
