class IE_FixedNuke extends BallisticEmitter;

simulated event PreBeginPlay()
{
	// End:0x2D
	if(int(Level.DetailMode) < int(2))
	{
		Emitters[2].Disabled = true;
	}
	// End:0x59
	if(int(Level.DetailMode) < int(1))
	{
		Emitters[1].Disabled = true;
	}
	super(Actor).PreBeginPlay();
	//return;	
}

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	bDynamicLight = true;
	SetTimer(0.2000000, false);
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
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_FixedNuke.SpriteEmitter39'
	begin object name="SpriteEmitter39" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.3000000,Color=(R=100,G=100,B=100,A=255))
		ColorScale[2]=(RelativeTime=0.3464290,Color=(R=75,G=75,B=75,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=50,G=50,B=50,A=255))
		FadeOutFactor=(W=0.0000000,X=1.0000000,Y=1.0000000,Z=1.0000000)
		FadeOutStartTime=0.0009600
		FadeInEndTime=0.0009600
		MaxParticles=50
		StartLocationRange=(X=(Min=-562.5000000,Max=562.5000000),Y=(Min=-562.5000000,Max=562.5000000),Z=(Min=-112.5000000,Max=112.5000000))
		StartLocationPolarRange=(X=(Min=16.0000000,Max=16.0000000),Y=(Min=32.0000000,Max=32.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.0500000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=562.5000000,Max=562.5000000),Y=(Min=562.5000000,Max=562.5000000),Z=(Min=562.5000000,Max=562.5000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.NewSmoke1f'
		LifetimeRange=(Min=0.0010000,Max=0.0010000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=168.7500000,Max=168.7500000))
		VelocityLossRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0500000,Max=0.0500000))
	end object
	Emitters[0]=SpriteEmitter39
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_FixedNuke.SpriteEmitter41'
	begin object name="SpriteEmitter41" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.3000000,Color=(R=100,G=100,B=100,A=255))
		ColorScale[2]=(RelativeTime=0.3464290,Color=(R=75,G=75,B=75,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=50,G=50,B=50,A=255))
		FadeOutStartTime=2.5000000
		FadeInEndTime=1.2000000
		MaxParticles=50
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=375.0000000)
		StartLocationRange=(X=(Min=-337.5000000,Max=337.5000000),Y=(Min=-337.5000000,Max=337.5000000),Z=(Min=-112.5000000,Max=112.5000000))
		StartLocationPolarRange=(X=(Min=16.0000000,Max=16.0000000),Y=(Min=32.0000000,Max=32.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.0500000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=562.5000000,Max=562.5000000),Y=(Min=562.5000000,Max=562.5000000),Z=(Min=562.5000000,Max=562.5000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.NewSmoke1f'
		LifetimeRange=(Min=10.0000000,Max=10.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=168.7500000,Max=168.7500000))
		VelocityLossRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0500000,Max=0.0500000))
	end object
	Emitters[1]=SpriteEmitter41
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_FixedNuke.SpriteEmitter79'
	begin object name="SpriteEmitter79" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=150,G=150,B=150,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=100,G=100,B=100,A=255))
		FadeOutStartTime=4.2000000
		FadeInEndTime=1.3000000
		MaxParticles=125
		StartLocationRange=(X=(Min=-1500.0000000,Max=1500.0000000),Y=(Min=-1500.0000000,Max=1500.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=187.5000000,Max=187.5000000),Y=(Min=187.5000000,Max=187.5000000),Z=(Min=187.5000000,Max=187.5000000))
		InitialParticlesPerSecond=12.5000000
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Weapons.SmokePanels1'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=5.0000000,Max=5.0000000)
		InitialDelayRange=(Min=0.0000000,Max=0.5000000)
		StartVelocityRadialRange=(Min=50.0000000,Max=50.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[2]=SpriteEmitter79
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_FixedNuke.SpriteEmitter82'
	begin object name="SpriteEmitter82" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=150,G=150,B=150,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=100,G=100,B=100,A=255))
		FadeOutStartTime=3.3000000
		FadeInEndTime=1.1550000
		MaxParticles=250
		StartLocationRange=(X=(Min=-75.0000000,Max=75.0000000),Y=(Min=-75.0000000,Max=75.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=140.6250000,Max=140.6250000),Y=(Min=140.6250000,Max=140.6250000),Z=(Min=140.6250000,Max=140.6250000))
		InitialParticlesPerSecond=50.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Weapons.SmokePanels1'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=5.5000000,Max=5.5000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=168.7500000,Max=168.7500000))
		StartVelocityRadialRange=(Min=100.0000000,Max=100.0000000)
	end object
	Emitters[3]=SpriteEmitter82
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_FixedNuke.SpriteEmitter83'
	begin object name="SpriteEmitter83" class=Engine.SpriteEmitter
		UseDirectionAs=4
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=175,B=0,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=175,B=0,A=255))
		Opacity=0.5000000
		MaxParticles=1
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		RotationNormal=(X=0.0000000,Y=0.0000000,Z=1.0000000)
		SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=6.0000000)
		StartSizeRange=(X=(Min=562.5000000,Max=562.5000000),Y=(Min=562.5000000,Max=562.5000000),Z=(Min=562.5000000,Max=562.5000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'AW-2004Particles.Energy.SmoothRing'
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[4]=SpriteEmitter83
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_FixedNuke.SpriteEmitter94'
	begin object name="SpriteEmitter94" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.2500000,Color=(R=200,G=200,B=0,A=255))
		ColorScale[2]=(RelativeTime=0.5000000,Color=(R=150,G=125,B=50,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=150,G=100,B=50,A=255))
		MaxParticles=5
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=500.0000000)
		SpinsPerSecondRange=(X=(Min=0.0200000,Max=0.0200000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.2500000,RelativeSize=0.7500000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.7500000)
		StartSizeRange=(X=(Min=3500.0000000,Max=3500.0000000),Y=(Min=3500.0000000,Max=3500.0000000),Z=(Min=3500.0000000,Max=3500.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'BW_Core_WeaponTex.Specularity.BWSpecularity'
		LifetimeRange=(Min=4.0010000,Max=4.0010000)
		AddVelocityFromOtherEmitter=1
	end object
	Emitters[5]=SpriteEmitter94
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_FixedNuke.SpriteEmitter95'
	begin object name="SpriteEmitter95" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=1.6000000
		FadeInEndTime=0.8800000
		MaxParticles=100
		StartLocationRange=(X=(Min=-100.0000000,Max=100.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=-100.0000000,Max=100.0000000))
		AddLocationFromOtherEmitter=1
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=300.0000000,Max=300.0000000),Y=(Min=300.0000000,Max=300.0000000),Z=(Min=300.0000000,Max=300.0000000))
		InitialParticlesPerSecond=30.0000000
		DrawStyle=1
		Texture=Texture'ExplosionTex.Framed.exp2_frames'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=3.0000000,Max=4.0000000)
		InitialDelayRange=(Min=0.5000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=2.0000000,Max=2.0000000))
		VelocityLossRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0500000,Max=0.0500000))
		AddVelocityFromOtherEmitter=1
	end object
	Emitters[6]=SpriteEmitter95
	// Reference: MeshEmitter'BWBP_SKC_Pro.IE_FixedNuke.MeshEmitter0'
	begin object name="MeshEmitter0" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'VMmeshEmitted.EJECTA.Sphere'
		UseMeshBlendMode=false
		RenderTwoSided=true
		UseParticleColor=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.0100000
		FadeOutStartTime=0.1000000
		FadeInEndTime=0.1000000
		MaxParticles=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=10.0000000)
		StartSizeRange=(X=(Min=200.0000000,Max=200.0000000),Y=(Min=200.0000000,Max=200.0000000),Z=(Min=200.0000000,Max=200.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=2
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
	end object
	Emitters[7]=MeshEmitter0
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_FixedNuke.SpriteEmitter98'
	begin object name="SpriteEmitter98" class=Engine.SpriteEmitter
		UseCollision=true
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		VelocityFromMesh=true
		UniformMeshScale=false
		UniformVelocityScale=false
		SpawnOnlyInDirectionOfNormal=true
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		UseRandomSubdivision=true
		DampingFactorRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=150,G=150,B=150,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=100,G=100,B=100,A=255))
		Opacity=0.7500000
		FadeOutStartTime=7.5000000
		FadeInEndTime=3.6000000
		MaxParticles=250
		StartLocationPolarRange=(X=(Min=1024.0000000,Max=1024.0000000),Y=(Min=1024.0000000,Max=1024.0000000),Z=(Min=1000.0000000,Max=1000.0000000))
		MeshSpawningStaticMesh=StaticMesh'ParticleMeshes.Simple.ParticleRing'
		MeshSpawning=2
		VelocityScaleRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		MeshScaleRange=(X=(Min=10.0000000,Max=50.0000000),Y=(Min=10.0000000,Max=50.0000000),Z=(Min=0.0100000,Max=0.0100000))
		MeshNormal=(X=16384.0000000,Y=16384.0000000,Z=0.0000000)
		MeshNormalThresholdRange=(Min=16384.0000000,Max=16384.0000000)
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=200.0000000,Max=200.0000000),Y=(Min=200.0000000,Max=200.0000000),Z=(Min=200.0000000,Max=200.0000000))
		InitialParticlesPerSecond=500000.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Weapons.SmokePanels1'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=9.0000000,Max=10.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-500.0000000,Max=-500.0000000))
		StartVelocityRadialRange=(Min=-1000.0000000,Max=1000.0000000)
	end object
	Emitters[8]=SpriteEmitter98
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_FixedNuke.SpriteEmitter99'
	begin object name="SpriteEmitter99" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=175,B=0,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=175,B=0,A=255))
		Opacity=0.5000000
		MaxParticles=1
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		RotationNormal=(X=0.0000000,Y=0.0000000,Z=1.0000000)
		SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=6.0000000)
		StartSizeRange=(X=(Min=562.5000000,Max=562.5000000),Y=(Min=562.5000000,Max=562.5000000),Z=(Min=562.5000000,Max=562.5000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Energy.SmoothRing'
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[9]=SpriteEmitter99
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_FixedNuke.SpriteEmitter100'
	begin object name="SpriteEmitter100" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=5.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=150,G=150,B=150,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=100,G=100,B=100,A=255))
		FadeOutStartTime=2.2000000
		FadeInEndTime=1.3000000
		MaxParticles=250
		StartLocationRange=(X=(Min=-750.0000000,Max=750.0000000),Y=(Min=-750.0000000,Max=750.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=187.5000000,Max=187.5000000),Y=(Min=187.5000000,Max=187.5000000),Z=(Min=187.5000000,Max=187.5000000))
		InitialParticlesPerSecond=25.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Weapons.SmokePanels1'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=5.0000000,Max=5.0000000)
		InitialDelayRange=(Min=0.0000000,Max=0.5000000)
		StartVelocityRadialRange=(Min=50.0000000,Max=50.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[10]=SpriteEmitter100
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_FixedNuke.SpriteEmitter101'
	begin object name="SpriteEmitter101" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		MaxParticles=5
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=0.1400000,RelativeSize=10.0000000)
		SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=11.0000000)
		SizeScale[2]=(RelativeTime=0.5000000,RelativeSize=12.0000000)
		SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=13.0000000)
		StartSizeRange=(X=(Min=250.0000000,Max=250.0000000),Y=(Min=250.0000000,Max=250.0000000),Z=(Min=250.0000000,Max=250.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'AW-2004Explosions.Fire.Part_explode2s'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.6000000,Max=0.6000000)
		InitialDelayRange=(Min=0.2500000,Max=0.2500000)
	end object
	Emitters[11]=SpriteEmitter101
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_FixedNuke.SpriteEmitter102'
	begin object name="SpriteEmitter102" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.6400000
		FadeInEndTime=0.6400000
		StartLocationRange=(X=(Min=-100.0000000,Max=100.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=2500.0000000,Max=2500.0000000),Y=(Min=2500.0000000,Max=2500.0000000),Z=(Min=2500.0000000,Max=2500.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'EmitterTextures.Flares.EFlareOY'
		LifetimeRange=(Min=2.0000000,Max=3.0000000)
		AddVelocityFromOtherEmitter=0
	end object
	Emitters[12]=SpriteEmitter102
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_FixedNuke.SpriteEmitter104'
	begin object name="SpriteEmitter104" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=175,B=0,A=255))
		FadeOutStartTime=2.0000000
		MaxParticles=2
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=150.0000000)
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=10.0000000)
		SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=25.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=27.0000000)
		StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'EpicParticles.Flares.SoftFlare'
		LifetimeRange=(Min=4.0010000,Max=4.0010000)
		VelocityLossRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0250000,Max=0.0250000))
		AddVelocityFromOtherEmitter=0
	end object
	Emitters[13]=SpriteEmitter104
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_FixedNuke.SpriteEmitter105'
	begin object name="SpriteEmitter105" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=2.5000000
		FadeInEndTime=2.5000000
		MaxParticles=100
		StartLocationRange=(X=(Min=-150.0000000,Max=150.0000000),Y=(Min=-150.0000000,Max=150.0000000),Z=(Min=-150.0000000,Max=150.0000000))
		AddLocationFromOtherEmitter=1
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=225.0000000,Max=225.0000000),Y=(Min=225.0000000,Max=225.0000000),Z=(Min=225.0000000,Max=225.0000000))
		InitialParticlesPerSecond=30.0000000
		Texture=Texture'ONSBPTextures.fX.ExploTrans'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		LifetimeRange=(Min=3.0000000,Max=4.5000000)
		InitialDelayRange=(Min=0.5000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=2.0000000,Max=2.0000000))
		AddVelocityFromOtherEmitter=1
	end object
	Emitters[14]=SpriteEmitter105
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_FixedNuke.SpriteEmitter107'
	begin object name="SpriteEmitter107" class=Engine.SpriteEmitter
		UseDirectionAs=4
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=175,B=0,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=175,B=0,A=255))
		Opacity=0.0100000
		MaxParticles=120
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		RotationNormal=(X=0.0000000,Y=0.0000000,Z=1.0000000)
		SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=6.0000000)
		StartSizeRange=(X=(Min=100.0000000,Max=400.0000000),Y=(Min=100.0000000,Max=400.0000000),Z=(Min=100.0000000,Max=400.0000000))
		InitialParticlesPerSecond=180.0000000
		Texture=Texture'AW-2004Particles.Weapons.PlasmaRing'
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[15]=SpriteEmitter107
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_FixedNuke.SpriteEmitter109'
	begin object name="SpriteEmitter109" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		ScaleSizeYByVelocity=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=140,B=45,A=255))
		ColorScale[1]=(RelativeTime=0.2142860,Color=(R=160,G=160,B=160,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=255))
		Opacity=0.6800000
		FadeOutStartTime=0.2000000
		MaxParticles=140
		StartLocationRange=(X=(Min=-2.0000000,Max=2.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=-2.0000000,Max=2.0000000))
		AddLocationFromOtherEmitter=2
		StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=40.0000000,Max=50.0000000),Y=(Min=40.0000000,Max=50.0000000),Z=(Min=40.0000000,Max=50.0000000))
		ScaleSizeByVelocityMultiplier=(X=1.0000000,Y=0.0030000,Z=1.0000000)
		InitialParticlesPerSecond=140.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.8000000,Max=1.8000000)
		AddVelocityFromOtherEmitter=2
		AddVelocityMultiplierRange=(X=(Min=0.1000000,Max=0.1500000),Y=(Min=0.1000000,Max=0.1500000),Z=(Min=0.1000000,Max=0.1500000))
	end object
	Emitters[16]=SpriteEmitter109
	// Reference: MeshEmitter'BWBP_SKC_Pro.IE_FixedNuke.MeshEmitter6'
	begin object name="MeshEmitter6" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.Impact.ConcreteChip2'
		UseMeshBlendMode=false
		UseParticleColor=true
		UseCollision=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-800.0000000)
		ExtentMultiplier=(X=0.5000000,Y=0.5000000,Z=0.5000000)
		DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.0000000,Max=0.0000000))
		FadeOutStartTime=0.3700000
		MaxParticles=18
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=4.0000000),Y=(Min=0.0000000,Max=4.0000000),Z=(Min=0.0000000,Max=4.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=0.8000000,Max=1.9000000),Y=(Min=0.8000000,Max=1.9000000),Z=(Min=0.8000000,Max=1.9000000))
		InitialParticlesPerSecond=5000.0000000
		SecondsBeforeInactive=0.0000000
		MinSquaredVelocity=5000.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=-700.0000000,Max=700.0000000),Y=(Min=-700.0000000,Max=700.0000000),Z=(Min=-100.0000000,Max=800.0000000))
	end object
	Emitters[17]=MeshEmitter6
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_FixedNuke.SpriteEmitter110'
	begin object name="SpriteEmitter110" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.6000000,Max=0.6000000))
		FadeOutStartTime=0.2000000
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
		StartSizeRange=(X=(Min=1500.0000000,Max=1500.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=6
		Texture=Texture'BW_Core_WeaponTex.Particles.Shockwave'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.9000000,Max=0.9000000)
	end object
	Emitters[18]=SpriteEmitter110
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_FixedNuke.SpriteEmitter111'
	begin object name="SpriteEmitter111" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.9000000,Max=1.0000000),Y=(Min=0.7600000,Max=0.7600000),Z=(Min=0.4000000,Max=0.4000000))
		Opacity=0.3200000
		FadeOutStartTime=0.0900000
		FadeInEndTime=0.0440000
		MaxParticles=12
		StartLocationRange=(X=(Min=-40.0000000,Max=40.0000000),Y=(Min=-40.0000000,Max=40.0000000),Z=(Min=-40.0000000,Max=40.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
		SizeScale[1]=(RelativeTime=0.2800000,RelativeSize=3.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=6.0000000)
		StartSizeRange=(X=(Min=60.0000000,Max=1060.0000000),Y=(Min=150.0000000,Max=300.0000000),Z=(Min=150.0000000,Max=300.0000000))
		InitialParticlesPerSecond=15.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.Explode2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
		StartVelocityRange=(X=(Min=-70.0000000,Max=70.0000000),Y=(Min=-70.0000000,Max=70.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[19]=SpriteEmitter111
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_FixedNuke.SpriteEmitter112'
	begin object name="SpriteEmitter112" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		Disabled=true
		Backup_Disabled=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=155,G=155,B=255,A=255))
		FadeOutStartTime=0.1000000
		MaxParticles=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=10.0000000)
		StartSizeRange=(X=(Min=2000.0000000,Max=2000.0000000),Y=(Min=2000.0000000,Max=2000.0000000),Z=(Min=2000.0000000,Max=2000.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.Explode2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.9000000,Max=0.9000000)
	end object
	Emitters[20]=SpriteEmitter112
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_FixedNuke.SpriteEmitter113'
	begin object name="SpriteEmitter113" class=Engine.SpriteEmitter
		UseCollision=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ExtentMultiplier=(X=0.3000000,Y=0.3000000,Z=0.3000000)
		DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.7000000,Max=0.7000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.7000000,Max=0.8000000),Z=(Min=0.1000000,Max=0.2000000))
		Opacity=0.6300000
		FadeOutStartTime=0.0500000
		MaxParticles=9
		AddLocationFromOtherEmitter=5
		AlphaRef=128
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=70.0000000,Max=80.0000000),Y=(Min=70.0000000,Max=80.0000000),Z=(Min=70.0000000,Max=80.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.0500000,Max=0.0500000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-100.0000000,Max=0.0000000))
		VelocityLossRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.3000000,Max=0.4000000))
		AddVelocityFromOtherEmitter=5
	end object
	Emitters[21]=SpriteEmitter113
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_FixedNuke.SpriteEmitter114'
	begin object name="SpriteEmitter114" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.9000000,Max=1.0000000),Y=(Min=0.0800000,Max=0.1600000),Z=(Min=0.4000000,Max=0.4000000))
		Opacity=0.3200000
		FadeOutStartTime=0.1890000
		FadeInEndTime=0.0385000
		MaxParticles=12
		StartLocationRange=(X=(Min=-75.0000000,Max=75.0000000),Y=(Min=-75.0000000,Max=75.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2500000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
		StartSizeRange=(X=(Min=600.0000000,Max=8200.0000000),Y=(Min=600.0000000,Max=8200.0000000),Z=(Min=600.0000000,Max=8200.0000000))
		InitialParticlesPerSecond=40.0000000
		DrawStyle=6
		Texture=Texture'BWBP_SKC_Tex.BFG.BFGProj2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.6500000,Max=0.6500000)
	end object
	Emitters[22]=SpriteEmitter114
	AutoDestroy=true
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=252.0000000
	LightPeriod=3
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_FixedNuke.SpriteEmitter39'
begin object name="SpriteEmitter39" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.3000000,Color=(R=100,G=100,B=100,A=255))
	ColorScale[2]=(RelativeTime=0.3464290,Color=(R=75,G=75,B=75,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=50,G=50,B=50,A=255))
	FadeOutFactor=(W=0.0000000,X=1.0000000,Y=1.0000000,Z=1.0000000)
	FadeOutStartTime=0.0009600
	FadeInEndTime=0.0009600
	MaxParticles=50
	StartLocationRange=(X=(Min=-562.5000000,Max=562.5000000),Y=(Min=-562.5000000,Max=562.5000000),Z=(Min=-112.5000000,Max=112.5000000))
	StartLocationPolarRange=(X=(Min=16.0000000,Max=16.0000000),Y=(Min=32.0000000,Max=32.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.0500000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=562.5000000,Max=562.5000000),Y=(Min=562.5000000,Max=562.5000000),Z=(Min=562.5000000,Max=562.5000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.NewSmoke1f'
	LifetimeRange=(Min=0.0010000,Max=0.0010000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=168.7500000,Max=168.7500000))
	VelocityLossRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0500000,Max=0.0500000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_FixedNuke.SpriteEmitter41'
begin object name="SpriteEmitter41" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.3000000,Color=(R=100,G=100,B=100,A=255))
	ColorScale[2]=(RelativeTime=0.3464290,Color=(R=75,G=75,B=75,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=50,G=50,B=50,A=255))
	FadeOutStartTime=2.5000000
	FadeInEndTime=1.2000000
	MaxParticles=50
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=375.0000000)
	StartLocationRange=(X=(Min=-337.5000000,Max=337.5000000),Y=(Min=-337.5000000,Max=337.5000000),Z=(Min=-112.5000000,Max=112.5000000))
	StartLocationPolarRange=(X=(Min=16.0000000,Max=16.0000000),Y=(Min=32.0000000,Max=32.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.0500000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=562.5000000,Max=562.5000000),Y=(Min=562.5000000,Max=562.5000000),Z=(Min=562.5000000,Max=562.5000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.NewSmoke1f'
	LifetimeRange=(Min=10.0000000,Max=10.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=168.7500000,Max=168.7500000))
	VelocityLossRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0500000,Max=0.0500000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_FixedNuke.SpriteEmitter79'
begin object name="SpriteEmitter79" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=150,G=150,B=150,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=100,G=100,B=100,A=255))
	FadeOutStartTime=4.2000000
	FadeInEndTime=1.3000000
	MaxParticles=125
	StartLocationRange=(X=(Min=-1500.0000000,Max=1500.0000000),Y=(Min=-1500.0000000,Max=1500.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=187.5000000,Max=187.5000000),Y=(Min=187.5000000,Max=187.5000000),Z=(Min=187.5000000,Max=187.5000000))
	InitialParticlesPerSecond=12.5000000
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Weapons.SmokePanels1'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=5.0000000,Max=5.0000000)
	InitialDelayRange=(Min=0.0000000,Max=0.5000000)
	StartVelocityRadialRange=(Min=50.0000000,Max=50.0000000)
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_FixedNuke.SpriteEmitter82'
begin object name="SpriteEmitter82" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=150,G=150,B=150,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=100,G=100,B=100,A=255))
	FadeOutStartTime=3.3000000
	FadeInEndTime=1.1550000
	MaxParticles=250
	StartLocationRange=(X=(Min=-75.0000000,Max=75.0000000),Y=(Min=-75.0000000,Max=75.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=140.6250000,Max=140.6250000),Y=(Min=140.6250000,Max=140.6250000),Z=(Min=140.6250000,Max=140.6250000))
	InitialParticlesPerSecond=50.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Weapons.SmokePanels1'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=5.5000000,Max=5.5000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=168.7500000,Max=168.7500000))
	StartVelocityRadialRange=(Min=100.0000000,Max=100.0000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_FixedNuke.SpriteEmitter83'
begin object name="SpriteEmitter83" class=Engine.SpriteEmitter
	UseDirectionAs=4
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=175,B=0,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=175,B=0,A=255))
	Opacity=0.5000000
	MaxParticles=1
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	RotationNormal=(X=0.0000000,Y=0.0000000,Z=1.0000000)
	SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=6.0000000)
	StartSizeRange=(X=(Min=562.5000000,Max=562.5000000),Y=(Min=562.5000000,Max=562.5000000),Z=(Min=562.5000000,Max=562.5000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'AW-2004Particles.Energy.SmoothRing'
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_FixedNuke.SpriteEmitter94'
begin object name="SpriteEmitter94" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.2500000,Color=(R=200,G=200,B=0,A=255))
	ColorScale[2]=(RelativeTime=0.5000000,Color=(R=150,G=125,B=50,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=150,G=100,B=50,A=255))
	MaxParticles=5
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=500.0000000)
	SpinsPerSecondRange=(X=(Min=0.0200000,Max=0.0200000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.2500000,RelativeSize=0.7500000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.7500000)
	StartSizeRange=(X=(Min=3500.0000000,Max=3500.0000000),Y=(Min=3500.0000000,Max=3500.0000000),Z=(Min=3500.0000000,Max=3500.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'BW_Core_WeaponTex.Specularity.BWSpecularity'
	LifetimeRange=(Min=4.0010000,Max=4.0010000)
	AddVelocityFromOtherEmitter=1
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_FixedNuke.SpriteEmitter95'
begin object name="SpriteEmitter95" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=1.6000000
	FadeInEndTime=0.8800000
	MaxParticles=100
	StartLocationRange=(X=(Min=-100.0000000,Max=100.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=-100.0000000,Max=100.0000000))
	AddLocationFromOtherEmitter=1
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=300.0000000,Max=300.0000000),Y=(Min=300.0000000,Max=300.0000000),Z=(Min=300.0000000,Max=300.0000000))
	InitialParticlesPerSecond=30.0000000
	DrawStyle=1
	Texture=Texture'ExplosionTex.Framed.exp2_frames'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=3.0000000,Max=4.0000000)
	InitialDelayRange=(Min=0.5000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=2.0000000,Max=2.0000000))
	VelocityLossRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0500000,Max=0.0500000))
	AddVelocityFromOtherEmitter=1
