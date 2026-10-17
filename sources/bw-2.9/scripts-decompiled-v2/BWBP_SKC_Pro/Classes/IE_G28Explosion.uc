class IE_G28Explosion extends BallisticEmitter;

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
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_G28Explosion.SpriteEmitter19'
	begin object name="SpriteEmitter19" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.9071430,Color=(R=225,G=225,B=225,A=160))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[4]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		FadeOutStartTime=0.6861900
		DetailMode=1
		StartLocationRange=(X=(Min=-16.0000000,Max=16.0000000),Y=(Min=-16.0000000,Max=16.0000000),Z=(Min=-20.0000000,Max=60.0000000))
		AddLocationFromOtherEmitter=4
		SphereRadiusRange=(Min=180.0000000,Max=180.0000000)
		SpinsPerSecondRange=(X=(Min=-0.0200000,Max=0.0200000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=0.6500000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=90.0000000,Max=100.0000000),Y=(Min=90.0000000,Max=100.0000000),Z=(Min=90.0000000,Max=100.0000000))
		InitialParticlesPerSecond=80.0000000
		DrawStyle=1
		Texture=Texture'ONSBPTextures.fX.ExploTrans'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		LifetimeRange=(Min=2.0000000,Max=3.0000000)
		InitialDelayRange=(Min=0.7500000,Max=0.7500000)
		StartVelocityRange=(X=(Min=-60.0000000,Max=60.0000000),Y=(Min=-60.0000000,Max=60.0000000),Z=(Min=0.8000000,Max=20.0000000))
		VelocityLossRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.4000000,Max=0.4000000))
	end object
	Emitters[0]=SpriteEmitter19
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_G28Explosion.SpriteEmitter20'
	begin object name="SpriteEmitter20" class=Engine.SpriteEmitter
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
		Opacity=0.7000000
		FadeOutStartTime=0.1190000
		MaxParticles=6
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.1000000,Max=0.1000000))
		AddLocationFromOtherEmitter=0
		StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0100000)
		SizeScale[1]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
		SizeScale[2]=(RelativeTime=0.2500000,RelativeSize=3.0000000)
		SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
		StartSizeRange=(X=(Min=48.0000000,Max=48.0000000),Y=(Min=48.0000000,Max=48.0000000),Z=(Min=48.0000000,Max=48.0000000))
		InitialParticlesPerSecond=300.0000000
		Texture=Texture'ONSBPTextures.fX.ExploTrans'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		LifetimeRange=(Min=1.5000000,Max=1.5000000)
		InitialDelayRange=(Min=0.7500000,Max=0.7500000)
	end object
	Emitters[1]=SpriteEmitter20
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_G28Explosion.SpriteEmitter21'
	begin object name="SpriteEmitter21" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.9071430,Color=(R=225,G=225,B=225,A=160))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[4]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		FadeOutStartTime=0.6861900
		DetailMode=1
		StartLocationRange=(X=(Min=-16.0000000,Max=16.0000000),Y=(Min=-16.0000000,Max=16.0000000),Z=(Min=-20.0000000,Max=60.0000000))
		AddLocationFromOtherEmitter=4
		SphereRadiusRange=(Min=180.0000000,Max=180.0000000)
		SpinsPerSecondRange=(X=(Min=-0.0200000,Max=0.0200000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=0.6500000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=90.0000000,Max=100.0000000),Y=(Min=90.0000000,Max=100.0000000),Z=(Min=90.0000000,Max=100.0000000))
		InitialParticlesPerSecond=80.0000000
		Texture=Texture'ONSBPTextures.fX.ExploTrans'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		LifetimeRange=(Min=3.0000000,Max=4.0000000)
		InitialDelayRange=(Min=0.7500000,Max=0.7500000)
		StartVelocityRange=(X=(Min=-60.0000000,Max=60.0000000),Y=(Min=-60.0000000,Max=60.0000000),Z=(Min=0.8000000,Max=20.0000000))
		VelocityLossRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.4000000,Max=0.4000000))
	end object
	Emitters[2]=SpriteEmitter21
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_G28Explosion.SpriteEmitter22'
	begin object name="SpriteEmitter22" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=0,A=255))
		MaxParticles=5
		AddLocationFromOtherEmitter=2
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=5.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
		StartSizeRange=(X=(Min=25.0000000,Max=25.0000000),Y=(Min=25.0000000,Max=25.0000000),Z=(Min=25.0000000,Max=25.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=6
		Texture=Texture'EpicParticles.Flares.SoftFlare'
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		InitialDelayRange=(Min=0.7500000,Max=0.7500000)
		AddVelocityFromOtherEmitter=2
	end object
	Emitters[3]=SpriteEmitter22
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_G28Explosion.SpriteEmitter23'
	begin object name="SpriteEmitter23" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.9000000,Max=0.9000000))
		Opacity=0.4000000
		FadeOutStartTime=0.6400000
		FadeInEndTime=0.0300000
		MaxParticles=25
		StartLocationShape=1
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=75.0000000,Max=75.0000000),Y=(Min=75.0000000,Max=75.0000000),Z=(Min=75.0000000,Max=75.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=6
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke3'
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=-150.0000000,Max=150.0000000),Y=(Min=-150.0000000,Max=150.0000000),Z=(Min=-100.0000000,Max=100.0000000))
		VelocityLossRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	end object
	Emitters[4]=SpriteEmitter23
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_G28Explosion.SpriteEmitter24'
	begin object name="SpriteEmitter24" class=Engine.SpriteEmitter
		UseDirectionAs=4
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		MaxParticles=1
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=100.0000000)
		StartSizeRange=(X=(Min=3.5000000,Max=3.5000000),Y=(Min=3.5000000,Max=3.5000000),Z=(Min=3.5000000,Max=3.5000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'AW-2004Particles.Energy.SmoothRing'
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		InitialDelayRange=(Min=0.7500000,Max=0.7500000)
	end object
	Emitters[5]=SpriteEmitter24
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_G28Explosion.SpriteEmitter25'
	begin object name="SpriteEmitter25" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
		Opacity=0.3000000
		FadeOutStartTime=4.4100000
		FadeInEndTime=1.8900000
		MaxParticles=50
		StartLocationRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=0.0000000,Max=0.0000000))
		AddLocationFromOtherEmitter=0
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke3'
		LifetimeRange=(Min=7.0000000,Max=7.0000000)
		InitialDelayRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=15.0000000,Max=15.0000000))
		VelocityLossRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.2500000,Max=0.2500000))
	end object
	Emitters[6]=SpriteEmitter25
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_G28Explosion.SpriteEmitter26'
	begin object name="SpriteEmitter26" class=Engine.SpriteEmitter
		UseCollision=true
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-42.5000000)
		DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=200,G=150,B=0,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=150,G=100,B=0,A=255))
		FadeOutStartTime=2.0000000
		FadeInEndTime=2.0000000
		MaxParticles=20
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'AW-2004Particles.Energy.BurnFlare'
		LifetimeRange=(Min=5.0000000,Max=5.0000000)
		InitialDelayRange=(Min=0.7500000,Max=0.7500000)
		StartVelocityRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=0.0000000,Max=100.0000000))
	end object
	Emitters[7]=SpriteEmitter26
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_G28Explosion.SpriteEmitter27'
	begin object name="SpriteEmitter27" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.5000000
		FadeOutStartTime=1.0000000
		FadeInEndTime=1.0000000
		MaxParticles=20
		StartLocationRange=(X=(Min=-40.0000000,Max=40.0000000),Y=(Min=-40.0000000,Max=40.0000000),Z=(Min=-40.0000000,Max=40.0000000))
		AddLocationFromOtherEmitter=4
		StartLocationShape=1
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=10.0000000)
		StartSizeRange=(X=(Min=15.0000000,Max=15.0000000),Y=(Min=15.0000000,Max=15.0000000),Z=(Min=15.0000000,Max=15.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'EpicParticles.Smoke.SparkCloud_01aw'
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		InitialDelayRange=(Min=0.7500000,Max=0.7500000)
	end object
	Emitters[8]=SpriteEmitter27
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_G28Explosion.SpriteEmitter31'
	begin object name="SpriteEmitter31" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-85.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=200,G=150,B=0,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=150,G=100,B=0,A=255))
		Opacity=0.5000000
		FadeOutStartTime=0.1800000
		FadeInEndTime=0.1800000
		MaxParticles=125
		StartLocationRange=(X=(Min=-80.0000000,Max=80.0000000),Y=(Min=-80.0000000,Max=80.0000000),Z=(Min=-80.0000000,Max=80.0000000))
		SphereRadiusRange=(Min=100.0000000,Max=100.0000000)
		SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.0500000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=10.0000000)
		StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'EpicParticles.Flares.Rev_Particle1'
		InitialDelayRange=(Min=0.7500000,Max=0.7500000)
		StartVelocityRange=(X=(Min=-100.0000000,Max=100.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=150.0000000,Max=200.0000000))
	end object
	Emitters[9]=SpriteEmitter31
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_G28Explosion.SpriteEmitter38'
	begin object name="SpriteEmitter38" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
		Opacity=0.3000000
		FadeOutStartTime=4.4100000
		FadeInEndTime=1.8900000
		MaxParticles=50
		StartLocationRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=0.0000000,Max=0.0000000))
		AddLocationFromOtherEmitter=0
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke3'
		LifetimeRange=(Min=7.0000000,Max=7.0000000)
		InitialDelayRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=15.0000000,Max=15.0000000))
		VelocityLossRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.2500000,Max=0.2500000))
	end object
	Emitters[10]=SpriteEmitter38
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_G28Explosion.SpriteEmitter50'
	begin object name="SpriteEmitter50" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.4000000
		FadeOutStartTime=0.0900000
		FadeInEndTime=0.0900000
		MaxParticles=4
		SpinsPerSecondRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=0.1400000,RelativeSize=10.0000000)
		SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=11.0000000)
		SizeScale[2]=(RelativeTime=0.5000000,RelativeSize=12.0000000)
		SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=13.0000000)
		StartSizeRange=(X=(Min=12.0000000,Max=12.0000000),Y=(Min=12.0000000,Max=12.0000000),Z=(Min=12.0000000,Max=12.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.Explode2'
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		InitialDelayRange=(Min=0.6500000,Max=0.6500000)
	end object
	Emitters[11]=SpriteEmitter50
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_G28Explosion.SpriteEmitter81'
	begin object name="SpriteEmitter81" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=1.0000000
		FadeInEndTime=1.0000000
		MaxParticles=2
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=0.1400000,RelativeSize=10.0000000)
		SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=11.0000000)
		SizeScale[2]=(RelativeTime=0.5000000,RelativeSize=12.0000000)
		SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=13.0000000)
		StartSizeRange=(X=(Min=25.0000000,Max=25.0000000),Y=(Min=25.0000000,Max=25.0000000),Z=(Min=25.0000000,Max=25.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'AW-2004Explosions.Fire.Part_explode3'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		InitialDelayRange=(Min=0.7500000,Max=0.7500000)
	end object
	Emitters[12]=SpriteEmitter81
	AutoDestroy=true
	LightType=2
	LightEffect=13
	LightHue=30
	LightSaturation=150
	LightBrightness=150.0000000
	LightRadius=32.0000000
	LightPeriod=3
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_G28Explosion.SpriteEmitter19'
begin object name="SpriteEmitter19" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.9071430,Color=(R=225,G=225,B=225,A=160))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[4]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	FadeOutStartTime=0.6861900
	DetailMode=1
	StartLocationRange=(X=(Min=-16.0000000,Max=16.0000000),Y=(Min=-16.0000000,Max=16.0000000),Z=(Min=-20.0000000,Max=60.0000000))
	AddLocationFromOtherEmitter=4
	SphereRadiusRange=(Min=180.0000000,Max=180.0000000)
	SpinsPerSecondRange=(X=(Min=-0.0200000,Max=0.0200000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=0.6500000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=90.0000000,Max=100.0000000),Y=(Min=90.0000000,Max=100.0000000),Z=(Min=90.0000000,Max=100.0000000))
	InitialParticlesPerSecond=80.0000000
	DrawStyle=1
	Texture=Texture'ONSBPTextures.fX.ExploTrans'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	LifetimeRange=(Min=2.0000000,Max=3.0000000)
	InitialDelayRange=(Min=0.7500000,Max=0.7500000)
	StartVelocityRange=(X=(Min=-60.0000000,Max=60.0000000),Y=(Min=-60.0000000,Max=60.0000000),Z=(Min=0.8000000,Max=20.0000000))
	VelocityLossRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.4000000,Max=0.4000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_G28Explosion.SpriteEmitter20'
begin object name="SpriteEmitter20" class=Engine.SpriteEmitter
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
	Opacity=0.7000000
	FadeOutStartTime=0.1190000
	MaxParticles=6
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.1000000,Max=0.1000000))
	AddLocationFromOtherEmitter=0
	StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0100000)
	SizeScale[1]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
	SizeScale[2]=(RelativeTime=0.2500000,RelativeSize=3.0000000)
	SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
	StartSizeRange=(X=(Min=48.0000000,Max=48.0000000),Y=(Min=48.0000000,Max=48.0000000),Z=(Min=48.0000000,Max=48.0000000))
	InitialParticlesPerSecond=300.0000000
	Texture=Texture'ONSBPTextures.fX.ExploTrans'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	LifetimeRange=(Min=1.5000000,Max=1.5000000)
	InitialDelayRange=(Min=0.7500000,Max=0.7500000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_G28Explosion.SpriteEmitter21'
begin object name="SpriteEmitter21" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.9071430,Color=(R=225,G=225,B=225,A=160))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[4]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	FadeOutStartTime=0.6861900
	DetailMode=1
	StartLocationRange=(X=(Min=-16.0000000,Max=16.0000000),Y=(Min=-16.0000000,Max=16.0000000),Z=(Min=-20.0000000,Max=60.0000000))
	AddLocationFromOtherEmitter=4
	SphereRadiusRange=(Min=180.0000000,Max=180.0000000)
	SpinsPerSecondRange=(X=(Min=-0.0200000,Max=0.0200000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=0.6500000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=90.0000000,Max=100.0000000),Y=(Min=90.0000000,Max=100.0000000),Z=(Min=90.0000000,Max=100.0000000))
	InitialParticlesPerSecond=80.0000000
	Texture=Texture'ONSBPTextures.fX.ExploTrans'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	LifetimeRange=(Min=3.0000000,Max=4.0000000)
	InitialDelayRange=(Min=0.7500000,Max=0.7500000)
	StartVelocityRange=(X=(Min=-60.0000000,Max=60.0000000),Y=(Min=-60.0000000,Max=60.0000000),Z=(Min=0.8000000,Max=20.0000000))
	VelocityLossRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.4000000,Max=0.4000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_G28Explosion.SpriteEmitter22'
