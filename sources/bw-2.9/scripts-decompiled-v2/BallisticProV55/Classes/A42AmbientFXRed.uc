class A42AmbientFXRed extends BallisticEmitter;

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x3E
	if(WeaponAttachment(Owner) == none)
	{
		Emitters[7].Disabled = true;
		Emitters[8].Disabled = true;
	}
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'BallisticProV55.A42AmbientFXRed.FrontLeftVent'
	begin object name="FrontLeftVent" class=Engine.SpriteEmitter
		ProjectionNormal=(X=0.0000000,Y=-1.0000000,Z=0.0000000)
		FadeOut=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-20.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=8.0000000,Max=0.8000000),Y=(Min=0.2000000,Max=0.4000000),Z=(Min=0.0000000,Max=0.2000000))
		Opacity=0.5000000
		FadeOutStartTime=0.3500000
		CoordinateSystem=1
		StartLocationOffset=(X=-61.0000000,Y=-25.0000000,Z=-2.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
		StartSizeRange=(X=(Min=4.0000000,Max=8.0000000),Y=(Min=4.0000000,Max=8.0000000),Z=(Min=4.0000000,Max=8.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-30.0000000,Max=-30.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[0]=FrontLeftVent
	// Reference: SpriteEmitter'BallisticProV55.A42AmbientFXRed.FrontRightVent'
	begin object name="FrontRightVent" class=Engine.SpriteEmitter
		ProjectionNormal=(X=0.0000000,Y=-1.0000000,Z=0.0000000)
		FadeOut=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-20.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=8.0000000,Max=0.8000000),Y=(Min=0.2000000,Max=0.4000000),Z=(Min=0.0000000,Max=0.2000000))
		Opacity=0.5000000
		FadeOutStartTime=0.3500000
		CoordinateSystem=1
		DetailMode=2
		StartLocationOffset=(X=-61.0000000,Y=25.0000000,Z=-2.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
		StartSizeRange=(X=(Min=4.0000000,Max=8.0000000),Y=(Min=4.0000000,Max=8.0000000),Z=(Min=4.0000000,Max=8.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[1]=FrontRightVent
	// Reference: SpriteEmitter'BallisticProV55.A42AmbientFXRed.RearLeftVent'
	begin object name="RearLeftVent" class=Engine.SpriteEmitter
		ProjectionNormal=(X=0.0000000,Y=-1.0000000,Z=0.0000000)
		FadeOut=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-20.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=8.0000000,Max=0.8000000),Y=(Min=0.2000000,Max=0.4000000),Z=(Min=0.0000000,Max=0.2000000))
		Opacity=0.5000000
		FadeOutStartTime=0.3500000
		CoordinateSystem=1
		StartLocationOffset=(X=-144.0000000,Y=-20.0000000,Z=-22.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=6.0000000,Max=10.0000000),Y=(Min=6.0000000,Max=10.0000000),Z=(Min=6.0000000,Max=10.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-30.0000000,Max=-30.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[2]=RearLeftVent
	// Reference: SpriteEmitter'BallisticProV55.A42AmbientFXRed.RearRightVent'
	begin object name="RearRightVent" class=Engine.SpriteEmitter
		ProjectionNormal=(X=0.0000000,Y=-1.0000000,Z=0.0000000)
		FadeOut=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-20.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=8.0000000,Max=0.8000000),Y=(Min=0.2000000,Max=0.4000000),Z=(Min=0.0000000,Max=0.2000000))
		Opacity=0.5000000
		FadeOutStartTime=0.3500000
		CoordinateSystem=1
		DetailMode=2
		StartLocationOffset=(X=-144.0000000,Y=20.0000000,Z=-22.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=6.0000000,Max=10.0000000),Y=(Min=6.0000000,Max=10.0000000),Z=(Min=6.0000000,Max=10.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[3]=RearRightVent
	// Reference: SpriteEmitter'BallisticProV55.A42AmbientFXRed.FrontBatteryGlow'
	begin object name="FrontBatteryGlow" class=Engine.SpriteEmitter
		UseDirectionAs=4
		ProjectionNormal=(X=-1.0000000,Y=0.0000000,Z=0.0000000)
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=8.0000000,Max=0.8000000),Y=(Min=0.3000000,Max=0.3000000),Z=(Min=0.1000000,Max=0.1000000))
		CoordinateSystem=1
		MaxParticles=1
		DetailMode=2
		StartLocationOffset=(X=-198.5000000,Y=0.0000000,Z=7.0000000)
		StartSizeRange=(X=(Min=33.0000000,Max=33.0000000),Y=(Min=33.0000000,Max=33.0000000),Z=(Min=33.0000000,Max=33.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[4]=FrontBatteryGlow
	// Reference: SpriteEmitter'BallisticProV55.A42AmbientFXRed.MiddleBatteryGlow'
	begin object name="MiddleBatteryGlow" class=Engine.SpriteEmitter
		UseDirectionAs=4
		ProjectionNormal=(X=-1.0000000,Y=0.0000000,Z=0.0000000)
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=8.0000000,Max=0.8000000),Y=(Min=0.3000000,Max=0.3000000),Z=(Min=0.1000000,Max=0.1000000))
		CoordinateSystem=1
		MaxParticles=1
		DetailMode=2
		StartLocationOffset=(X=-207.5000000,Y=0.0000000,Z=7.0000000)
		StartSizeRange=(X=(Min=31.0000000,Max=31.0000000),Y=(Min=31.0000000,Max=31.0000000),Z=(Min=31.0000000,Max=31.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[5]=MiddleBatteryGlow
	// Reference: SpriteEmitter'BallisticProV55.A42AmbientFXRed.RearBatteryGlow'
	begin object name="RearBatteryGlow" class=Engine.SpriteEmitter
		UseDirectionAs=4
		ProjectionNormal=(X=-1.0000000,Y=0.0000000,Z=0.0000000)
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=8.0000000,Max=0.8000000),Y=(Min=0.3000000,Max=0.3000000),Z=(Min=0.1000000,Max=0.1000000))
		CoordinateSystem=1
		MaxParticles=1
		DetailMode=2
		StartLocationOffset=(X=-216.0000000,Y=0.0000000,Z=7.0000000)
		StartSizeRange=(X=(Min=30.0000000,Max=30.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=30.0000000,Max=30.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[6]=RearBatteryGlow
	// Reference: SpriteEmitter'BallisticProV55.A42AmbientFXRed.RearShockWave'
	begin object name="RearShockWave" class=Engine.SpriteEmitter
		UseDirectionAs=4
		ProjectionNormal=(X=-1.0000000,Y=0.0000000,Z=0.0000000)
		UseColorScale=true
		FadeOut=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.1000000,Color=(R=255,G=0,B=64,A=255))
		ColorScale[2]=(RelativeTime=0.1464290,Color=(R=0,G=0,B=0,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=255))
		ColorMultiplierRange=(X=(Min=8.0000000,Max=0.8000000),Y=(Min=2.0000000,Max=0.4000000),Z=(Min=0.0000000,Max=0.2000000))
		FadeOutStartTime=0.4400000
		CoordinateSystem=1
		MaxParticles=15
		DetailMode=2
		StartLocationOffset=(X=-225.0000000,Y=0.0000000,Z=7.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=0.2700000,RelativeSize=2.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=8.0000000,Max=8.0000000),Y=(Min=8.0000000,Max=8.0000000),Z=(Min=8.0000000,Max=8.0000000))
		InitialParticlesPerSecond=15.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.Shockwave'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=3.0000000,Max=3.0000000)
		StartVelocityRange=(X=(Min=-150.0000000,Max=-100.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[7]=RearShockWave
	// Reference: SpriteEmitter'BallisticProV55.A42AmbientFXRed.Spark1'
	begin object name="Spark1" class=Engine.SpriteEmitter
		UseDirectionAs=4
		ProjectionNormal=(X=0.0000000,Y=-1.0000000,Z=-0.1000000)
		FadeIn=true
		SpinParticles=true
		UseRegularSizeScale=false
		UniformSize=true
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=255,B=0,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=255,B=0,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
		FadeOutStartTime=0.8000000
		FadeInEndTime=0.0560000
		CoordinateSystem=1
		MaxParticles=5
		DetailMode=2
		StartLocationOffset=(X=-125.0000000,Y=-19.5000000,Z=-8.0000000)
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-3.0000000,Max=7.0000000))
		StartSpinRange=(X=(Min=0.7500000,Max=0.7500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=6.0000000,Max=14.0000000),Y=(Min=6.0000000,Max=14.0000000),Z=(Min=6.0000000,Max=14.0000000))
		InitialParticlesPerSecond=400.0000000
		Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.8000000,Max=0.8000000)
		StartVelocityRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[8]=Spark1
	// Reference: SpriteEmitter'BallisticProV55.A42AmbientFXRed.Spark2'
	begin object name="Spark2" class=Engine.SpriteEmitter
		UseDirectionAs=4
		ProjectionNormal=(X=0.0000000,Y=-1.0000000,Z=-0.4000000)
		FadeIn=true
		SpinParticles=true
		UseRegularSizeScale=false
		UniformSize=true
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=255,B=0,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=255,B=0,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
		FadeOutStartTime=0.8000000
		FadeInEndTime=0.0560000
		CoordinateSystem=1
		MaxParticles=5
		DetailMode=2
		StartLocationOffset=(X=-125.0000000,Y=-17.0000000,Z=-8.0000000)
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-9.0000000,Max=-4.0000000))
		StartSpinRange=(X=(Min=0.7500000,Max=0.7500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=6.0000000,Max=14.0000000),Y=(Min=6.0000000,Max=14.0000000),Z=(Min=6.0000000,Max=14.0000000))
		InitialParticlesPerSecond=400.0000000
		Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.8000000,Max=0.8000000)
		StartVelocityRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[9]=Spark2
	// Reference: SpriteEmitter'BallisticProV55.A42AmbientFXRed.Spark3'
	begin object name="Spark3" class=Engine.SpriteEmitter
		UseDirectionAs=4
		ProjectionNormal=(X=0.0000000,Y=1.0000000,Z=-0.1000000)
		FadeIn=true
		SpinParticles=true
		UseRegularSizeScale=false
		UniformSize=true
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=255,B=0,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=255,B=0,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
		FadeOutStartTime=0.8000000
		FadeInEndTime=0.0560000
		CoordinateSystem=1
		MaxParticles=5
		DetailMode=2
		StartLocationOffset=(X=-125.0000000,Y=19.5000000,Z=-8.0000000)
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-3.0000000,Max=7.0000000))
		StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=6.0000000,Max=14.0000000),Y=(Min=6.0000000,Max=14.0000000),Z=(Min=6.0000000,Max=14.0000000))
		InitialParticlesPerSecond=400.0000000
		Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.8000000,Max=0.8000000)
		StartVelocityRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[10]=Spark3
	// Reference: SpriteEmitter'BallisticProV55.A42AmbientFXRed.Spark4'
	begin object name="Spark4" class=Engine.SpriteEmitter
		UseDirectionAs=4
		ProjectionNormal=(X=0.0000000,Y=1.0000000,Z=-0.4000000)
		FadeIn=true
		SpinParticles=true
		UseRegularSizeScale=false
		UniformSize=true
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=255,B=0,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=255,B=0,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
		FadeOutStartTime=0.8000000
		FadeInEndTime=0.0560000
		CoordinateSystem=1
		MaxParticles=5
		DetailMode=2
		StartLocationOffset=(X=-125.0000000,Y=17.0000000,Z=-8.0000000)
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-9.0000000,Max=-4.0000000))
		StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=6.0000000,Max=14.0000000),Y=(Min=6.0000000,Max=14.0000000),Z=(Min=6.0000000,Max=14.0000000))
		InitialParticlesPerSecond=400.0000000
		Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.8000000,Max=0.8000000)
		StartVelocityRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[11]=Spark4
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.A42AmbientFXRed.FrontLeftVent'
begin object name="FrontLeftVent" class=Engine.SpriteEmitter
	ProjectionNormal=(X=0.0000000,Y=-1.0000000,Z=0.0000000)
	FadeOut=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-20.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=8.0000000,Max=0.8000000),Y=(Min=0.2000000,Max=0.4000000),Z=(Min=0.0000000,Max=0.2000000))
	Opacity=0.5000000
	FadeOutStartTime=0.3500000
	CoordinateSystem=1
	StartLocationOffset=(X=-61.0000000,Y=-25.0000000,Z=-2.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
	StartSizeRange=(X=(Min=4.0000000,Max=8.0000000),Y=(Min=4.0000000,Max=8.0000000),Z=(Min=4.0000000,Max=8.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-30.0000000,Max=-30.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.A42AmbientFXRed.FrontRightVent'
begin object name="FrontRightVent" class=Engine.SpriteEmitter
	ProjectionNormal=(X=0.0000000,Y=-1.0000000,Z=0.0000000)
	FadeOut=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-20.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=8.0000000,Max=0.8000000),Y=(Min=0.2000000,Max=0.4000000),Z=(Min=0.0000000,Max=0.2000000))
	Opacity=0.5000000
	FadeOutStartTime=0.3500000
	CoordinateSystem=1
	DetailMode=2
	StartLocationOffset=(X=-61.0000000,Y=25.0000000,Z=-2.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
	StartSizeRange=(X=(Min=4.0000000,Max=8.0000000),Y=(Min=4.0000000,Max=8.0000000),Z=(Min=4.0000000,Max=8.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.A42AmbientFXRed.RearLeftVent'
begin object name="RearLeftVent" class=Engine.SpriteEmitter
	ProjectionNormal=(X=0.0000000,Y=-1.0000000,Z=0.0000000)
	FadeOut=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-20.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=8.0000000,Max=0.8000000),Y=(Min=0.2000000,Max=0.4000000),Z=(Min=0.0000000,Max=0.2000000))
	Opacity=0.5000000
	FadeOutStartTime=0.3500000
	CoordinateSystem=1
	StartLocationOffset=(X=-144.0000000,Y=-20.0000000,Z=-22.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=6.0000000,Max=10.0000000),Y=(Min=6.0000000,Max=10.0000000),Z=(Min=6.0000000,Max=10.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-30.0000000,Max=-30.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.A42AmbientFXRed.RearRightVent'
begin object name="RearRightVent" class=Engine.SpriteEmitter
	ProjectionNormal=(X=0.0000000,Y=-1.0000000,Z=0.0000000)
	FadeOut=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-20.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=8.0000000,Max=0.8000000),Y=(Min=0.2000000,Max=0.4000000),Z=(Min=0.0000000,Max=0.2000000))
	Opacity=0.5000000
	FadeOutStartTime=0.3500000
	CoordinateSystem=1
	DetailMode=2
	StartLocationOffset=(X=-144.0000000,Y=20.0000000,Z=-22.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=6.0000000,Max=10.0000000),Y=(Min=6.0000000,Max=10.0000000),Z=(Min=6.0000000,Max=10.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.A42AmbientFXRed.FrontBatteryGlow'
begin object name="FrontBatteryGlow" class=Engine.SpriteEmitter
	UseDirectionAs=4
	ProjectionNormal=(X=-1.0000000,Y=0.0000000,Z=0.0000000)
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=8.0000000,Max=0.8000000),Y=(Min=0.3000000,Max=0.3000000),Z=(Min=0.1000000,Max=0.1000000))
	CoordinateSystem=1
	MaxParticles=1
	DetailMode=2
	StartLocationOffset=(X=-198.5000000,Y=0.0000000,Z=7.0000000)
	StartSizeRange=(X=(Min=33.0000000,Max=33.0000000),Y=(Min=33.0000000,Max=33.0000000),Z=(Min=33.0000000,Max=33.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
// Reference: SpriteEmitter'BallisticProV55.A42AmbientFXRed.MiddleBatteryGlow'
begin object name="MiddleBatteryGlow" class=Engine.SpriteEmitter
	UseDirectionAs=4
	ProjectionNormal=(X=-1.0000000,Y=0.0000000,Z=0.0000000)
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=8.0000000,Max=0.8000000),Y=(Min=0.3000000,Max=0.3000000),Z=(Min=0.1000000,Max=0.1000000))
	CoordinateSystem=1
	MaxParticles=1
	DetailMode=2
	StartLocationOffset=(X=-207.5000000,Y=0.0000000,Z=7.0000000)
	StartSizeRange=(X=(Min=31.0000000,Max=31.0000000),Y=(Min=31.0000000,Max=31.0000000),Z=(Min=31.0000000,Max=31.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
// Reference: SpriteEmitter'BallisticProV55.A42AmbientFXRed.RearBatteryGlow'
begin object name="RearBatteryGlow" class=Engine.SpriteEmitter
	UseDirectionAs=4
	ProjectionNormal=(X=-1.0000000,Y=0.0000000,Z=0.0000000)
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=8.0000000,Max=0.8000000),Y=(Min=0.3000000,Max=0.3000000),Z=(Min=0.1000000,Max=0.1000000))
	CoordinateSystem=1
	MaxParticles=1
	DetailMode=2
	StartLocationOffset=(X=-216.0000000,Y=0.0000000,Z=7.0000000)
	StartSizeRange=(X=(Min=30.0000000,Max=30.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=30.0000000,Max=30.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
// Reference: SpriteEmitter'BallisticProV55.A42AmbientFXRed.RearShockWave'
begin object name="RearShockWave" class=Engine.SpriteEmitter
	UseDirectionAs=4
	ProjectionNormal=(X=-1.0000000,Y=0.0000000,Z=0.0000000)
	UseColorScale=true
	FadeOut=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.1000000,Color=(R=255,G=0,B=64,A=255))
	ColorScale[2]=(RelativeTime=0.1464290,Color=(R=0,G=0,B=0,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=255))
	ColorMultiplierRange=(X=(Min=8.0000000,Max=0.8000000),Y=(Min=2.0000000,Max=0.4000000),Z=(Min=0.0000000,Max=0.2000000))
	FadeOutStartTime=0.4400000
	CoordinateSystem=1
	MaxParticles=15
	DetailMode=2
	StartLocationOffset=(X=-225.0000000,Y=0.0000000,Z=7.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=0.2700000,RelativeSize=2.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=8.0000000,Max=8.0000000),Y=(Min=8.0000000,Max=8.0000000),Z=(Min=8.0000000,Max=8.0000000))
	InitialParticlesPerSecond=15.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.Shockwave'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=3.0000000,Max=3.0000000)
	StartVelocityRange=(X=(Min=-150.0000000,Max=-100.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.A42AmbientFXRed.Spark1'
begin object name="Spark1" class=Engine.SpriteEmitter
	UseDirectionAs=4
	ProjectionNormal=(X=0.0000000,Y=-1.0000000,Z=-0.1000000)
	FadeIn=true
	SpinParticles=true
	UseRegularSizeScale=false
	UniformSize=true
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=255,B=0,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=255,B=0,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	FadeOutStartTime=0.8000000
	FadeInEndTime=0.0560000
	CoordinateSystem=1
	MaxParticles=5
	DetailMode=2
	StartLocationOffset=(X=-125.0000000,Y=-19.5000000,Z=-8.0000000)
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-3.0000000,Max=7.0000000))
	StartSpinRange=(X=(Min=0.7500000,Max=0.7500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=6.0000000,Max=14.0000000),Y=(Min=6.0000000,Max=14.0000000),Z=(Min=6.0000000,Max=14.0000000))
	InitialParticlesPerSecond=400.0000000
	Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.8000000,Max=0.8000000)
	StartVelocityRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.A42AmbientFXRed.Spark2'
