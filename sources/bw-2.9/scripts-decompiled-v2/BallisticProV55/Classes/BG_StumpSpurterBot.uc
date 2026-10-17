class BG_StumpSpurterBot extends DGVEmitter;

var float nextSpurtTime;
var bool bKillingTime;

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	Emitters[0].Trigger();
	nextSpurtTime = Level.TimeSeconds + 1.5000000;
	//return;	
}

simulated event Timer()
{
	// End:0x0E
	if(bKillingTime)
	{
		Destroy();
		return;
	}
	super.Timer();
	// End:0x2E
	if(nextSpurtTime > Level.TimeSeconds)
	{
		return;
	}
	nextSpurtTime = Level.TimeSeconds + 1.5000000;
	Emitters[0].SpawnOnTriggerRange.Max *= 0.8500000;
	Emitters[0].SpawnOnTriggerRange.Min *= 0.8500000;
	Emitters[0].SpawnOnTriggerPPS *= 0.8500000;
	Emitters[0].Trigger();
	// End:0xDE
	if(Emitters[0].SpawnOnTriggerRange.Max < float(10))
	{
		SetTimer(6.0000000, false);
		bKillingTime = true;
		Kill();
	}
	//return;	
}

defaultproperties
{
	bAutoAlignVelocity=true
	DisableDGV[0]=0
	DisableDGV[1]=1
	// Reference: SpriteEmitter'BallisticProV55.BG_StumpSpurterBot.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseCollision=true
		UseMaxCollisions=true
		UseSpawnedVelocityScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-100.0000000)
		ExtentMultiplier=(X=0.5000000,Y=0.5000000,Z=0.5000000)
		MaxCollisions=(Min=1.0000000,Max=1.0000000)
		SpawnFromOtherEmitter=1
		SpawnAmount=1
		SpawnedVelocityScaleRange=(X=(Min=0.0100000,Max=0.0100000),Y=(Min=0.0100000,Max=0.0100000),Z=(Min=0.0100000,Max=0.0100000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.5000000,Max=0.7000000),Z=(Min=0.6000000,Max=0.7000000))
		FadeOutStartTime=0.7680000
		MaxParticles=200
		StartSpinRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=3.0000000,Max=5.0000000),Y=(Min=3.0000000,Max=5.0000000),Z=(Min=3.0000000,Max=5.0000000))
		DrawStyle=1
		Texture=Texture'BallisticBloodPro.Particles.BloodDrip1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.8000000,Max=1.2000000)
		SpawnOnTriggerRange=(Min=18.0000000,Max=25.0000000)
		SpawnOnTriggerPPS=20.0000000
		StartVelocityRange=(X=(Min=70.0000000,Max=80.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=20.0000000,Max=25.0000000))
	end object
	Emitters[0]=SpriteEmitter0
	// Reference: SpriteEmitter'BallisticProV55.BG_StumpSpurterBot.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		UseDirectionAs=3
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=9.0800000
		MaxParticles=30
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=0.9000000,RelativeSize=1.0000000)
		SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
		StartSizeRange=(X=(Min=5.0000000,Max=5.0000000),Y=(Min=5.0000000,Max=5.0000000),Z=(Min=5.0000000,Max=5.0000000))
		DrawStyle=1
		Texture=Texture'BallisticBloodPro.Bot.Bot-Splat4'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=10.0000000,Max=10.0000000)
	end object
	Emitters[1]=SpriteEmitter1
	// Reference: SpriteEmitter'BallisticProV55.BG_StumpSpurterBot.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseCollision=true
		UseMaxCollisions=true
		UseSpawnedVelocityScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-100.0000000)
		ExtentMultiplier=(X=0.5000000,Y=0.5000000,Z=0.5000000)
		MaxCollisions=(Min=1.0000000,Max=1.0000000)
		SpawnFromOtherEmitter=1
		SpawnAmount=1
		SpawnedVelocityScaleRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.1000000,Max=0.1000000),Z=(Min=0.1000000,Max=0.1000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.5000000,Max=0.7000000),Z=(Min=0.6000000,Max=0.7000000))
		FadeOutStartTime=0.7680000
		MaxParticles=100
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-4.0000000,Max=4.0000000),Z=(Min=-4.0000000,Max=4.0000000))
		StartSpinRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=3.0000000,Max=5.0000000),Y=(Min=5.0000000,Max=12.0000000),Z=(Min=5.0000000,Max=12.0000000))
		InitialParticlesPerSecond=10.0000000
		DrawStyle=1
		Texture=Texture'BallisticBloodPro.Particles.BloodDrip1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.8000000,Max=1.2000000)
		StartVelocityRange=(X=(Min=10.0000000,Max=40.0000000),Y=(Min=-15.0000000,Max=15.0000000),Z=(Min=5.0000000,Max=30.0000000))
	end object
	Emitters[2]=SpriteEmitter2
	// Reference: SpriteEmitter'BallisticProV55.BG_StumpSpurterBot.SpriteEmitter29'
	begin object name="SpriteEmitter29" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-500.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.2750000,Color=(R=255,G=255,B=128,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=150,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.7000000,Max=0.7000000),Y=(Min=0.8000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		FadeOutStartTime=0.1700000
		MaxParticles=300
		StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=3.0000000,Max=6.0000000),Y=(Min=3.0000000,Max=6.0000000),Z=(Min=3.0000000,Max=6.0000000))
		InitialParticlesPerSecond=30.0000000
		Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
		StartVelocityRange=(X=(Min=50.0000000,Max=250.0000000),Y=(Min=-75.0000000,Max=75.0000000),Z=(Min=0.0000000,Max=75.0000000))
	end object
	Emitters[3]=SpriteEmitter29
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.BG_StumpSpurterBot.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseCollision=true
	UseMaxCollisions=true
	UseSpawnedVelocityScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-100.0000000)
	ExtentMultiplier=(X=0.5000000,Y=0.5000000,Z=0.5000000)
	MaxCollisions=(Min=1.0000000,Max=1.0000000)
	SpawnFromOtherEmitter=1
	SpawnAmount=1
	SpawnedVelocityScaleRange=(X=(Min=0.0100000,Max=0.0100000),Y=(Min=0.0100000,Max=0.0100000),Z=(Min=0.0100000,Max=0.0100000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.5000000,Max=0.7000000),Z=(Min=0.6000000,Max=0.7000000))
	FadeOutStartTime=0.7680000
	MaxParticles=200
	StartSpinRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=3.0000000,Max=5.0000000),Y=(Min=3.0000000,Max=5.0000000),Z=(Min=3.0000000,Max=5.0000000))
	DrawStyle=1
	Texture=Texture'BallisticBloodPro.Particles.BloodDrip1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.8000000,Max=1.2000000)
	SpawnOnTriggerRange=(Min=18.0000000,Max=25.0000000)
	SpawnOnTriggerPPS=20.0000000
	StartVelocityRange=(X=(Min=70.0000000,Max=80.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=20.0000000,Max=25.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.BG_StumpSpurterBot.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	UseDirectionAs=3
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=9.0800000
	MaxParticles=30
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=0.9000000,RelativeSize=1.0000000)
	SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
	StartSizeRange=(X=(Min=5.0000000,Max=5.0000000),Y=(Min=5.0000000,Max=5.0000000),Z=(Min=5.0000000,Max=5.0000000))
	DrawStyle=1
	Texture=Texture'BallisticBloodPro.Bot.Bot-Splat4'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=10.0000000,Max=10.0000000)
