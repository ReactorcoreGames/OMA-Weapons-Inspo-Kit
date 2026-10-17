class WeaponFadeEffect extends Emitter;

simulated function PreBeginPlay()
{
	super(Actor).PreBeginPlay();
	// End:0x186
	if(Owner != none)
	{
		SetLocation(Owner.Location);
		SetRotation(Owner.Rotation);
		// End:0x186
		if(Owner.StaticMesh != none)
		{
			MeshEmitter(Emitters[0]).StaticMesh = Owner.StaticMesh;
			MeshEmitter(Emitters[1]).StaticMesh = Owner.StaticMesh;
			MeshEmitter(Emitters[0]).SizeScale[0].RelativeSize = Owner.DrawScale;
			MeshEmitter(Emitters[0]).SizeScale[1].RelativeSize = Owner.DrawScale;
			MeshEmitter(Emitters[1]).SizeScale[0].RelativeSize = 1.0200000 * Owner.DrawScale;
			MeshEmitter(Emitters[1]).SizeScale[1].RelativeSize = 1.2000000 * Owner.DrawScale;
			// End:0x186
			if(Owner.IsA('LinkGunPickup') || Owner.IsA('ONSAVRiLPickup'))
			{
				Emitters[1].Disabled = true;
			}
		}
	}
	//return;	
}

defaultproperties
{
	// Reference: MeshEmitter'XEffects.WeaponFadeEffect.MeshEmitter17'
	begin object name="MeshEmitter17" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'WeaponStaticMesh.RocketLauncherPickup'
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ResetOnTrigger=true
		CoordinateSystem=1
		MaxParticles=1
		SpinCCWorCW=(X=0.0000000,Y=0.5000000,Z=0.5000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5500000)
		SizeScale[1]=(RelativeTime=0.3000000,RelativeSize=0.5500000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
		InitialParticlesPerSecond=9999999.0000000
		LifetimeRange=(Min=1.5000000,Max=1.5000000)
	end object
	Emitters[0]=MeshEmitter17
	// Reference: MeshEmitter'XEffects.WeaponFadeEffect.MeshEmitter18'
	begin object name="MeshEmitter18" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'WeaponStaticMesh.RocketLauncherPickup'
		UseMeshBlendMode=false
		UseParticleColor=true
		UseColorScale=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ResetOnTrigger=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.3000000,Color=(R=255,G=255,B=64,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		Opacity=0.5000000
		CoordinateSystem=1
		MaxParticles=1
		DetailMode=1
		SpinCCWorCW=(X=0.0000000,Y=0.5000000,Z=0.5000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5500000)
		SizeScale[1]=(RelativeTime=0.3000000,RelativeSize=0.6500000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
		InitialParticlesPerSecond=9999999.0000000
		LifetimeRange=(Min=1.7500000,Max=1.7500000)
	end object
	Emitters[1]=MeshEmitter18
	// Reference: SpriteEmitter'XEffects.WeaponFadeEffect.SpriteEmitter44'
	begin object name="SpriteEmitter44" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		UseRevolution=true
		UseRevolutionScale=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ResetOnTrigger=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=64,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.7000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		MaxParticles=40
		StartLocationShape=1
		RevolutionsPerSecondRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=-1.0000000,Max=1.0000000),Z=(Min=-1.0000000,Max=1.0000000))
		RevolutionScale[0]=(RelativeTime=0.0000000,RelativeRevolution=(X=0.0000000,Y=0.0000000,Z=0.0000000))
		RevolutionScale[1]=(RelativeTime=0.5000000,RelativeRevolution=(X=0.2000000,Y=0.2000000,Z=0.2000000))
		RevolutionScale[2]=(RelativeTime=1.0000000,RelativeRevolution=(X=0.7000000,Y=0.7000000,Z=0.7000000))
		SpinsPerSecondRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=4.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		Texture=Texture'AW-2004Particles.Weapons.PlasmaStar'
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=0.0000000,Max=40.0000000))
		VelocityLossRange=(X=(Min=-1.0000000,Max=-1.0000000),Y=(Min=-1.0000000,Max=-1.0000000),Z=(Min=-1.0000000,Max=-1.0000000))
	end object
	Emitters[2]=SpriteEmitter44
	// Reference: SpriteEmitter'XEffects.WeaponFadeEffect.SpriteEmitter54'
	begin object name="SpriteEmitter54" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ResetOnTrigger=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.2000000,Color=(R=255,G=255,B=64,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		MaxParticles=3
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=4.0000000)
		StartSizeRange=(X=(Min=7.0000000,Max=7.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=5.0000000
		Texture=Texture'AW-2004Particles.Fire.BlastMark'
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[3]=SpriteEmitter54
	// Reference: SpriteEmitter'XEffects.WeaponFadeEffect.SpriteEmitter55'
	begin object name="SpriteEmitter55" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=64,A=0))
		ColorScale[1]=(RelativeTime=0.1875000,Color=(R=255,G=255,B=64,A=0))
		ColorScale[2]=(RelativeTime=0.3750000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[3]=(RelativeTime=0.6875000,Color=(R=255,G=255,B=64,A=0))
		ColorScale[4]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		Opacity=0.7500000
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.3750000,RelativeSize=0.2500000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
		InitialParticlesPerSecond=99999.0000000
		Texture=Texture'EpicParticles.Flares.BurnFlare1'
		LifetimeRange=(Min=0.7500000,Max=0.7500000)
		InitialDelayRange=(Min=1.0000000,Max=1.0000000)
		WarmupTicksPerSecond=1.0000000
		RelativeWarmupTime=1.0000000
	end object
	Emitters[4]=SpriteEmitter55
	AutoDestroy=true
	bNoDelete=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'XEffects.WeaponFadeEffect.MeshEmitter17'
begin object name="MeshEmitter17" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'WeaponStaticMesh.RocketLauncherPickup'
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ResetOnTrigger=true
	CoordinateSystem=1
	MaxParticles=1
	SpinCCWorCW=(X=0.0000000,Y=0.5000000,Z=0.5000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5500000)
	SizeScale[1]=(RelativeTime=0.3000000,RelativeSize=0.5500000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
	InitialParticlesPerSecond=9999999.0000000
	LifetimeRange=(Min=1.5000000,Max=1.5000000)
end object
// Reference: MeshEmitter'XEffects.WeaponFadeEffect.MeshEmitter18'
begin object name="MeshEmitter18" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'WeaponStaticMesh.RocketLauncherPickup'
	UseMeshBlendMode=false
	UseParticleColor=true
	UseColorScale=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ResetOnTrigger=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.3000000,Color=(R=255,G=255,B=64,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	Opacity=0.5000000
	CoordinateSystem=1
	MaxParticles=1
	DetailMode=1
	SpinCCWorCW=(X=0.0000000,Y=0.5000000,Z=0.5000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5500000)
	SizeScale[1]=(RelativeTime=0.3000000,RelativeSize=0.6500000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
	InitialParticlesPerSecond=9999999.0000000
	LifetimeRange=(Min=1.7500000,Max=1.7500000)
end object
// Reference: SpriteEmitter'XEffects.WeaponFadeEffect.SpriteEmitter44'
begin object name="SpriteEmitter44" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	UseRevolution=true
	UseRevolutionScale=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ResetOnTrigger=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=64,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.7000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	MaxParticles=40
	StartLocationShape=1
	RevolutionsPerSecondRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=-1.0000000,Max=1.0000000),Z=(Min=-1.0000000,Max=1.0000000))
	RevolutionScale[0]=(RelativeTime=0.0000000,RelativeRevolution=(X=0.0000000,Y=0.0000000,Z=0.0000000))
	RevolutionScale[1]=(RelativeTime=0.5000000,RelativeRevolution=(X=0.2000000,Y=0.2000000,Z=0.2000000))
	RevolutionScale[2]=(RelativeTime=1.0000000,RelativeRevolution=(X=0.7000000,Y=0.7000000,Z=0.7000000))
	SpinsPerSecondRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=4.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	Texture=Texture'AW-2004Particles.Weapons.PlasmaStar'
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=0.0000000,Max=40.0000000))
	VelocityLossRange=(X=(Min=-1.0000000,Max=-1.0000000),Y=(Min=-1.0000000,Max=-1.0000000),Z=(Min=-1.0000000,Max=-1.0000000))