begin object name="SpriteEmitter22" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=0,A=255))
	MaxParticles=5
	AddLocationFromOtherEmitter=2
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=5.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
	StartSizeRange=(X=(Min=25.0000000,Max=25.0000000),Y=(Min=25.0000000,Max=25.0000000),Z=(Min=25.0000000,Max=25.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=6
	Texture=Texture'EpicParticles.Flares.SoftFlare'
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	InitialDelayRange=(Min=0.7500000,Max=0.7500000)
	AddVelocityFromOtherEmitter=2
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_G28Explosion.SpriteEmitter23'
begin object name="SpriteEmitter23" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.9000000,Max=0.9000000))
	Opacity=0.4000000
	FadeOutStartTime=0.6400000
	FadeInEndTime=0.0300000
	MaxParticles=25
	StartLocationShape=1
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=75.0000000,Max=75.0000000),Y=(Min=75.0000000,Max=75.0000000),Z=(Min=75.0000000,Max=75.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=6
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke3'
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=-150.0000000,Max=150.0000000),Y=(Min=-150.0000000,Max=150.0000000),Z=(Min=-100.0000000,Max=100.0000000))
	VelocityLossRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_G28Explosion.SpriteEmitter24'
begin object name="SpriteEmitter24" class=Engine.SpriteEmitter
	UseDirectionAs=4
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	MaxParticles=1
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=100.0000000)
	StartSizeRange=(X=(Min=3.5000000,Max=3.5000000),Y=(Min=3.5000000,Max=3.5000000),Z=(Min=3.5000000,Max=3.5000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'AW-2004Particles.Energy.SmoothRing'
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	InitialDelayRange=(Min=0.7500000,Max=0.7500000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_G28Explosion.SpriteEmitter25'
begin object name="SpriteEmitter25" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	Opacity=0.3000000
	FadeOutStartTime=4.4100000
	FadeInEndTime=1.8900000
	MaxParticles=50
	StartLocationRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=0.0000000,Max=0.0000000))
	AddLocationFromOtherEmitter=0
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke3'
	LifetimeRange=(Min=7.0000000,Max=7.0000000)
	InitialDelayRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=15.0000000,Max=15.0000000))
	VelocityLossRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.2500000,Max=0.2500000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_G28Explosion.SpriteEmitter26'