end object
// Reference: MeshEmitter'BWBP_SKC_Pro.IE_FixedNuke.MeshEmitter0'
begin object name="MeshEmitter0" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'VMmeshEmitted.EJECTA.Sphere'
	UseMeshBlendMode=false
	RenderTwoSided=true
	UseParticleColor=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.0100000
	FadeOutStartTime=0.1000000
	FadeInEndTime=0.1000000
	MaxParticles=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=10.0000000)
	StartSizeRange=(X=(Min=200.0000000,Max=200.0000000),Y=(Min=200.0000000,Max=200.0000000),Z=(Min=200.0000000,Max=200.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=2
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_FixedNuke.SpriteEmitter98'
begin object name="SpriteEmitter98" class=Engine.SpriteEmitter
	UseCollision=true
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	VelocityFromMesh=true
	UniformMeshScale=false
	UniformVelocityScale=false
	SpawnOnlyInDirectionOfNormal=true
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	UseRandomSubdivision=true
	DampingFactorRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=150,G=150,B=150,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=100,G=100,B=100,A=255))
	Opacity=0.7500000
	FadeOutStartTime=7.5000000
	FadeInEndTime=3.6000000
	MaxParticles=250
	StartLocationPolarRange=(X=(Min=1024.0000000,Max=1024.0000000),Y=(Min=1024.0000000,Max=1024.0000000),Z=(Min=1000.0000000,Max=1000.0000000))
	MeshSpawningStaticMesh=StaticMesh'ParticleMeshes.Simple.ParticleRing'
	MeshSpawning=2
	VelocityScaleRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	MeshScaleRange=(X=(Min=10.0000000,Max=50.0000000),Y=(Min=10.0000000,Max=50.0000000),Z=(Min=0.0100000,Max=0.0100000))
	MeshNormal=(X=16384.0000000,Y=16384.0000000,Z=0.0000000)
	MeshNormalThresholdRange=(Min=16384.0000000,Max=16384.0000000)
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=200.0000000,Max=200.0000000),Y=(Min=200.0000000,Max=200.0000000),Z=(Min=200.0000000,Max=200.0000000))
	InitialParticlesPerSecond=500000.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Weapons.SmokePanels1'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=9.0000000,Max=10.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-500.0000000,Max=-500.0000000))
	StartVelocityRadialRange=(Min=-1000.0000000,Max=1000.0000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_FixedNuke.SpriteEmitter99'
begin object name="SpriteEmitter99" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=175,B=0,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=175,B=0,A=255))
	Opacity=0.5000000
	MaxParticles=1
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	RotationNormal=(X=0.0000000,Y=0.0000000,Z=1.0000000)
	SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=6.0000000)
	StartSizeRange=(X=(Min=562.5000000,Max=562.5000000),Y=(Min=562.5000000,Max=562.5000000),Z=(Min=562.5000000,Max=562.5000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Energy.SmoothRing'
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_FixedNuke.SpriteEmitter100'
begin object name="SpriteEmitter100" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=5.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=150,G=150,B=150,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=100,G=100,B=100,A=255))
	FadeOutStartTime=2.2000000
	FadeInEndTime=1.3000000
	MaxParticles=250
	StartLocationRange=(X=(Min=-750.0000000,Max=750.0000000),Y=(Min=-750.0000000,Max=750.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=187.5000000,Max=187.5000000),Y=(Min=187.5000000,Max=187.5000000),Z=(Min=187.5000000,Max=187.5000000))
	InitialParticlesPerSecond=25.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Weapons.SmokePanels1'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=5.0000000,Max=5.0000000)
	InitialDelayRange=(Min=0.0000000,Max=0.5000000)
	StartVelocityRadialRange=(Min=50.0000000,Max=50.0000000)
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_FixedNuke.SpriteEmitter101'
begin object name="SpriteEmitter101" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	MaxParticles=5
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=0.1400000,RelativeSize=10.0000000)
	SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=11.0000000)
	SizeScale[2]=(RelativeTime=0.5000000,RelativeSize=12.0000000)
	SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=13.0000000)
	StartSizeRange=(X=(Min=250.0000000,Max=250.0000000),Y=(Min=250.0000000,Max=250.0000000),Z=(Min=250.0000000,Max=250.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'AW-2004Explosions.Fire.Part_explode2s'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.6000000,Max=0.6000000)
	InitialDelayRange=(Min=0.2500000,Max=0.2500000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_FixedNuke.SpriteEmitter102'
begin object name="SpriteEmitter102" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.6400000
	FadeInEndTime=0.6400000
	StartLocationRange=(X=(Min=-100.0000000,Max=100.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=2500.0000000,Max=2500.0000000),Y=(Min=2500.0000000,Max=2500.0000000),Z=(Min=2500.0000000,Max=2500.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'EmitterTextures.Flares.EFlareOY'
	LifetimeRange=(Min=2.0000000,Max=3.0000000)
	AddVelocityFromOtherEmitter=0
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_FixedNuke.SpriteEmitter104'
begin object name="SpriteEmitter104" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=175,B=0,A=255))
	FadeOutStartTime=2.0000000
	MaxParticles=2
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=150.0000000)
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=10.0000000)
	SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=25.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=27.0000000)
	StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'EpicParticles.Flares.SoftFlare'
	LifetimeRange=(Min=4.0010000,Max=4.0010000)
	VelocityLossRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0250000,Max=0.0250000))
	AddVelocityFromOtherEmitter=0
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_FixedNuke.SpriteEmitter105'
begin object name="SpriteEmitter105" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=2.5000000
	FadeInEndTime=2.5000000
	MaxParticles=100
	StartLocationRange=(X=(Min=-150.0000000,Max=150.0000000),Y=(Min=-150.0000000,Max=150.0000000),Z=(Min=-150.0000000,Max=150.0000000))
	AddLocationFromOtherEmitter=1
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=225.0000000,Max=225.0000000),Y=(Min=225.0000000,Max=225.0000000),Z=(Min=225.0000000,Max=225.0000000))
	InitialParticlesPerSecond=30.0000000
	Texture=Texture'ONSBPTextures.fX.ExploTrans'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	LifetimeRange=(Min=3.0000000,Max=4.5000000)
	InitialDelayRange=(Min=0.5000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=2.0000000,Max=2.0000000))
	AddVelocityFromOtherEmitter=1
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_FixedNuke.SpriteEmitter107'
begin object name="SpriteEmitter107" class=Engine.SpriteEmitter
	UseDirectionAs=4
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=175,B=0,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=175,B=0,A=255))
	Opacity=0.0100000
	MaxParticles=120
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	RotationNormal=(X=0.0000000,Y=0.0000000,Z=1.0000000)
	SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=6.0000000)
	StartSizeRange=(X=(Min=100.0000000,Max=400.0000000),Y=(Min=100.0000000,Max=400.0000000),Z=(Min=100.0000000,Max=400.0000000))
	InitialParticlesPerSecond=180.0000000
	Texture=Texture'AW-2004Particles.Weapons.PlasmaRing'
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_FixedNuke.SpriteEmitter109'
begin object name="SpriteEmitter109" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	ScaleSizeYByVelocity=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=140,B=45,A=255))
	ColorScale[1]=(RelativeTime=0.2142860,Color=(R=160,G=160,B=160,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=255))
	Opacity=0.6800000
	FadeOutStartTime=0.2000000
	MaxParticles=140
	StartLocationRange=(X=(Min=-2.0000000,Max=2.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=-2.0000000,Max=2.0000000))
	AddLocationFromOtherEmitter=2
	StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=40.0000000,Max=50.0000000),Y=(Min=40.0000000,Max=50.0000000),Z=(Min=40.0000000,Max=50.0000000))
	ScaleSizeByVelocityMultiplier=(X=1.0000000,Y=0.0030000,Z=1.0000000)
	InitialParticlesPerSecond=140.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.8000000,Max=1.8000000)
	AddVelocityFromOtherEmitter=2
	AddVelocityMultiplierRange=(X=(Min=0.1000000,Max=0.1500000),Y=(Min=0.1000000,Max=0.1500000),Z=(Min=0.1000000,Max=0.1500000))
