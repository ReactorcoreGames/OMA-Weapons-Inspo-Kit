class LonghornGrenadeTrail extends BallisticEmitter;

simulated function SetupColor(int TeamNum)
{
	// End:0x0D
	if(TeamNum != 1)
	{
		return;
	}
	Emitters[1].ColorMultiplierRange.X.Max = 0.2000000;
	Emitters[1].ColorMultiplierRange.X.Min = 0.1000000;
	Emitters[1].ColorMultiplierRange.Y.Max = 0.6000000;
	Emitters[1].ColorMultiplierRange.Y.Min = 0.2000000;
	Emitters[1].ColorMultiplierRange.Z.Max = 0.5000000;
	Emitters[1].ColorMultiplierRange.Z.Min = 0.3000000;
	Emitters[5].ColorMultiplierRange.X.Max = 0.2000000;
	Emitters[5].ColorMultiplierRange.X.Min = 0.1000000;
	Emitters[5].ColorMultiplierRange.Y.Max = 0.6000000;
	Emitters[5].ColorMultiplierRange.Y.Min = 0.2000000;
	Emitters[5].ColorMultiplierRange.Z.Max = 0.5000000;
	Emitters[5].ColorMultiplierRange.Z.Min = 0.3000000;
	//return;	
}

simulated function ActivateBeacon()
{
	Emitters[7].Disabled = false;
	//return;	
}

