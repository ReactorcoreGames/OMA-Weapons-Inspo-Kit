class IE_SuperchargeExplode extends BallisticEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_SuperchargeExplode.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseDirectionAs=4
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
		StartSizeRange=(X=(Min=1200.0000000,Max=1200.0000000),Y=(Min=1200.0000000,Max=1200.0000000),Z=(Min=1200.0000000,Max=1200.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.ElectroShock'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
	end object
	Emitters[0]=SpriteEmitter0
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_SuperchargeExplode.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.1700000
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
		SizeScale[1]=(RelativeTime=0.2800000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.8000000)
		StartSizeRange=(X=(Min=250.0000000,Max=250.0000000),Y=(Min=250.0000000,Max=250.0000000),Z=(Min=250.0000000,Max=250.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[1]=SpriteEmitter1
	// Reference: BeamEmitter'BWBP_SKC_Pro.IE_SuperchargeExplode.BeamEmitter0'
	begin object name="BeamEmitter0" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=300.0000000,Max=500.0000000)
		DetermineEndPointBy=1
		LowFrequencyNoiseRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
		HighFrequencyNoiseRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
		HighFrequencyPoints=8
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.1571430,Color=(R=0,G=64,B=128,A=255))
		ColorScale[2]=(RelativeTime=0.2607140,Color=(R=192,G=224,B=255,A=255))
		ColorScale[3]=(RelativeTime=0.3607140,Color=(R=0,G=0,B=128,A=255))
		ColorScale[4]=(RelativeTime=0.4571430,Color=(R=128,G=192,B=255,A=255))
		ColorScale[5]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.1120000
		MaxParticles=20
		DetailMode=2
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
		SizeScale[1]=(RelativeTime=0.1400000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
		StartSizeRange=(X=(Min=30.0000000,Max=50.0000000),Y=(Min=30.0000000,Max=50.0000000),Z=(Min=30.0000000,Max=50.0000000))
		InitialParticlesPerSecond=150.0000000
		Texture=Texture'EpicParticles.Beams.HotBolt04aw'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.8000000,Max=0.8000000)
		StartVelocityRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=-1.0000000,Max=1.0000000),Z=(Min=-0.5000000,Max=0.7000000))
	end object
	Emitters[2]=BeamEmitter0
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_SuperchargeExplode.SpriteEmitter84'
	begin object name="SpriteEmitter84" class=Engine.SpriteEmitter
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
		Opacity=0.5400000
		FadeOutStartTime=0.1890000
		FadeInEndTime=0.0385000
		MaxParticles=12
		StartLocationRange=(X=(Min=-75.0000000,Max=75.0000000),Y=(Min=-75.0000000,Max=75.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2500000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
		StartSizeRange=(X=(Min=150.0000000,Max=200.0000000),Y=(Min=150.0000000,Max=200.0000000),Z=(Min=150.0000000,Max=200.0000000))
		InitialParticlesPerSecond=40.0000000
		DrawStyle=6
		Texture=Texture'BWBP_SKC_Tex.LS14.EMPProj'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.6500000,Max=0.6500000)
	end object
	Emitters[3]=SpriteEmitter84
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_SuperchargeExplode.SpriteEmitter85'
	begin object name="SpriteEmitter85" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=255))
		Opacity=0.4100000
		FadeOutStartTime=1.2300000
		FadeInEndTime=0.5400000
		MaxParticles=15
		StartLocationRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=35.0000000,Max=50.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0750000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=75.0000000,Max=100.0000000),Y=(Min=75.0000000,Max=100.0000000),Z=(Min=75.0000000,Max=100.0000000))
		InitialParticlesPerSecond=40.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke4'
		LifetimeRange=(Min=3.0000000,Max=3.0000000)
		StartVelocityRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=75.0000000,Max=100.0000000))
		VelocityLossRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.5000000))
	end object
	Emitters[4]=SpriteEmitter85
	// Reference: SparkEmitter'BWBP_SKC_Pro.IE_SuperchargeExplode.SparkEmitter83'
	begin object name="SparkEmitter83" class=Engine.SparkEmitter
		LineSegmentsRange=(Min=0.1000000,Max=0.2000000)
		TimeBetweenSegmentsRange=(Min=0.0500000,Max=0.1500000)
		FadeOut=true
		RespawnDeadParticles=false
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-500.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.4000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		FadeOutStartTime=0.4400000
		MaxParticles=100
		StartLocationRange=(X=(Min=-25.0000000,Max=25.0000000),Y=(Min=-25.0000000,Max=25.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=350.0000000,Max=350.0000000),Y=(Min=350.0000000,Max=350.0000000),Z=(Min=350.0000000,Max=350.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BWBP_SKC_Tex.BFG.BFGProj2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=-1000.0000000,Max=1000.0000000),Y=(Min=-1000.0000000,Max=1000.0000000),Z=(Min=0.0000000,Max=1000.0000000))
	end object
	Emitters[5]=SparkEmitter83
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_SuperchargeExplode.SpriteEmitter86'
	begin object name="SpriteEmitter86" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.1100000
		FadeOutStartTime=0.2760000
		MaxParticles=5
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=25.0000000)
		StartLocationRange=(X=(Min=-75.0000000,Max=75.0000000),Y=(Min=-75.0000000,Max=75.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.2500000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		InitialParticlesPerSecond=100.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
	end object
	Emitters[6]=SpriteEmitter86
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_SuperchargeExplode.SpriteEmitter87'
	begin object name="SpriteEmitter87" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-600.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.4571430,Color=(R=128,G=128,B=255,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.0000000,Max=0.4000000),Y=(Min=2.0000000,Max=0.4000000),Z=(Min=0.0000000,Max=0.4000000))
		FadeOutStartTime=0.0280000
		MaxParticles=20
		StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=20.0000000,Max=30.0000000),Y=(Min=20.0000000,Max=30.0000000),Z=(Min=20.0000000,Max=30.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1'
		TextureUSubdivisions=3
		TextureVSubdivisions=3
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.3500000,Max=0.3500000)
		StartVelocityRange=(X=(Min=50.0000000,Max=500.0000000),Y=(Min=-250.0000000,Max=250.0000000),Z=(Min=-50.0000000,Max=350.0000000))
	end object
	Emitters[7]=SpriteEmitter87
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_SuperchargeExplode.SpriteEmitter89'
	begin object name="SpriteEmitter89" class=Engine.SpriteEmitter
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
		ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
		Opacity=0.4000000
		FadeOutStartTime=1.0650000
		FadeInEndTime=0.1500000
		MaxParticles=45
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.3000000)
		SizeScale[1]=(RelativeTime=0.5500000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
		StartSizeRange=(X=(Min=5.0000000,Max=5.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=20.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke4'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=20.0000000,Max=30.0000000))
		VelocityLossRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	end object
	Emitters[8]=SpriteEmitter89
	// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_SuperchargeExplode.SpriteEmitter91'
	begin object name="SpriteEmitter91" class=Engine.SpriteEmitter
		UseDirectionAs=3
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.1714290,Color=(R=255,G=255,B=255,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.0240000
		FadeInEndTime=0.0240000
		CoordinateSystem=1
		MaxParticles=1
		DetailMode=1
		StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
		SizeScale[1]=(RelativeTime=0.6100000,RelativeSize=0.8000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=600.0000000,Max=600.0000000),Y=(Min=600.0000000,Max=600.0000000),Z=(Min=600.0000000,Max=600.0000000))
		InitialParticlesPerSecond=8.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.ElectroShock'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
		StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[9]=SpriteEmitter91
	// Reference: BeamEmitter'BWBP_SKC_Pro.IE_SuperchargeExplode.BeamEmitter7'
	begin object name="BeamEmitter7" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=250.0000000,Max=250.0000000)
		DetermineEndPointBy=1
		LowFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
		HighFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.3000000,Color=(R=255,G=64,B=64,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
		ColorMultiplierRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
		FadeOutStartTime=0.2160000
		CoordinateSystem=1
		MaxParticles=5
		DetailMode=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=20.0000000,Max=35.0000000),Y=(Min=20.0000000,Max=35.0000000),Z=(Min=20.0000000,Max=35.0000000))
		InitialParticlesPerSecond=20.0000000
		Texture=Texture'EpicParticles.Beams.HotBolt04aw'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=3.0000000,Max=3.0000000)
		StartVelocityRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=-4.0000000,Max=4.0000000),Z=(Min=-4.0000000,Max=4.0000000))
	end object
	Emitters[10]=BeamEmitter7
	// Reference: BeamEmitter'BWBP_SKC_Pro.IE_SuperchargeExplode.BeamEmitter8'
	begin object name="BeamEmitter8" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=250.0000000,Max=250.0000000)
		DetermineEndPointBy=1
		LowFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
		HighFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.3000000,Color=(R=255,G=64,B=64,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
		FadeOutStartTime=0.2160000
		CoordinateSystem=1
		MaxParticles=3
		DetailMode=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=20.0000000,Max=35.0000000),Y=(Min=20.0000000,Max=35.0000000),Z=(Min=20.0000000,Max=35.0000000))
		InitialParticlesPerSecond=20.0000000
		Texture=Texture'EpicParticles.Beams.HotBolt04aw'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=3.8000000,Max=3.8000000)
		StartVelocityRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=-4.0000000,Max=4.0000000),Z=(Min=-4.0000000,Max=4.0000000))
	end object
	Emitters[11]=BeamEmitter8
	AutoDestroy=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_SuperchargeExplode.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseDirectionAs=4
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
	StartSizeRange=(X=(Min=1200.0000000,Max=1200.0000000),Y=(Min=1200.0000000,Max=1200.0000000),Z=(Min=1200.0000000,Max=1200.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.ElectroShock'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_SuperchargeExplode.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.1700000
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
	SizeScale[1]=(RelativeTime=0.2800000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.8000000)
	StartSizeRange=(X=(Min=250.0000000,Max=250.0000000),Y=(Min=250.0000000,Max=250.0000000),Z=(Min=250.0000000,Max=250.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
// Reference: BeamEmitter'BWBP_SKC_Pro.IE_SuperchargeExplode.BeamEmitter0'
begin object name="BeamEmitter0" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=300.0000000,Max=500.0000000)
	DetermineEndPointBy=1
	LowFrequencyNoiseRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
	HighFrequencyNoiseRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
	HighFrequencyPoints=8
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.1571430,Color=(R=0,G=64,B=128,A=255))
	ColorScale[2]=(RelativeTime=0.2607140,Color=(R=192,G=224,B=255,A=255))
	ColorScale[3]=(RelativeTime=0.3607140,Color=(R=0,G=0,B=128,A=255))
	ColorScale[4]=(RelativeTime=0.4571430,Color=(R=128,G=192,B=255,A=255))
	ColorScale[5]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.1120000
	MaxParticles=20
	DetailMode=2
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
	SizeScale[1]=(RelativeTime=0.1400000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
	StartSizeRange=(X=(Min=30.0000000,Max=50.0000000),Y=(Min=30.0000000,Max=50.0000000),Z=(Min=30.0000000,Max=50.0000000))
	InitialParticlesPerSecond=150.0000000
	Texture=Texture'EpicParticles.Beams.HotBolt04aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.8000000,Max=0.8000000)
	StartVelocityRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=-1.0000000,Max=1.0000000),Z=(Min=-0.5000000,Max=0.7000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_SuperchargeExplode.SpriteEmitter84'
begin object name="SpriteEmitter84" class=Engine.SpriteEmitter
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
	Opacity=0.5400000
	FadeOutStartTime=0.1890000
	FadeInEndTime=0.0385000
	MaxParticles=12
	StartLocationRange=(X=(Min=-75.0000000,Max=75.0000000),Y=(Min=-75.0000000,Max=75.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2500000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
	StartSizeRange=(X=(Min=150.0000000,Max=200.0000000),Y=(Min=150.0000000,Max=200.0000000),Z=(Min=150.0000000,Max=200.0000000))
	InitialParticlesPerSecond=40.0000000
	DrawStyle=6
	Texture=Texture'BWBP_SKC_Tex.LS14.EMPProj'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.6500000,Max=0.6500000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_SuperchargeExplode.SpriteEmitter85'
begin object name="SpriteEmitter85" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=255))
	Opacity=0.4100000
	FadeOutStartTime=1.2300000
	FadeInEndTime=0.5400000
	MaxParticles=15
	StartLocationRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=35.0000000,Max=50.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0750000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=75.0000000,Max=100.0000000),Y=(Min=75.0000000,Max=100.0000000),Z=(Min=75.0000000,Max=100.0000000))
	InitialParticlesPerSecond=40.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke4'
	LifetimeRange=(Min=3.0000000,Max=3.0000000)
	StartVelocityRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=75.0000000,Max=100.0000000))
	VelocityLossRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.5000000))
