class RSNova_OneShotZap extends BallisticEmitter;

simulated function SetTarget(Vector End, bool Hit)
{
	BeamEmitter(Emitters[0]).BeamEndPoints[0].offset = VtoRV(End, End);
	// End:0x67
	if(Hit)
	{
		Emitters[2].StartLocationOffset = End;
		Emitters[3].StartLocationOffset = End;		
	}
	else
	{
		Emitters[2].Disabled = true;
		Emitters[3].Disabled = true;
	}
	//return;	
}

defaultproperties
{
	// Reference: BeamEmitter'BallisticProV55.RSNova_OneShotZap.BeamEmitter0'
	begin object name="BeamEmitter0" class=Engine.BeamEmitter
		BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=400.0000000,Max=400.0000000),Y=(Min=400.0000000,Max=400.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=0.0000000)
		DetermineEndPointBy=5
		BeamTextureUScale=4.0000000
		RotatingSheets=3
		LowFrequencyNoiseRange=(X=(Min=-100.0000000,Max=100.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=-100.0000000,Max=100.0000000))
		HighFrequencyNoiseRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-20.0000000,Max=20.0000000))
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.1500000,Color=(R=0,G=0,B=0,A=255))
		ColorScale[2]=(RelativeTime=0.3000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[3]=(RelativeTime=0.4714290,Color=(R=0,G=0,B=0,A=255))
		ColorScale[4]=(RelativeTime=0.6464290,Color=(R=255,G=255,B=255,A=255))
		ColorScale[5]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.1950000
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.5000000)
		SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=25.0000000,Max=25.0000000),Y=(Min=25.0000000,Max=25.0000000),Z=(Min=25.0000000,Max=25.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'EpicParticles.Beams.HotBolt03aw'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[0]=BeamEmitter0
	// Reference: SpriteEmitter'BallisticProV55.RSNova_OneShotZap.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.1571430,Color=(R=0,G=0,B=0,A=255))
		ColorScale[2]=(RelativeTime=0.3000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[3]=(RelativeTime=0.4714290,Color=(R=0,G=0,B=0,A=255))
		ColorScale[4]=(RelativeTime=0.6285710,Color=(R=255,G=255,B=255,A=255))
		ColorScale[5]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.5000000,Max=0.7000000),Y=(Min=0.7000000,Max=0.9000000),Z=(Min=1.0000000,Max=1.0000000))
		FadeOutStartTime=0.1700000
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
		SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[1]=SpriteEmitter0
	// Reference: SpriteEmitter'BallisticProV55.RSNova_OneShotZap.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.1714290,Color=(R=0,G=0,B=64,A=255))
		ColorScale[2]=(RelativeTime=0.2892860,Color=(R=255,G=255,B=255,A=255))
		ColorScale[3]=(RelativeTime=0.4285710,Color=(R=0,G=0,B=64,A=255))
		ColorScale[4]=(RelativeTime=0.6178570,Color=(R=255,G=255,B=255,A=255))
		ColorScale[5]=(RelativeTime=1.0000000,Color=(R=255,G=192,B=0,A=255))
		FadeOutStartTime=0.4700000
		CoordinateSystem=2
		MaxParticles=1
		StartLocationOffset=(X=400.0000000,Y=400.0000000,Z=0.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
		SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.7500000)
		StartSizeRange=(X=(Min=80.0000000,Max=80.0000000),Y=(Min=80.0000000,Max=80.0000000),Z=(Min=80.0000000,Max=80.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[2]=SpriteEmitter1
	// Reference: SpriteEmitter'BallisticProV55.RSNova_OneShotZap.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		UseCollision=true
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
		ExtentMultiplier=(X=0.5000000,Y=0.5000000,Z=0.5000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=192,B=0,A=255))
		FadeOutStartTime=1.2800000
		CoordinateSystem=2
		StartLocationOffset=(X=400.0000000,Y=400.0000000,Z=0.0000000)
		StartSizeRange=(X=(Min=8.0000000,Max=8.0000000),Y=(Min=8.0000000,Max=8.0000000),Z=(Min=8.0000000,Max=8.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=-1000.0000000,Max=1000.0000000),Y=(Min=-1000.0000000,Max=1000.0000000),Z=(Min=0.0000000,Max=1000.0000000))
		VelocityLossRange=(X=(Min=3.0000000,Max=3.0000000),Y=(Min=3.0000000,Max=3.0000000),Z=(Min=3.0000000,Max=3.0000000))
	end object
	Emitters[3]=SpriteEmitter2
	// Reference: SpriteEmitter'BallisticProV55.RSNova_OneShotZap.SpriteEmitter3'
	begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
		UseDirectionAs=1
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		AutomaticInitialSpawning=false
		ExtentMultiplier=(X=0.5000000,Y=0.5000000,Z=0.5000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.1000000,Max=0.1000000))
		Opacity=0.5400000
		FadeOutStartTime=0.1800000
		FadeInEndTime=0.1800000
		MaxParticles=100
		AddLocationFromOtherEmitter=3
		StartSizeRange=(X=(Min=4.0000000,Max=4.0000000),Y=(Min=40.0000000,Max=40.0000000),Z=(Min=40.0000000,Max=40.0000000))
		InitialParticlesPerSecond=60.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		AddVelocityFromOtherEmitter=3
		AddVelocityMultiplierRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.1000000,Max=0.1000000),Z=(Min=0.1000000,Max=0.1000000))
	end object
	Emitters[4]=SpriteEmitter3
	AutoDestroy=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: BeamEmitter'BallisticProV55.RSNova_OneShotZap.BeamEmitter0'