end object
// Reference: SpriteEmitter'BallisticProV55.BG_StumpSpurterBot.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseCollision=true
	UseMaxCollisions=true
	UseSpawnedVelocityScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-100.0000000)
	ExtentMultiplier=(X=0.5000000,Y=0.5000000,Z=0.5000000)
	MaxCollisions=(Min=1.0000000,Max=1.0000000)
	SpawnFromOtherEmitter=1
	SpawnAmount=1
	SpawnedVelocityScaleRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.1000000,Max=0.1000000),Z=(Min=0.1000000,Max=0.1000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.5000000,Max=0.7000000),Z=(Min=0.6000000,Max=0.7000000))
	FadeOutStartTime=0.7680000
	MaxParticles=100
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-4.0000000,Max=4.0000000),Z=(Min=-4.0000000,Max=4.0000000))
	StartSpinRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=3.0000000,Max=5.0000000),Y=(Min=5.0000000,Max=12.0000000),Z=(Min=5.0000000,Max=12.0000000))
	InitialParticlesPerSecond=10.0000000
	DrawStyle=1
	Texture=Texture'BallisticBloodPro.Particles.BloodDrip1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.8000000,Max=1.2000000)
	StartVelocityRange=(X=(Min=10.0000000,Max=40.0000000),Y=(Min=-15.0000000,Max=15.0000000),Z=(Min=5.0000000,Max=30.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.BG_StumpSpurterBot.SpriteEmitter29'
begin object name="SpriteEmitter29" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-500.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.2750000,Color=(R=255,G=255,B=128,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=150,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.7000000,Max=0.7000000),Y=(Min=0.8000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	FadeOutStartTime=0.1700000
	MaxParticles=300
	StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=3.0000000,Max=6.0000000),Y=(Min=3.0000000,Max=6.0000000),Z=(Min=3.0000000,Max=6.0000000))
	InitialParticlesPerSecond=30.0000000
	Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
	StartVelocityRange=(X=(Min=50.0000000,Max=250.0000000),Y=(Min=-75.0000000,Max=75.0000000),Z=(Min=0.0000000,Max=75.0000000))
end object