end object
// Reference: SpriteEmitter'XEffects.WeaponFadeEffect.SpriteEmitter54'
begin object name="SpriteEmitter54" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ResetOnTrigger=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.2000000,Color=(R=255,G=255,B=64,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	MaxParticles=3
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=4.0000000)
	StartSizeRange=(X=(Min=7.0000000,Max=7.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=5.0000000
	Texture=Texture'AW-2004Particles.Fire.BlastMark'
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
// Reference: SpriteEmitter'XEffects.WeaponFadeEffect.SpriteEmitter55'
begin object name="SpriteEmitter55" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=64,A=0))
	ColorScale[1]=(RelativeTime=0.1875000,Color=(R=255,G=255,B=64,A=0))
	ColorScale[2]=(RelativeTime=0.3750000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[3]=(RelativeTime=0.6875000,Color=(R=255,G=255,B=64,A=0))
	ColorScale[4]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	Opacity=0.7500000
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.3750000,RelativeSize=0.2500000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
	InitialParticlesPerSecond=99999.0000000
	Texture=Texture'EpicParticles.Flares.BurnFlare1'
	LifetimeRange=(Min=0.7500000,Max=0.7500000)
	InitialDelayRange=(Min=1.0000000,Max=1.0000000)
	WarmupTicksPerSecond=1.0000000
	RelativeWarmupTime=1.0000000
end object
