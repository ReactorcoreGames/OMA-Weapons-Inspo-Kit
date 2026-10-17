class IE_PumaDetClose extends BallisticEmitter;

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	bDynamicLight = true;
	SetTimer(0.2000000, false);
	//return;	
}

simulated event PreBeginPlay()
{
	// End:0x2D
	if(int(Level.DetailMode) < int(2))
	{
		Emitters[3].Disabled = true;
	}
	// End:0x6D
	if(int(Level.DetailMode) < int(1))
	{
		Emitters[1].Disabled = true;
		Emitters[2].Disabled = true;
	}
	super(Actor).PreBeginPlay();
	//return;	
}

simulated event Timer()
{
	super(Actor).Timer();
	bDynamicLight = false;
	//return;	
}

defaultproperties
{
	// Reference: MeshEmitter'BWBP_SKC_Pro.IE_PumaDetClose.MeshEmitter0'
	begin object name="MeshEmitter0" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'AW-2004Particles.Weapons.HellB_Ring'
		RenderTwoSided=true
		UseParticleColor=true
		UseColorScale=true
		RespawnDeadParticles=false
		Disabled=true
		Backup_Disabled=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=32,G=140,B=175,A=0))
		ColorScale[1]=(RelativeTime=0.6964290,Color=(R=0,G=150,B=200,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		MaxParticles=1
		DetailMode=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.5000000)
		InitialParticlesPerSecond=5000.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		InitialDelayRange=(Min=0.2000000,Max=0.2000000)
	end object
	Emitters[0]=MeshEmitter0
	// Reference: MeshEmitter'BWBP_SKC_Pro.IE_PumaDetClose.MeshEmitter1'
	begin object name="MeshEmitter1" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'AW-2004Particles.Weapons.HellB_Ring'
		RenderTwoSided=true
		UseParticleColor=true
		UseColorScale=true
		RespawnDeadParticles=false
		Disabled=true
		Backup_Disabled=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=140,B=175,A=0))
		ColorScale[1]=(RelativeTime=0.6964290,Color=(R=0,G=150,B=200,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		MaxParticles=1
		DetailMode=1
		StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.2500000,Max=0.2500000),Z=(Min=0.2500000,Max=0.2500000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.5000000)
		InitialParticlesPerSecond=5000.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		InitialDelayRange=(Min=0.2000000,Max=0.2000000)
	end object
	Emitters[1]=MeshEmitter1
	// Reference: MeshEmitter'BWBP_SKC_Pro.IE_PumaDetClose.MeshEmitter2'
	begin object name="MeshEmitter2" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'AW-2004Particles.Weapons.HellB_Ring'
		RenderTwoSided=true
		UseParticleColor=true
		UseColorScale=true
		RespawnDeadParticles=false
		Disabled=true
		Backup_Disabled=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=140,B=175,A=0))
		ColorScale[1]=(RelativeTime=0.6964290,Color=(R=0,G=150,B=200,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		MaxParticles=1
		DetailMode=1
		StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.2500000,Max=0.2500000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.5000000)
		InitialParticlesPerSecond=5000.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		InitialDelayRange=(Min=0.2000000,Max=0.2000000)
	end object
	Emitters[2]=MeshEmitter2
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_PumaDetClose.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.1000000,Color=(R=114,G=171,B=205,A=0))
		ColorScale[2]=(RelativeTime=0.8000000,Color=(R=158,G=84,B=203,A=0))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		MaxParticles=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
		StartSizeRange=(X=(Min=30.0000000,Max=60.0000000),Y=(Min=40.0000000,Max=40.0000000),Z=(Min=40.0000000,Max=40.0000000))
		InitialParticlesPerSecond=10.0000000
		Texture=Texture'AW-2004Particles.Fire.BlastMark'
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
	end object
	Emitters[3]=SpriteEmitter0
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_PumaDetClose.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.1000000,Color=(R=117,G=174,B=202,A=0))
		ColorScale[2]=(RelativeTime=0.8000000,Color=(R=81,G=84,B=206,A=0))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		MaxParticles=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
		StartSizeRange=(X=(Min=60.0000000,Max=90.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
		InitialParticlesPerSecond=10.0000000
		Texture=Texture'AW-2004Particles.Energy.EclipseCircle'
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
	end object
	Emitters[4]=SpriteEmitter1
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_PumaDetClose.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		UseDirectionAs=2
		UseColorScale=true
		RespawnDeadParticles=false
		UniformSize=true
		ScaleSizeXByVelocity=true
		AutomaticInitialSpawning=false
		UseVelocityScale=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.1000000,Color=(R=0,G=128,B=255,A=0))
		ColorScale[2]=(RelativeTime=0.8000000,Color=(R=128,G=128,B=255,A=0))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		MaxParticles=100
		DetailMode=1
		StartLocationShape=1
		SphereRadiusRange=(Min=8.0000000,Max=8.0000000)
		StartSizeRange=(X=(Min=5.0000000,Max=5.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		ScaleSizeByVelocityMultiplier=(X=0.0300000,Y=1.0000000,Z=1.0000000)
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'AW-2004Particles.Weapons.PlasmaStar'
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		StartVelocityRadialRange=(Min=-100.0000000,Max=-200.0000000)
		GetVelocityDirectionFrom=3
		VelocityScale[0]=(RelativeTime=0.0000000,RelativeVelocity=(X=1.0000000,Y=1.0000000,Z=1.0000000))
		VelocityScale[1]=(RelativeTime=0.2500000,RelativeVelocity=(X=1.5000000,Y=1.5000000,Z=1.5000000))
		VelocityScale[2]=(RelativeTime=1.0000000,RelativeVelocity=(X=2.0000000,Y=2.0000000,Z=2.0000000))
	end object
	Emitters[5]=SpriteEmitter2
	// Reference: MeshEmitter'BWBP_SKC_Pro.IE_PumaDetClose.MeshEmitter3'
	begin object name="MeshEmitter3" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'AW-2004Particles.Weapons.PlasmaSphere'
		UseParticleColor=true
		UseColorScale=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=108,G=0,B=255,A=0))
		ColorScale[1]=(RelativeTime=0.6964290,Color=(R=194,G=157,B=255,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
		InitialParticlesPerSecond=500.0000000
		LifetimeRange=(Min=0.3000000,Max=0.3000000)
	end object
	Emitters[6]=MeshEmitter3
	// Reference: MeshEmitter'BWBP_SKC_Pro.IE_PumaDetClose.MeshEmitter4'
	begin object name="MeshEmitter4" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BWBP_SKC_Static.PUMA.ShieldShard'
		UseParticleColor=true
		UseCollision=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-1000.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		MaxParticles=20
		StartLocationRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=-1.0000000,Max=1.0000000),Z=(Min=-1.0000000,Max=1.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=0
		LifetimeRange=(Min=0.5000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=-600.0000000,Max=600.0000000),Y=(Min=-600.0000000,Max=600.0000000),Z=(Min=-600.0000000,Max=600.0000000))
	end object
	Emitters[7]=MeshEmitter4
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_PumaDetClose.SpriteEmitter10'
	begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.5392860,Color=(R=128,G=192,B=255,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=128,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.7000000,Max=0.7000000),Y=(Min=0.7000000,Max=0.7000000),Z=(Min=0.7000000,Max=0.7000000))
		FadeOutStartTime=0.0920000
		FadeInEndTime=0.0320000
		MaxParticles=1
		DetailMode=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=0.6000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=350.0000000,Max=350.0000000),Y=(Min=350.0000000,Max=350.0000000),Z=(Min=350.0000000,Max=350.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.ElectroShock'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
	end object
	Emitters[8]=SpriteEmitter10
	LightType=2
	LightEffect=13
	LightHue=180
	LightSaturation=100
	LightBrightness=150.0000000
	LightRadius=32.0000000
	LightPeriod=3
	bUnlit=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'BWBP_SKC_Pro.IE_PumaDetClose.MeshEmitter0'
begin object name="MeshEmitter0" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'AW-2004Particles.Weapons.HellB_Ring'
	RenderTwoSided=true
	UseParticleColor=true
	UseColorScale=true
	RespawnDeadParticles=false
	Disabled=true
	Backup_Disabled=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=32,G=140,B=175,A=0))
	ColorScale[1]=(RelativeTime=0.6964290,Color=(R=0,G=150,B=200,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	MaxParticles=1
	DetailMode=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.5000000)
	InitialParticlesPerSecond=5000.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	InitialDelayRange=(Min=0.2000000,Max=0.2000000)
end object
// Reference: MeshEmitter'BWBP_SKC_Pro.IE_PumaDetClose.MeshEmitter1'
begin object name="MeshEmitter1" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'AW-2004Particles.Weapons.HellB_Ring'
	RenderTwoSided=true
	UseParticleColor=true
	UseColorScale=true
	RespawnDeadParticles=false
	Disabled=true
	Backup_Disabled=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=140,B=175,A=0))
	ColorScale[1]=(RelativeTime=0.6964290,Color=(R=0,G=150,B=200,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	MaxParticles=1
	DetailMode=1
	StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.2500000,Max=0.2500000),Z=(Min=0.2500000,Max=0.2500000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.5000000)
	InitialParticlesPerSecond=5000.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	InitialDelayRange=(Min=0.2000000,Max=0.2000000)
end object
// Reference: MeshEmitter'BWBP_SKC_Pro.IE_PumaDetClose.MeshEmitter2'
begin object name="MeshEmitter2" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'AW-2004Particles.Weapons.HellB_Ring'
	RenderTwoSided=true
	UseParticleColor=true
	UseColorScale=true
	RespawnDeadParticles=false
	Disabled=true
	Backup_Disabled=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=140,B=175,A=0))
	ColorScale[1]=(RelativeTime=0.6964290,Color=(R=0,G=150,B=200,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	MaxParticles=1
	DetailMode=1
	StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.2500000,Max=0.2500000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.5000000)
	InitialParticlesPerSecond=5000.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	InitialDelayRange=(Min=0.2000000,Max=0.2000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_PumaDetClose.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.1000000,Color=(R=114,G=171,B=205,A=0))
	ColorScale[2]=(RelativeTime=0.8000000,Color=(R=158,G=84,B=203,A=0))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	MaxParticles=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
	StartSizeRange=(X=(Min=30.0000000,Max=60.0000000),Y=(Min=40.0000000,Max=40.0000000),Z=(Min=40.0000000,Max=40.0000000))
	InitialParticlesPerSecond=10.0000000
	Texture=Texture'AW-2004Particles.Fire.BlastMark'
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_PumaDetClose.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.1000000,Color=(R=117,G=174,B=202,A=0))
	ColorScale[2]=(RelativeTime=0.8000000,Color=(R=81,G=84,B=206,A=0))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	MaxParticles=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
	StartSizeRange=(X=(Min=60.0000000,Max=90.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
	InitialParticlesPerSecond=10.0000000
	Texture=Texture'AW-2004Particles.Energy.EclipseCircle'
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_PumaDetClose.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	UseDirectionAs=2
	UseColorScale=true
	RespawnDeadParticles=false
	UniformSize=true
	ScaleSizeXByVelocity=true
	AutomaticInitialSpawning=false
	UseVelocityScale=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.1000000,Color=(R=0,G=128,B=255,A=0))
	ColorScale[2]=(RelativeTime=0.8000000,Color=(R=128,G=128,B=255,A=0))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	MaxParticles=100
	DetailMode=1
	StartLocationShape=1
	SphereRadiusRange=(Min=8.0000000,Max=8.0000000)
	StartSizeRange=(X=(Min=5.0000000,Max=5.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	ScaleSizeByVelocityMultiplier=(X=0.0300000,Y=1.0000000,Z=1.0000000)
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'AW-2004Particles.Weapons.PlasmaStar'
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	StartVelocityRadialRange=(Min=-100.0000000,Max=-200.0000000)
	GetVelocityDirectionFrom=3
	VelocityScale[0]=(RelativeTime=0.0000000,RelativeVelocity=(X=1.0000000,Y=1.0000000,Z=1.0000000))
	VelocityScale[1]=(RelativeTime=0.2500000,RelativeVelocity=(X=1.5000000,Y=1.5000000,Z=1.5000000))
	VelocityScale[2]=(RelativeTime=1.0000000,RelativeVelocity=(X=2.0000000,Y=2.0000000,Z=2.0000000))
end object
// Reference: MeshEmitter'BWBP_SKC_Pro.IE_PumaDetClose.MeshEmitter3'
begin object name="MeshEmitter3" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'AW-2004Particles.Weapons.PlasmaSphere'
	UseParticleColor=true
	UseColorScale=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=108,G=0,B=255,A=0))
	ColorScale[1]=(RelativeTime=0.6964290,Color=(R=194,G=157,B=255,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
	InitialParticlesPerSecond=500.0000000
	LifetimeRange=(Min=0.3000000,Max=0.3000000)
end object
// Reference: MeshEmitter'BWBP_SKC_Pro.IE_PumaDetClose.MeshEmitter4'
begin object name="MeshEmitter4" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BWBP_SKC_Static.PUMA.ShieldShard'
	UseParticleColor=true
	UseCollision=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-1000.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	MaxParticles=20
	StartLocationRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=-1.0000000,Max=1.0000000),Z=(Min=-1.0000000,Max=1.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=0
	LifetimeRange=(Min=0.5000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=-600.0000000,Max=600.0000000),Y=(Min=-600.0000000,Max=600.0000000),Z=(Min=-600.0000000,Max=600.0000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_PumaDetClose.SpriteEmitter10'
begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.5392860,Color=(R=128,G=192,B=255,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=128,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.7000000,Max=0.7000000),Y=(Min=0.7000000,Max=0.7000000),Z=(Min=0.7000000,Max=0.7000000))
	FadeOutStartTime=0.0920000
	FadeInEndTime=0.0320000
	MaxParticles=1
	DetailMode=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=0.6000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=350.0000000,Max=350.0000000),Y=(Min=350.0000000,Max=350.0000000),Z=(Min=350.0000000,Max=350.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.ElectroShock'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
end object
