class NewExplosionA extends Emitter;

var Texture ExplosionTextures[2];

simulated function PostNetBeginPlay()
{
	local PlayerController PC;
	local float Dist;

	PC = Level.GetLocalPlayerController();
	// End:0x3D
	if((int(Level.NetMode) == int(NM_DedicatedServer)) || PC == none)
	{
		return;
	}
	// End:0x5F
	if(PC.ViewTarget == none)
	{
		Dist = 10000.0000000;		
	}
	else
	{
		Dist = VSize(PC.ViewTarget.Location - Location);
	}
	// End:0xCD
	if(Dist > float(4000))
	{
		LightType = 0;
		bDynamicLight = false;
		// End:0xCA
		if(Dist > float(7000))
		{
			Emitters[1].Disabled = true;
		}		
	}
	else
	{
		// End:0xEA
		if(Level.bDropDetail)
		{
			LightRadius = 7.0000000;
		}
	}
	Emitters[0].Texture = ExplosionTextures[Rand(2)];
	//return;	
}

defaultproperties
{
	ExplosionTextures[0]=Texture'ExplosionTex.Framed.we1_frames'
	ExplosionTextures[1]=Texture'ExplosionTex.Framed.exp2_frames'
	// Reference: SpriteEmitter'XEffects.NewExplosionA.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		RespawnDeadParticles=false
		SpinParticles=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		MaxParticles=3
		StartLocationShape=1
		SphereRadiusRange=(Min=24.0000000,Max=24.0000000)
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=50.0000000,Max=70.0000000),Y=(Min=50.0000000,Max=70.0000000),Z=(Min=50.0000000,Max=70.0000000))
		InitialParticlesPerSecond=10.0000000
		Texture=Texture'ExplosionTex.Framed.we1_frames'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4000000,Max=0.6000000)
	end object
	Emitters[0]=SpriteEmitter1
	// Reference: SpriteEmitter'XEffects.NewExplosionA.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		UseRandomSubdivision=true
		UseVelocityScale=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=20.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[1]=(RelativeTime=0.1250000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[2]=(RelativeTime=0.3300000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[3]=(RelativeTime=0.7500000,Color=(R=128,G=128,B=128,A=255))
		ColorScale[4]=(RelativeTime=1.0000000,Color=(R=64,G=64,B=64,A=0))
		MaxParticles=15
		StartLocationShape=2
		StartLocationPolarRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-32768.0000000,Max=32768.0000000),Z=(Min=10.0000000,Max=10.0000000))
		UseRotationFrom=1
		RotationOffset=(Pitch=0,Yaw=-16384,Roll=0)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
		InitialParticlesPerSecond=500.0000000
		DrawStyle=1
		Texture=Texture'ExplosionTex.Framed.SmokeReOrdered'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRadialRange=(Min=200.0000000,Max=200.0000000)
		GetVelocityDirectionFrom=3
		VelocityScale[0]=(RelativeTime=0.0000000,RelativeVelocity=(X=1.0000000,Y=1.0000000,Z=1.0000000))
		VelocityScale[1]=(RelativeTime=0.3000000,RelativeVelocity=(X=0.1000000,Y=0.1000000,Z=0.1000000))
		VelocityScale[2]=(RelativeTime=1.0000000,RelativeVelocity=(X=0.0000000,Y=0.0000000,Z=0.0000000))
	end object
	Emitters[1]=SpriteEmitter0
	// Reference: SpriteEmitter'XEffects.NewExplosionA.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		FadeOutStartTime=0.0500000
		MaxParticles=1
		StartLocationShape=1
		SphereRadiusRange=(Min=2.0000000,Max=2.0000000)
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=110.0000000,Max=120.0000000),Y=(Min=110.0000000,Max=120.0000000),Z=(Min=80.0000000,Max=90.0000000))
		InitialParticlesPerSecond=10.0000000
		Texture=Texture'XEffects.Skins.Rexpt'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.3000000,Max=0.3000000)
	end object
	Emitters[2]=SpriteEmitter2
	AutoDestroy=true
	LightType=10
	LightEffect=21
	LightHue=28
	LightSaturation=90
	LightBrightness=255.0000000
	LightRadius=9.0000000
	LightPeriod=32
	LightCone=128
	bNoDelete=false
	bDynamicLight=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'XEffects.NewExplosionA.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	RespawnDeadParticles=false
	SpinParticles=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	MaxParticles=3
	StartLocationShape=1
	SphereRadiusRange=(Min=24.0000000,Max=24.0000000)
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=50.0000000,Max=70.0000000),Y=(Min=50.0000000,Max=70.0000000),Z=(Min=50.0000000,Max=70.0000000))
	InitialParticlesPerSecond=10.0000000
	Texture=Texture'ExplosionTex.Framed.we1_frames'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4000000,Max=0.6000000)
end object
// Reference: SpriteEmitter'XEffects.NewExplosionA.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	UseRandomSubdivision=true
	UseVelocityScale=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=20.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[1]=(RelativeTime=0.1250000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[2]=(RelativeTime=0.3300000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[3]=(RelativeTime=0.7500000,Color=(R=128,G=128,B=128,A=255))
	ColorScale[4]=(RelativeTime=1.0000000,Color=(R=64,G=64,B=64,A=0))
	MaxParticles=15
	StartLocationShape=2
	StartLocationPolarRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-32768.0000000,Max=32768.0000000),Z=(Min=10.0000000,Max=10.0000000))
	UseRotationFrom=1
	RotationOffset=(Pitch=0,Yaw=-16384,Roll=0)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
	InitialParticlesPerSecond=500.0000000
	DrawStyle=1
	Texture=Texture'ExplosionTex.Framed.SmokeReOrdered'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRadialRange=(Min=200.0000000,Max=200.0000000)
	GetVelocityDirectionFrom=3
	VelocityScale[0]=(RelativeTime=0.0000000,RelativeVelocity=(X=1.0000000,Y=1.0000000,Z=1.0000000))
	VelocityScale[1]=(RelativeTime=0.3000000,RelativeVelocity=(X=0.1000000,Y=0.1000000,Z=0.1000000))
	VelocityScale[2]=(RelativeTime=1.0000000,RelativeVelocity=(X=0.0000000,Y=0.0000000,Z=0.0000000))
end object
// Reference: SpriteEmitter'XEffects.NewExplosionA.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	FadeOutStartTime=0.0500000
	MaxParticles=1
	StartLocationShape=1
	SphereRadiusRange=(Min=2.0000000,Max=2.0000000)
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=110.0000000,Max=120.0000000),Y=(Min=110.0000000,Max=120.0000000),Z=(Min=80.0000000,Max=90.0000000))
	InitialParticlesPerSecond=10.0000000
	Texture=Texture'XEffects.Skins.Rexpt'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.3000000,Max=0.3000000)
end object