begin object name="SpriteEmitter26" class=Engine.SpriteEmitter
	UseCollision=true
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-42.5000000)
	DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=200,G=150,B=0,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=150,G=100,B=0,A=255))
	FadeOutStartTime=2.0000000
	FadeInEndTime=2.0000000
	MaxParticles=20
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.1000000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'AW-2004Particles.Energy.BurnFlare'
	LifetimeRange=(Min=5.0000000,Max=5.0000000)
	InitialDelayRange=(Min=0.7500000,Max=0.7500000)
	StartVelocityRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=0.0000000,Max=100.0000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_G28Explosion.SpriteEmitter27'
begin object name="SpriteEmitter27" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.5000000
	FadeOutStartTime=1.0000000
	FadeInEndTime=1.0000000
	MaxParticles=20
	StartLocationRange=(X=(Min=-40.0000000,Max=40.0000000),Y=(Min=-40.0000000,Max=40.0000000),Z=(Min=-40.0000000,Max=40.0000000))
	AddLocationFromOtherEmitter=4
	StartLocationShape=1
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=10.0000000)
	StartSizeRange=(X=(Min=15.0000000,Max=15.0000000),Y=(Min=15.0000000,Max=15.0000000),Z=(Min=15.0000000,Max=15.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'EpicParticles.Smoke.SparkCloud_01aw'
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	InitialDelayRange=(Min=0.7500000,Max=0.7500000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_G28Explosion.SpriteEmitter31'
begin object name="SpriteEmitter31" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-85.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=200,G=150,B=0,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=150,G=100,B=0,A=255))
	Opacity=0.5000000
	FadeOutStartTime=0.1800000
	FadeInEndTime=0.1800000
	MaxParticles=125
	StartLocationRange=(X=(Min=-80.0000000,Max=80.0000000),Y=(Min=-80.0000000,Max=80.0000000),Z=(Min=-80.0000000,Max=80.0000000))
	SphereRadiusRange=(Min=100.0000000,Max=100.0000000)
	SpinsPerSecondRange=(X=(Min=0.0500000,Max=0.0500000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=1.0000000,RelativeSize=10.0000000)
	StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'EpicParticles.Flares.Rev_Particle1'
	InitialDelayRange=(Min=0.7500000,Max=0.7500000)
	StartVelocityRange=(X=(Min=-100.0000000,Max=100.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=150.0000000,Max=200.0000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_G28Explosion.SpriteEmitter38'
begin object name="SpriteEmitter38" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	Opacity=0.3000000
	FadeOutStartTime=4.4100000
	FadeInEndTime=1.8900000
	MaxParticles=50
	StartLocationRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=0.0000000,Max=0.0000000))
	AddLocationFromOtherEmitter=0
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0500000,Max=0.1000000),Z=(Min=0.0500000,Max=0.1000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke3'
	LifetimeRange=(Min=7.0000000,Max=7.0000000)
	InitialDelayRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=15.0000000,Max=15.0000000))
	VelocityLossRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.2500000,Max=0.2500000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_G28Explosion.SpriteEmitter50'
