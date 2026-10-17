class BOGPFlareTrail extends BallisticEmitter;

simulated function SetupColor(int TeamNum)
{
	// End:0x0D
	if(TeamNum != 1)
	{
		return;
	}
	Emitters[0].ColorMultiplierRange.X.Min = 0.5000000;
	Emitters[0].ColorMultiplierRange.X.Max = 0.5000000;
	Emitters[0].ColorMultiplierRange.Y.Max = 0.5000000;
	Emitters[0].ColorMultiplierRange.Y.Max = 0.5000000;
	Emitters[0].ColorMultiplierRange.Z.Max = 1.0000000;
	Emitters[0].ColorMultiplierRange.Z.Max = 1.0000000;
	Emitters[1].ColorMultiplierRange.X.Min = 0.7500000;
	Emitters[1].ColorMultiplierRange.X.Max = 0.7500000;
	Emitters[1].ColorMultiplierRange.Y.Max = 0.7500000;
	Emitters[1].ColorMultiplierRange.Y.Max = 0.7500000;
	Emitters[1].ColorMultiplierRange.Z.Max = 1.0000000;
	Emitters[1].ColorMultiplierRange.Z.Max = 1.0000000;
	Emitters[2].ColorMultiplierRange.X.Min = 0.6500000;
	Emitters[2].ColorMultiplierRange.X.Max = 0.6500000;
	Emitters[2].ColorMultiplierRange.Y.Max = 0.6500000;
	Emitters[2].ColorMultiplierRange.Y.Max = 0.6500000;
	Emitters[2].ColorMultiplierRange.Z.Max = 1.0000000;
	Emitters[2].ColorMultiplierRange.Z.Max = 1.0000000;
	Emitters[3].ColorMultiplierRange.X.Min = 0.6500000;
	Emitters[3].ColorMultiplierRange.X.Max = 0.6500000;
	Emitters[3].ColorMultiplierRange.Y.Max = 0.6500000;
	Emitters[3].ColorMultiplierRange.Y.Max = 0.6500000;
	Emitters[3].ColorMultiplierRange.Z.Max = 1.0000000;
	Emitters[3].ColorMultiplierRange.Z.Max = 1.0000000;
	Emitters[4].ColorMultiplierRange.X.Min = 0.3500000;
	Emitters[4].ColorMultiplierRange.X.Max = 0.3500000;
	Emitters[4].ColorMultiplierRange.Y.Max = 0.3500000;
	Emitters[4].ColorMultiplierRange.Y.Max = 0.3500000;
	Emitters[4].ColorMultiplierRange.Z.Max = 1.0000000;
	Emitters[4].ColorMultiplierRange.Z.Max = 1.0000000;
	Emitters[5].ColorMultiplierRange.X.Min = 0.5000000;
	Emitters[5].ColorMultiplierRange.X.Max = 0.5000000;
	Emitters[5].ColorMultiplierRange.Y.Max = 0.5000000;
	Emitters[5].ColorMultiplierRange.Y.Max = 0.5000000;
	Emitters[5].ColorMultiplierRange.Z.Max = 1.0000000;
	Emitters[5].ColorMultiplierRange.Z.Max = 1.0000000;
	Emitters[6].ColorMultiplierRange.X.Min = 0.5500000;
	Emitters[6].ColorMultiplierRange.X.Max = 0.5500000;
	Emitters[6].ColorMultiplierRange.Y.Max = 0.5500000;
	Emitters[6].ColorMultiplierRange.Y.Max = 0.5500000;
	Emitters[6].ColorMultiplierRange.Z.Max = 1.0000000;
	Emitters[6].ColorMultiplierRange.Z.Max = 1.0000000;
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'BallisticProV55.BOGPFlareTrail.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
		Opacity=0.8000000
		FadeOutStartTime=0.5000000
		CoordinateSystem=1
		MaxParticles=2
		StartLocationRange=(X=(Min=-8.0000000,Max=-8.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.3000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=220.0000000,Max=260.0000000),Y=(Min=220.0000000,Max=260.0000000),Z=(Min=220.0000000,Max=260.0000000))
		InitialParticlesPerSecond=200.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[0]=SpriteEmitter0
	// Reference: SpriteEmitter'BallisticProV55.BOGPFlareTrail.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		FadeOut=true
		SpinParticles=true
		UniformSize=true
		BlendBetweenSubdivisions=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-250.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.7500000,Max=0.7500000),Z=(Min=0.7500000,Max=0.7500000))
		FadeOutStartTime=0.6000000
		CoordinateSystem=1
		MaxParticles=60
		StartLocationRange=(X=(Min=0.0000000,Max=-4.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=20.0000000,Max=50.0000000),Y=(Min=20.0000000,Max=50.0000000),Z=(Min=20.0000000,Max=50.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.BlazingSubdivide'
		TextureUSubdivisions=4
		TextureVSubdivisions=2
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=-1000.0000000,Max=-600.0000000),Y=(Min=-96.0000000,Max=96.0000000),Z=(Min=-96.0000000,Max=96.0000000))
	end object
	Emitters[1]=SpriteEmitter1
	// Reference: SpriteEmitter'BallisticProV55.BOGPFlareTrail.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		FadeOut=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=20.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.6500000,Max=0.6500000),Z=(Min=0.6500000,Max=0.6500000))
		Opacity=0.2500000
		FadeOutStartTime=1.9800000
		MaxParticles=40
		SpinsPerSecondRange=(X=(Min=0.1000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=6.0000000)
		StartSizeRange=(X=(Min=20.0000000,Max=28.0000000),Y=(Min=20.0000000,Max=28.0000000),Z=(Min=20.0000000,Max=28.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke4'
		LifetimeRange=(Min=3.0000000,Max=3.0000000)
		StartVelocityRange=(X=(Min=-8.0000000,Max=8.0000000),Y=(Min=-8.0000000,Max=8.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[2]=SpriteEmitter2
	// Reference: SpriteEmitter'BallisticProV55.BOGPFlareTrail.SpriteEmitter3'
	begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
		FadeOut=true
		SpinParticles=true
		UniformSize=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-400.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=96,G=96,B=160,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.6500000,Max=0.6500000),Z=(Min=0.6500000,Max=0.6500000))
		FadeOutStartTime=2.0000000
		MaxParticles=60
		StartSpinRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=8.0000000,Max=16.0000000),Y=(Min=8.0000000,Max=16.0000000),Z=(Min=8.0000000,Max=16.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		LifetimeRange=(Min=3.0000000,Max=3.0000000)
		StartVelocityRange=(X=(Min=-128.0000000,Max=128.0000000),Y=(Min=-128.0000000,Max=128.0000000),Z=(Min=96.0000000,Max=250.0000000))
	end object
	Emitters[3]=SpriteEmitter3
	// Reference: SpriteEmitter'BallisticProV55.BOGPFlareTrail.SpriteEmitter4'
	begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.3500000,Max=0.3500000),Z=(Min=0.3500000,Max=0.3500000))
		Opacity=0.2000000
		FadeOutStartTime=0.5000000
		CoordinateSystem=1
		MaxParticles=1
		StartLocationRange=(X=(Min=-8.0000000,Max=-8.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=900.0000000,Max=1000.0000000),Y=(Min=900.0000000,Max=1000.0000000),Z=(Min=900.0000000,Max=1000.0000000))
		InitialParticlesPerSecond=200.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareA1'
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[4]=SpriteEmitter4
	// Reference: SpriteEmitter'BallisticProV55.BOGPFlareTrail.SpriteEmitter5'
	begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
		Opacity=0.1000000
		FadeOutStartTime=0.5000000
		CoordinateSystem=1
		MaxParticles=2
		StartLocationRange=(X=(Min=-8.0000000,Max=-8.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.1500000,Max=0.1500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=400.0000000,Max=600.0000000),Y=(Min=400.0000000,Max=600.0000000),Z=(Min=400.0000000,Max=600.0000000))
		InitialParticlesPerSecond=200.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[5]=SpriteEmitter5
	// Reference: TrailEmitter'BallisticProV55.BOGPFlareTrail.TrailEmitter1'
	begin object name="TrailEmitter1" class=Engine.TrailEmitter
		TrailShadeType=4
		TrailLocation=1
		MaxPointsPerTrail=50
		DistanceThreshold=100.0000000
		PointLifeTime=6.0000000
		FadeOut=true
		FadeIn=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5500000,Max=0.5500000),Z=(Min=0.5500000,Max=0.5500000))
		Opacity=0.2000000
		FadeOutStartTime=0.4000000
		FadeInEndTime=0.2000000
		MaxParticles=3
		StartSizeRange=(X=(Min=150.0000000,Max=150.0000000),Y=(Min=75.0000000,Max=75.0000000),Z=(Min=75.0000000,Max=75.0000000))
		InitialParticlesPerSecond=500000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=30.0000000,Max=30.0000000)
	end object
	Emitters[6]=TrailEmitter1
	AutoDestroy=true
	bHardAttach=true
	bDirectional=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.BOGPFlareTrail.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	Opacity=0.8000000
	FadeOutStartTime=0.5000000
	CoordinateSystem=1
	MaxParticles=2
	StartLocationRange=(X=(Min=-8.0000000,Max=-8.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.3000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=220.0000000,Max=260.0000000),Y=(Min=220.0000000,Max=260.0000000),Z=(Min=220.0000000,Max=260.0000000))
	InitialParticlesPerSecond=200.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BallisticProV55.BOGPFlareTrail.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	FadeOut=true
	SpinParticles=true
	UniformSize=true
	BlendBetweenSubdivisions=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-250.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.7500000,Max=0.7500000),Z=(Min=0.7500000,Max=0.7500000))
	FadeOutStartTime=0.6000000
	CoordinateSystem=1
	MaxParticles=60
	StartLocationRange=(X=(Min=0.0000000,Max=-4.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=20.0000000,Max=50.0000000),Y=(Min=20.0000000,Max=50.0000000),Z=(Min=20.0000000,Max=50.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.BlazingSubdivide'
	TextureUSubdivisions=4
	TextureVSubdivisions=2
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=-1000.0000000,Max=-600.0000000),Y=(Min=-96.0000000,Max=96.0000000),Z=(Min=-96.0000000,Max=96.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.BOGPFlareTrail.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	FadeOut=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=20.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.6500000,Max=0.6500000),Z=(Min=0.6500000,Max=0.6500000))
	Opacity=0.2500000
	FadeOutStartTime=1.9800000
	MaxParticles=40
	SpinsPerSecondRange=(X=(Min=0.1000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=6.0000000)
	StartSizeRange=(X=(Min=20.0000000,Max=28.0000000),Y=(Min=20.0000000,Max=28.0000000),Z=(Min=20.0000000,Max=28.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke4'
	LifetimeRange=(Min=3.0000000,Max=3.0000000)
	StartVelocityRange=(X=(Min=-8.0000000,Max=8.0000000),Y=(Min=-8.0000000,Max=8.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.BOGPFlareTrail.SpriteEmitter3'
begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
	FadeOut=true
	SpinParticles=true
	UniformSize=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-400.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=96,G=96,B=160,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.6500000,Max=0.6500000),Z=(Min=0.6500000,Max=0.6500000))
	FadeOutStartTime=2.0000000
	MaxParticles=60
	StartSpinRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=8.0000000,Max=16.0000000),Y=(Min=8.0000000,Max=16.0000000),Z=(Min=8.0000000,Max=16.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	LifetimeRange=(Min=3.0000000,Max=3.0000000)
	StartVelocityRange=(X=(Min=-128.0000000,Max=128.0000000),Y=(Min=-128.0000000,Max=128.0000000),Z=(Min=96.0000000,Max=250.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.BOGPFlareTrail.SpriteEmitter4'
begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.3500000,Max=0.3500000),Z=(Min=0.3500000,Max=0.3500000))
	Opacity=0.2000000
	FadeOutStartTime=0.5000000
	CoordinateSystem=1
	MaxParticles=1
	StartLocationRange=(X=(Min=-8.0000000,Max=-8.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=900.0000000,Max=1000.0000000),Y=(Min=900.0000000,Max=1000.0000000),Z=(Min=900.0000000,Max=1000.0000000))
	InitialParticlesPerSecond=200.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareA1'
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BallisticProV55.BOGPFlareTrail.SpriteEmitter5'
begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	Opacity=0.1000000
	FadeOutStartTime=0.5000000
	CoordinateSystem=1
	MaxParticles=2
	StartLocationRange=(X=(Min=-8.0000000,Max=-8.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.1500000,Max=0.1500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=400.0000000,Max=600.0000000),Y=(Min=400.0000000,Max=600.0000000),Z=(Min=400.0000000,Max=600.0000000))
	InitialParticlesPerSecond=200.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: TrailEmitter'BallisticProV55.BOGPFlareTrail.TrailEmitter1'
begin object name="TrailEmitter1" class=Engine.TrailEmitter
	TrailShadeType=4
	TrailLocation=1
	MaxPointsPerTrail=50
	DistanceThreshold=100.0000000
	PointLifeTime=6.0000000
	FadeOut=true
	FadeIn=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5500000,Max=0.5500000),Z=(Min=0.5500000,Max=0.5500000))
	Opacity=0.2000000
	FadeOutStartTime=0.4000000
	FadeInEndTime=0.2000000
	MaxParticles=3
	StartSizeRange=(X=(Min=150.0000000,Max=150.0000000),Y=(Min=75.0000000,Max=75.0000000),Z=(Min=75.0000000,Max=75.0000000))
	InitialParticlesPerSecond=500000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=30.0000000,Max=30.0000000)
end object