begin object name="Spark2" class=Engine.SpriteEmitter
	UseDirectionAs=4
	ProjectionNormal=(X=0.0000000,Y=-1.0000000,Z=-0.4000000)
	FadeIn=true
	SpinParticles=true
	UseRegularSizeScale=false
	UniformSize=true
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=255,B=0,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=255,B=0,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	FadeOutStartTime=0.8000000
	FadeInEndTime=0.0560000
	CoordinateSystem=1
	MaxParticles=5
	DetailMode=2
	StartLocationOffset=(X=-125.0000000,Y=-17.0000000,Z=-8.0000000)
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-9.0000000,Max=-4.0000000))
	StartSpinRange=(X=(Min=0.7500000,Max=0.7500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=6.0000000,Max=14.0000000),Y=(Min=6.0000000,Max=14.0000000),Z=(Min=6.0000000,Max=14.0000000))
	InitialParticlesPerSecond=400.0000000
	Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.8000000,Max=0.8000000)
	StartVelocityRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.A42AmbientFXRed.Spark3'
begin object name="Spark3" class=Engine.SpriteEmitter
	UseDirectionAs=4
	ProjectionNormal=(X=0.0000000,Y=1.0000000,Z=-0.1000000)
	FadeIn=true
	SpinParticles=true
	UseRegularSizeScale=false
	UniformSize=true
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=255,B=0,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=255,B=0,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	FadeOutStartTime=0.8000000
	FadeInEndTime=0.0560000
	CoordinateSystem=1
	MaxParticles=5
	DetailMode=2
	StartLocationOffset=(X=-125.0000000,Y=19.5000000,Z=-8.0000000)
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-3.0000000,Max=7.0000000))
	StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=6.0000000,Max=14.0000000),Y=(Min=6.0000000,Max=14.0000000),Z=(Min=6.0000000,Max=14.0000000))
	InitialParticlesPerSecond=400.0000000
	Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.8000000,Max=0.8000000)
	StartVelocityRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.A42AmbientFXRed.Spark4'
begin object name="Spark4" class=Engine.SpriteEmitter
	UseDirectionAs=4
	ProjectionNormal=(X=0.0000000,Y=1.0000000,Z=-0.4000000)
	FadeIn=true
	SpinParticles=true
	UseRegularSizeScale=false
	UniformSize=true
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=255,B=0,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=255,B=0,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	FadeOutStartTime=0.8000000
	FadeInEndTime=0.0560000
	CoordinateSystem=1
	MaxParticles=5
	DetailMode=2
	StartLocationOffset=(X=-125.0000000,Y=17.0000000,Z=-8.0000000)
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-9.0000000,Max=-4.0000000))
	StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=6.0000000,Max=14.0000000),Y=(Min=6.0000000,Max=14.0000000),Z=(Min=6.0000000,Max=14.0000000))
	InitialParticlesPerSecond=400.0000000
	Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.8000000,Max=0.8000000)
	StartVelocityRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