end object
// Reference: SparkEmitter'BWBP_SKC_Pro.IE_SuperchargeExplode.SparkEmitter83'
begin object name="SparkEmitter83" class=Engine.SparkEmitter
	LineSegmentsRange=(Min=0.1000000,Max=0.2000000)
	TimeBetweenSegmentsRange=(Min=0.0500000,Max=0.1500000)
	FadeOut=true
	RespawnDeadParticles=false
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-500.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.4000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	FadeOutStartTime=0.4400000
	MaxParticles=100
	StartLocationRange=(X=(Min=-25.0000000,Max=25.0000000),Y=(Min=-25.0000000,Max=25.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=350.0000000,Max=350.0000000),Y=(Min=350.0000000,Max=350.0000000),Z=(Min=350.0000000,Max=350.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BWBP_SKC_Tex.BFG.BFGProj2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=-1000.0000000,Max=1000.0000000),Y=(Min=-1000.0000000,Max=1000.0000000),Z=(Min=0.0000000,Max=1000.0000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_SuperchargeExplode.SpriteEmitter86'
begin object name="SpriteEmitter86" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.1100000
	FadeOutStartTime=0.2760000
	MaxParticles=5
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=25.0000000)
	StartLocationRange=(X=(Min=-75.0000000,Max=75.0000000),Y=(Min=-75.0000000,Max=75.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.2500000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	InitialParticlesPerSecond=100.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_SuperchargeExplode.SpriteEmitter87'
begin object name="SpriteEmitter87" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-600.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.4571430,Color=(R=128,G=128,B=255,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.0000000,Max=0.4000000),Y=(Min=2.0000000,Max=0.4000000),Z=(Min=0.0000000,Max=0.4000000))
	FadeOutStartTime=0.0280000
	MaxParticles=20
	StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=20.0000000,Max=30.0000000),Y=(Min=20.0000000,Max=30.0000000),Z=(Min=20.0000000,Max=30.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1'
	TextureUSubdivisions=3
	TextureVSubdivisions=3
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.3500000,Max=0.3500000)
	StartVelocityRange=(X=(Min=50.0000000,Max=500.0000000),Y=(Min=-250.0000000,Max=250.0000000),Z=(Min=-50.0000000,Max=350.0000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_SuperchargeExplode.SpriteEmitter89'
begin object name="SpriteEmitter89" class=Engine.SpriteEmitter
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
	ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	Opacity=0.4000000
	FadeOutStartTime=1.0650000
	FadeInEndTime=0.1500000
	MaxParticles=45
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.3000000)
	SizeScale[1]=(RelativeTime=0.5500000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
	StartSizeRange=(X=(Min=5.0000000,Max=5.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=20.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke4'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=20.0000000,Max=30.0000000))
	VelocityLossRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.IE_SuperchargeExplode.SpriteEmitter91'
begin object name="SpriteEmitter91" class=Engine.SpriteEmitter
	UseDirectionAs=3
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.1714290,Color=(R=255,G=255,B=255,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.0240000
	FadeInEndTime=0.0240000
	CoordinateSystem=1
	MaxParticles=1
	DetailMode=1
	StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
	SizeScale[1]=(RelativeTime=0.6100000,RelativeSize=0.8000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=600.0000000,Max=600.0000000),Y=(Min=600.0000000,Max=600.0000000),Z=(Min=600.0000000,Max=600.0000000))
	InitialParticlesPerSecond=8.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.ElectroShock'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
	StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: BeamEmitter'BWBP_SKC_Pro.IE_SuperchargeExplode.BeamEmitter7'
begin object name="BeamEmitter7" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=250.0000000,Max=250.0000000)
	DetermineEndPointBy=1
	LowFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
	HighFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.3000000,Color=(R=255,G=64,B=64,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
	ColorMultiplierRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
	FadeOutStartTime=0.2160000
	CoordinateSystem=1
	MaxParticles=5
	DetailMode=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=20.0000000,Max=35.0000000),Y=(Min=20.0000000,Max=35.0000000),Z=(Min=20.0000000,Max=35.0000000))
	InitialParticlesPerSecond=20.0000000
	Texture=Texture'EpicParticles.Beams.HotBolt04aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=3.0000000,Max=3.0000000)
	StartVelocityRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=-4.0000000,Max=4.0000000),Z=(Min=-4.0000000,Max=4.0000000))
end object
// Reference: BeamEmitter'BWBP_SKC_Pro.IE_SuperchargeExplode.BeamEmitter8'
begin object name="BeamEmitter8" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=250.0000000,Max=250.0000000)
	DetermineEndPointBy=1
	LowFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
	HighFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.3000000,Color=(R=255,G=64,B=64,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
	FadeOutStartTime=0.2160000
	CoordinateSystem=1
	MaxParticles=3
	DetailMode=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=20.0000000,Max=35.0000000),Y=(Min=20.0000000,Max=35.0000000),Z=(Min=20.0000000,Max=35.0000000))
	InitialParticlesPerSecond=20.0000000
	Texture=Texture'EpicParticles.Beams.HotBolt04aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=3.8000000,Max=3.8000000)
	StartVelocityRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=-4.0000000,Max=4.0000000),Z=(Min=-4.0000000,Max=4.0000000))
end object
