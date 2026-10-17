class NewExplosionB extends Emitter;

simulated function PostBeginPlay()
{
	local PlayerController PC;
	local float Dist;

	PC = Level.GetLocalPlayerController();
	// End:0x37
	if(PC.ViewTarget == none)
	{
		Dist = 10000.0000000;		
	}
	else
	{
		Dist = VSize(PC.ViewTarget.Location - Location);
	}
	// End:0xA5
	if(Dist > float(4000))
	{
		LightType = 0;
		bDynamicLight = false;
		// End:0xA2
		if(Dist > float(7000))
		{
			Emitters[1].Disabled = true;
		}		
	}
	else
	{
		// End:0xC2
		if(Level.bDropDetail)
		{
			LightRadius = 7.0000000;
		}
	}
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'XEffects.NewExplosionB.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		RespawnDeadParticles=false
		SpinParticles=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		MaxParticles=3
		StartLocationShape=1
		SphereRadiusRange=(Min=0.0000000,Max=24.0000000)
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=60.0000000,Max=80.0000000),Y=(Min=60.0000000,Max=80.0000000),Z=(Min=60.0000000,Max=80.0000000))
		InitialParticlesPerSecond=10.0000000
		Texture=Texture'ExplosionTex.Framed.exp1_frames'
		TextureUSubdivisions=2
		TextureVSubdivisions=4
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4000000,Max=0.6000000)
	end object
	Emitters[0]=SpriteEmitter1
	// Reference: SpriteEmitter'XEffects.NewExplosionB.SpriteEmitter0'
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
// Reference: SpriteEmitter'XEffects.NewExplosionB.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	RespawnDeadParticles=false
	SpinParticles=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	MaxParticles=3
	StartLocationShape=1
	SphereRadiusRange=(Min=0.0000000,Max=24.0000000)
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=60.0000000,Max=80.0000000),Y=(Min=60.0000000,Max=80.0000000),Z=(Min=60.0000000,Max=80.0000000))
	InitialParticlesPerSecond=10.0000000
	Texture=Texture'ExplosionTex.Framed.exp1_frames'
	TextureUSubdivisions=2
	TextureVSubdivisions=4
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4000000,Max=0.6000000)
end object
// Reference: SpriteEmitter'XEffects.NewExplosionB.SpriteEmitter0'
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