end object
// Reference: MeshEmitter'BWBP_SKC_Pro.IE_FixedNuke.MeshEmitter6'
begin object name="MeshEmitter6" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Impact.ConcreteChip2'
	UseMeshBlendMode=false
	UseParticleColor=true
	UseCollision=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-800.0000000)
	ExtentMultiplier=(X=0.5000000,Y=0.5000000,Z=0.5000000)
	DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.0000000,Max=0.0000000))
	FadeOutStartTime=0.3700000
	MaxParticles=18
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=4.0000000),Y=(Min=0.0000000,Max=4.0000000),Z=(Min=0.0000000,Max=4.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=0.8000000,Max=1.9000000),Y=(Min=0.8000000,Max=1.9000000),Z=(Min=0.8000000,Max=1.9000000))
	InitialParticlesPerSecond=5000.0000000
	SecondsBeforeInactive=0.0000000
	MinSquaredVelocity=5000.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=-700.0000000,Max=700.0000000),Y=(Min=-700.0000000,Max=700.0000000),Z=(Min=-100.0000000,Max=800.0000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_FixedNuke.SpriteEmitter110'
begin object name="SpriteEmitter110" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.6000000,Max=0.6000000))
	FadeOutStartTime=0.2000000
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
	StartSizeRange=(X=(Min=1500.0000000,Max=1500.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=6
	Texture=Texture'BW_Core_WeaponTex.Particles.Shockwave'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.9000000,Max=0.9000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_FixedNuke.SpriteEmitter111'
begin object name="SpriteEmitter111" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.9000000,Max=1.0000000),Y=(Min=0.7600000,Max=0.7600000),Z=(Min=0.4000000,Max=0.4000000))
	Opacity=0.3200000
	FadeOutStartTime=0.0900000
	FadeInEndTime=0.0440000
	MaxParticles=12
	StartLocationRange=(X=(Min=-40.0000000,Max=40.0000000),Y=(Min=-40.0000000,Max=40.0000000),Z=(Min=-40.0000000,Max=40.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
	SizeScale[1]=(RelativeTime=0.2800000,RelativeSize=3.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=6.0000000)
	StartSizeRange=(X=(Min=60.0000000,Max=1060.0000000),Y=(Min=150.0000000,Max=300.0000000),Z=(Min=150.0000000,Max=300.0000000))
	InitialParticlesPerSecond=15.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.Explode2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
	StartVelocityRange=(X=(Min=-70.0000000,Max=70.0000000),Y=(Min=-70.0000000,Max=70.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_FixedNuke.SpriteEmitter112'
begin object name="SpriteEmitter112" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	Disabled=true
	Backup_Disabled=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=155,G=155,B=255,A=255))
	FadeOutStartTime=0.1000000
	MaxParticles=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=10.0000000)
	StartSizeRange=(X=(Min=2000.0000000,Max=2000.0000000),Y=(Min=2000.0000000,Max=2000.0000000),Z=(Min=2000.0000000,Max=2000.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.Explode2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.9000000,Max=0.9000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_FixedNuke.SpriteEmitter113'
begin object name="SpriteEmitter113" class=Engine.SpriteEmitter
	UseCollision=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ExtentMultiplier=(X=0.3000000,Y=0.3000000,Z=0.3000000)
	DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.7000000,Max=0.7000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.7000000,Max=0.8000000),Z=(Min=0.1000000,Max=0.2000000))
	Opacity=0.6300000
	FadeOutStartTime=0.0500000
	MaxParticles=9
	AddLocationFromOtherEmitter=5
	AlphaRef=128
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=70.0000000,Max=80.0000000),Y=(Min=70.0000000,Max=80.0000000),Z=(Min=70.0000000,Max=80.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.0500000,Max=0.0500000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-100.0000000,Max=0.0000000))
	VelocityLossRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.3000000,Max=0.4000000))
	AddVelocityFromOtherEmitter=5
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_FixedNuke.SpriteEmitter114'
begin object name="SpriteEmitter114" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.9000000,Max=1.0000000),Y=(Min=0.0800000,Max=0.1600000),Z=(Min=0.4000000,Max=0.4000000))
	Opacity=0.3200000
	FadeOutStartTime=0.1890000
	FadeInEndTime=0.0385000
	MaxParticles=12
	StartLocationRange=(X=(Min=-75.0000000,Max=75.0000000),Y=(Min=-75.0000000,Max=75.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2500000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
	StartSizeRange=(X=(Min=600.0000000,Max=8200.0000000),Y=(Min=600.0000000,Max=8200.0000000),Z=(Min=600.0000000,Max=8200.0000000))
	InitialParticlesPerSecond=40.0000000
	DrawStyle=6
	Texture=Texture'BWBP_SKC_Tex.BFG.BFGProj2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.6500000,Max=0.6500000)
end object