begin object name="SpriteEmitter50" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.4000000
	FadeOutStartTime=0.0900000
	FadeInEndTime=0.0900000
	MaxParticles=4
	SpinsPerSecondRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=0.1400000,RelativeSize=10.0000000)
	SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=11.0000000)
	SizeScale[2]=(RelativeTime=0.5000000,RelativeSize=12.0000000)
	SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=13.0000000)
	StartSizeRange=(X=(Min=12.0000000,Max=12.0000000),Y=(Min=12.0000000,Max=12.0000000),Z=(Min=12.0000000,Max=12.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.Explode2'
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	InitialDelayRange=(Min=0.6500000,Max=0.6500000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_G28Explosion.SpriteEmitter81'
begin object name="SpriteEmitter81" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=1.0000000
	FadeInEndTime=1.0000000
	MaxParticles=2
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=0.1400000,RelativeSize=10.0000000)
	SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=11.0000000)
	SizeScale[2]=(RelativeTime=0.5000000,RelativeSize=12.0000000)
	SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=13.0000000)
	StartSizeRange=(X=(Min=25.0000000,Max=25.0000000),Y=(Min=25.0000000,Max=25.0000000),Z=(Min=25.0000000,Max=25.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'AW-2004Explosions.Fire.Part_explode3'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	InitialDelayRange=(Min=0.7500000,Max=0.7500000)
end object