simulated function DisableFlare()
{
	Emitters[0].Disabled = true;
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'BWBP_SKC_Pro.LonghornGrenadeTrail.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=196,G=128,B=0,A=255))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.4000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
		Opacity=0.8000000
		FadeOutStartTime=0.5000000
		CoordinateSystem=1
		MaxParticles=2
		StartLocationRange=(X=(Min=-8.0000000,Max=-8.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.3000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=12.0000000,Max=12.0000000),Y=(Min=12.0000000,Max=12.0000000),Z=(Min=12.0000000,Max=12.0000000))
		InitialParticlesPerSecond=200.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[0]=SpriteEmitter0
	// Reference: SpriteEmitter'BWBP_SKC_Pro.LonghornGrenadeTrail.SpriteEmitter3'
	begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
		UseCollision=true
		UseMaxCollisions=true
		SpinParticles=true
		UniformSize=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-2000.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=180,G=180,B=180,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=96,G=96,B=160,A=255))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.2000000,Max=0.8000000),Z=(Min=0.2000000,Max=0.2000000))
		FadeOutStartTime=3.0000000
		MaxParticles=200
		DetailMode=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=4.0000000,Max=8.0000000),Y=(Min=4.0000000,Max=8.0000000),Z=(Min=4.0000000,Max=8.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareA1'
		LifetimeRange=(Min=3.0000000,Max=3.0000000)
		StartVelocityRange=(X=(Min=-256.0000000,Max=256.0000000),Y=(Min=-256.0000000,Max=256.0000000),Z=(Min=200.0000000,Max=800.0000000))
	end object
	Emitters[1]=SpriteEmitter3
	// Reference: SpriteEmitter'BWBP_SKC_Pro.LonghornGrenadeTrail.SpriteEmitter4'
	begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=196,G=128,B=0,A=255))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.4000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
		Opacity=0.2000000
		FadeOutStartTime=0.5000000
		CoordinateSystem=1
		MaxParticles=1
		StartLocationRange=(X=(Min=-8.0000000,Max=-8.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=20.0000000,Max=25.0000000),Y=(Min=20.0000000,Max=25.0000000),Z=(Min=20.0000000,Max=25.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareA1'
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[2]=SpriteEmitter4
	// Reference: SpriteEmitter'BWBP_SKC_Pro.LonghornGrenadeTrail.SpriteEmitter5'
	begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=196,G=128,B=0,A=255))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.4000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
		Opacity=0.1000000
		FadeOutStartTime=0.5000000
		CoordinateSystem=1
		MaxParticles=2
		StartLocationRange=(X=(Min=-8.0000000,Max=-8.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.1500000,Max=0.1500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=20.0000000,Max=25.0000000),Y=(Min=20.0000000,Max=25.0000000),Z=(Min=20.0000000,Max=25.0000000))
		InitialParticlesPerSecond=200.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[3]=SpriteEmitter5
	// Reference: TrailEmitter'BWBP_SKC_Pro.LonghornGrenadeTrail.TrailEmitter1'
	begin object name="TrailEmitter1" class=Engine.TrailEmitter
		TrailShadeType=4
		TrailLocation=1
		MaxPointsPerTrail=20
		DistanceThreshold=100.0000000
		PointLifeTime=1.0000000
		FadeOut=true
		FadeIn=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=64,G=64,B=64,A=128))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=64,G=64,B=64,A=128))
		Opacity=0.1000000
		FadeOutStartTime=0.4000000
		FadeInEndTime=0.2000000
		MaxParticles=3
		DetailMode=1
		StartSizeRange=(X=(Min=50.0000000,Max=55.0000000),Y=(Min=25.0000000,Max=27.0000000),Z=(Min=25.0000000,Max=27.0000000))
		InitialParticlesPerSecond=500000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.7500000,Max=1.0000000)
	end object
	Emitters[4]=TrailEmitter1
	// Reference: SpriteEmitter'BWBP_SKC_Pro.LonghornGrenadeTrail.SpriteEmitter6'
	begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
		UseCollision=true
		UseMaxCollisions=true
		SpinParticles=true
		UniformSize=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-1500.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=180,G=180,B=180,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=96,G=96,B=160,A=255))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.2000000,Max=0.8000000),Z=(Min=0.2000000,Max=0.2000000))
		FadeOutStartTime=3.0000000
		MaxParticles=40
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=4.0000000,Max=8.0000000),Y=(Min=4.0000000,Max=8.0000000),Z=(Min=4.0000000,Max=8.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareA1'
		LifetimeRange=(Min=3.0000000,Max=3.0000000)
		StartVelocityRange=(X=(Min=-256.0000000,Max=256.0000000),Y=(Min=-256.0000000,Max=256.0000000),Z=(Min=200.0000000,Max=800.0000000))
	end object
	Emitters[5]=SpriteEmitter6
	// Reference: SpriteEmitter'BWBP_SKC_Pro.LonghornGrenadeTrail.SpriteEmitter28'
	begin object name="SpriteEmitter28" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=50.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=255))
		Opacity=0.6500000
		FadeOutStartTime=1.0000000
		FadeInEndTime=0.1500000
		MaxParticles=45
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.5000000,RelativeSize=0.7000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=15.0000000,Max=25.0000000),Y=(Min=15.0000000,Max=25.0000000),Z=(Min=15.0000000,Max=25.0000000))
		InitialParticlesPerSecond=20.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke4'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.5000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=-25.0000000,Max=25.0000000),Y=(Min=-25.0000000,Max=25.0000000),Z=(Min=80.0000000,Max=105.0000000))
	end object
	Emitters[6]=SpriteEmitter28
	// Reference: SpriteEmitter'BWBP_SKC_Pro.LonghornGrenadeTrail.SpriteEmitter7'
	begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
		FadeOut=true
		Disabled=true
		Backup_Disabled=true
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=196,G=128,B=0,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		FadeOutStartTime=0.1604000
		CoordinateSystem=1
		MaxParticles=1
		SpinsPerSecondRange=(X=(Min=0.3000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=15.0000000,Max=15.0000000),Y=(Min=15.0000000,Max=15.0000000),Z=(Min=15.0000000,Max=15.0000000))
		InitialParticlesPerSecond=1.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareA1'
		LifetimeRange=(Min=0.4010000,Max=0.4010000)
	end object
	Emitters[7]=SpriteEmitter7
	AutoDestroy=true
	bHardAttach=true
	bDirectional=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_SKC_Pro.LonghornGrenadeTrail.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=196,G=128,B=0,A=255))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.4000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
	Opacity=0.8000000
	FadeOutStartTime=0.5000000
	CoordinateSystem=1
	MaxParticles=2
	StartLocationRange=(X=(Min=-8.0000000,Max=-8.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.3000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=12.0000000,Max=12.0000000),Y=(Min=12.0000000,Max=12.0000000),Z=(Min=12.0000000,Max=12.0000000))
	InitialParticlesPerSecond=200.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.LonghornGrenadeTrail.SpriteEmitter3'
begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
	UseCollision=true
	UseMaxCollisions=true
	SpinParticles=true
	UniformSize=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-2000.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=180,G=180,B=180,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=96,G=96,B=160,A=255))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.2000000,Max=0.8000000),Z=(Min=0.2000000,Max=0.2000000))
	FadeOutStartTime=3.0000000
	MaxParticles=200
	DetailMode=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=4.0000000,Max=8.0000000),Y=(Min=4.0000000,Max=8.0000000),Z=(Min=4.0000000,Max=8.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareA1'
	LifetimeRange=(Min=3.0000000,Max=3.0000000)
	StartVelocityRange=(X=(Min=-256.0000000,Max=256.0000000),Y=(Min=-256.0000000,Max=256.0000000),Z=(Min=200.0000000,Max=800.0000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.LonghornGrenadeTrail.SpriteEmitter4'
begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=196,G=128,B=0,A=255))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.4000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
	Opacity=0.2000000
	FadeOutStartTime=0.5000000
	CoordinateSystem=1
	MaxParticles=1
	StartLocationRange=(X=(Min=-8.0000000,Max=-8.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=20.0000000,Max=25.0000000),Y=(Min=20.0000000,Max=25.0000000),Z=(Min=20.0000000,Max=25.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareA1'
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.LonghornGrenadeTrail.SpriteEmitter5'
begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=196,G=128,B=0,A=255))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.4000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
	Opacity=0.1000000
	FadeOutStartTime=0.5000000
	CoordinateSystem=1
	MaxParticles=2
	StartLocationRange=(X=(Min=-8.0000000,Max=-8.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.1500000,Max=0.1500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=20.0000000,Max=25.0000000),Y=(Min=20.0000000,Max=25.0000000),Z=(Min=20.0000000,Max=25.0000000))
	InitialParticlesPerSecond=200.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: TrailEmitter'BWBP_SKC_Pro.LonghornGrenadeTrail.TrailEmitter1'
begin object name="TrailEmitter1" class=Engine.TrailEmitter
	TrailShadeType=4
	TrailLocation=1
	MaxPointsPerTrail=20
	DistanceThreshold=100.0000000
	PointLifeTime=1.0000000
	FadeOut=true
	FadeIn=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=64,G=64,B=64,A=128))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=64,G=64,B=64,A=128))
	Opacity=0.1000000
	FadeOutStartTime=0.4000000
	FadeInEndTime=0.2000000
	MaxParticles=3
	DetailMode=1
	StartSizeRange=(X=(Min=50.0000000,Max=55.0000000),Y=(Min=25.0000000,Max=27.0000000),Z=(Min=25.0000000,Max=27.0000000))
	InitialParticlesPerSecond=500000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.7500000,Max=1.0000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.LonghornGrenadeTrail.SpriteEmitter6'
begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
	UseCollision=true
	UseMaxCollisions=true
	SpinParticles=true
	UniformSize=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-1500.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=180,G=180,B=180,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=96,G=96,B=160,A=255))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.2000000,Max=0.8000000),Z=(Min=0.2000000,Max=0.2000000))
	FadeOutStartTime=3.0000000
	MaxParticles=40
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=4.0000000,Max=8.0000000),Y=(Min=4.0000000,Max=8.0000000),Z=(Min=4.0000000,Max=8.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareA1'
	LifetimeRange=(Min=3.0000000,Max=3.0000000)
	StartVelocityRange=(X=(Min=-256.0000000,Max=256.0000000),Y=(Min=-256.0000000,Max=256.0000000),Z=(Min=200.0000000,Max=800.0000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.LonghornGrenadeTrail.SpriteEmitter28'
begin object name="SpriteEmitter28" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=50.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=255))
	Opacity=0.6500000
	FadeOutStartTime=1.0000000
	FadeInEndTime=0.1500000
	MaxParticles=45
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.5000000,RelativeSize=0.7000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=15.0000000,Max=25.0000000),Y=(Min=15.0000000,Max=25.0000000),Z=(Min=15.0000000,Max=25.0000000))
	InitialParticlesPerSecond=20.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke4'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.5000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=-25.0000000,Max=25.0000000),Y=(Min=-25.0000000,Max=25.0000000),Z=(Min=80.0000000,Max=105.0000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.LonghornGrenadeTrail.SpriteEmitter7'
begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
	FadeOut=true
	Disabled=true
	Backup_Disabled=true
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=196,G=128,B=0,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	FadeOutStartTime=0.1604000
	CoordinateSystem=1
	MaxParticles=1
	SpinsPerSecondRange=(X=(Min=0.3000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=15.0000000,Max=15.0000000),Y=(Min=15.0000000,Max=15.0000000),Z=(Min=15.0000000,Max=15.0000000))
	InitialParticlesPerSecond=1.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareA1'
	LifetimeRange=(Min=0.4010000,Max=0.4010000)
end object