begin object name="BeamEmitter0" class=Engine.BeamEmitter
	BeamEndPoints[0]=(ActorTag="None",offset=(X=(Min=400.0000000,Max=400.0000000),Y=(Min=400.0000000,Max=400.0000000),Z=(Min=0.0000000,Max=0.0000000)),Weight=0.0000000)
	DetermineEndPointBy=5
	BeamTextureUScale=4.0000000
	RotatingSheets=3
	LowFrequencyNoiseRange=(X=(Min=-100.0000000,Max=100.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=-100.0000000,Max=100.0000000))
	HighFrequencyNoiseRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-20.0000000,Max=20.0000000))
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.1500000,Color=(R=0,G=0,B=0,A=255))
	ColorScale[2]=(RelativeTime=0.3000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[3]=(RelativeTime=0.4714290,Color=(R=0,G=0,B=0,A=255))
	ColorScale[4]=(RelativeTime=0.6464290,Color=(R=255,G=255,B=255,A=255))
	ColorScale[5]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.1950000
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.5000000)
	SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=25.0000000,Max=25.0000000),Y=(Min=25.0000000,Max=25.0000000),Z=(Min=25.0000000,Max=25.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'EpicParticles.Beams.HotBolt03aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BallisticProV55.RSNova_OneShotZap.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.1571430,Color=(R=0,G=0,B=0,A=255))
	ColorScale[2]=(RelativeTime=0.3000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[3]=(RelativeTime=0.4714290,Color=(R=0,G=0,B=0,A=255))
	ColorScale[4]=(RelativeTime=0.6285710,Color=(R=255,G=255,B=255,A=255))
	ColorScale[5]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.5000000,Max=0.7000000),Y=(Min=0.7000000,Max=0.9000000),Z=(Min=1.0000000,Max=1.0000000))
	FadeOutStartTime=0.1700000
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
	SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BallisticProV55.RSNova_OneShotZap.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.1714290,Color=(R=0,G=0,B=64,A=255))
	ColorScale[2]=(RelativeTime=0.2892860,Color=(R=255,G=255,B=255,A=255))
	ColorScale[3]=(RelativeTime=0.4285710,Color=(R=0,G=0,B=64,A=255))
	ColorScale[4]=(RelativeTime=0.6178570,Color=(R=255,G=255,B=255,A=255))
	ColorScale[5]=(RelativeTime=1.0000000,Color=(R=255,G=192,B=0,A=255))
	FadeOutStartTime=0.4700000
	CoordinateSystem=2
	MaxParticles=1
	StartLocationOffset=(X=400.0000000,Y=400.0000000,Z=0.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
	SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.7500000)
	StartSizeRange=(X=(Min=80.0000000,Max=80.0000000),Y=(Min=80.0000000,Max=80.0000000),Z=(Min=80.0000000,Max=80.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
// Reference: SpriteEmitter'BallisticProV55.RSNova_OneShotZap.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	UseCollision=true
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
	ExtentMultiplier=(X=0.5000000,Y=0.5000000,Z=0.5000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=192,B=0,A=255))
	FadeOutStartTime=1.2800000
	CoordinateSystem=2
	StartLocationOffset=(X=400.0000000,Y=400.0000000,Z=0.0000000)
	StartSizeRange=(X=(Min=8.0000000,Max=8.0000000),Y=(Min=8.0000000,Max=8.0000000),Z=(Min=8.0000000,Max=8.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=-1000.0000000,Max=1000.0000000),Y=(Min=-1000.0000000,Max=1000.0000000),Z=(Min=0.0000000,Max=1000.0000000))
	VelocityLossRange=(X=(Min=3.0000000,Max=3.0000000),Y=(Min=3.0000000,Max=3.0000000),Z=(Min=3.0000000,Max=3.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RSNova_OneShotZap.SpriteEmitter3'
begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
	UseDirectionAs=1
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	AutomaticInitialSpawning=false
	ExtentMultiplier=(X=0.5000000,Y=0.5000000,Z=0.5000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.1000000,Max=0.1000000))
	Opacity=0.5400000
	FadeOutStartTime=0.1800000
	FadeInEndTime=0.1800000
	MaxParticles=100
	AddLocationFromOtherEmitter=3
	StartSizeRange=(X=(Min=4.0000000,Max=4.0000000),Y=(Min=40.0000000,Max=40.0000000),Z=(Min=40.0000000,Max=40.0000000))
	InitialParticlesPerSecond=60.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	AddVelocityFromOtherEmitter=3
	AddVelocityMultiplierRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.1000000,Max=0.1000000),Z=(Min=0.1000000,Max=0.1000000))
end object
