class DCTVThorDust extends BallisticEmitter;

var float XMirror;
var float YMirror;
var float SpeedThreshold;

simulated function OrientateDust(bool bBackwards, bool bMirrored)
{
	// End:0x48
	if(bMirrored)
	{
		YMirror = -1.0000000;
		Emitters[1].StartLocationOffset.Y = default.Emitters[1].StartLocationOffset.Y * float(-1);
	}
	// End:0x158
	if(bBackwards)
	{
		XMirror = -1.0000000;
		Emitters[1].StartVelocityRange.X.Max = default.Emitters[1].StartVelocityRange.X.Max * float(-1);
		Emitters[1].StartVelocityRange.X.Min = default.Emitters[1].StartVelocityRange.X.Min * float(-1);
		Emitters[2].StartVelocityRange.X.Max = default.Emitters[2].StartVelocityRange.X.Max * float(-1);
		Emitters[2].StartVelocityRange.X.Min = default.Emitters[2].StartVelocityRange.X.Min * float(-1);
	}
	//return;	
}

simulated function SetDustColor(Color DustColor)
{
	// End:0x61
	if(((int(DustColor.R) == 0) && int(DustColor.G) == 0) && int(DustColor.B) == 0)
	{
		DustColor.R = 180;
		DustColor.G = 140;
		DustColor.B = 108;
	}
	DustColor.A = byte(255);
	Emitters[0].ColorScale[0].Color = DustColor;
	Emitters[0].ColorScale[1].Color = DustColor;
	Emitters[1].ColorScale[0].Color = DustColor;
	Emitters[1].ColorScale[1].Color = DustColor;
	//return;	
}

simulated function UpdateDust(float Speed, bool bOn, float DigAmp)
{
	// End:0x221
	if(bOn)
	{
		Emitters[0].InitialParticlesPerSecond = (20.0000000 * Speed) / SpeedThreshold;
		Emitters[1].InitialParticlesPerSecond = (15.0000000 * Speed) / SpeedThreshold;
		Emitters[2].InitialParticlesPerSecond = ((8.0000000 * DigAmp) * Speed) / SpeedThreshold;
		Emitters[0].ParticlesPerSecond = Emitters[0].InitialParticlesPerSecond;
		Emitters[1].ParticlesPerSecond = Emitters[1].InitialParticlesPerSecond;
		Emitters[2].ParticlesPerSecond = Emitters[2].InitialParticlesPerSecond;
		Emitters[1].StartVelocityRange.X.Max = ((default.Emitters[1].StartVelocityRange.X.Max * XMirror) * Speed) / SpeedThreshold;
		Emitters[1].StartVelocityRange.X.Min = Emitters[1].StartVelocityRange.X.Max;
		Emitters[2].StartVelocityRange.X.Max = ((default.Emitters[2].StartVelocityRange.X.Max * XMirror) * Speed) / SpeedThreshold;
		Emitters[2].StartVelocityRange.X.Min = Emitters[2].StartVelocityRange.X.Max;
		Emitters[0].AllParticlesDead = false;
		Emitters[1].AllParticlesDead = false;
		Emitters[2].AllParticlesDead = false;		
	}
	else
	{
		Emitters[0].InitialParticlesPerSecond = 0.0000000;
		Emitters[1].InitialParticlesPerSecond = 0.0000000;
		Emitters[2].InitialParticlesPerSecond = 0.0000000;
	}
	//return;	
}

defaultproperties
{
	XMirror=1.0000000
	YMirror=1.0000000
	SpeedThreshold=1000.0000000
	// Reference: SpriteEmitter'BWBP_VPC_Pro.DCTVThorDust.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=30.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=204,G=165,B=128,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=204,G=165,B=128,A=255))
		Opacity=0.7000000
		FadeOutStartTime=1.2800000
		FadeInEndTime=0.6400000
		MaxParticles=50
		UseRotationFrom=1
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.4000000)
		StartSizeRange=(X=(Min=100.0000000,Max=120.0000000),Y=(Min=100.0000000,Max=120.0000000),Z=(Min=100.0000000,Max=130.0000000))
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=3.0000000,Max=3.0000000)
		StartVelocityRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[0]=SpriteEmitter0
	// Reference: SpriteEmitter'BWBP_VPC_Pro.DCTVThorDust.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=204,G=165,B=128,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=204,G=165,B=128,A=255))
		FadeOutStartTime=0.3900000
		FadeInEndTime=0.1800000
		MaxParticles=5
		StartLocationOffset=(X=0.0000000,Y=-30.0000000,Z=0.0000000)
		StartLocationRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=0.0000000,Max=0.0000000))
		UseRotationFrom=1
		SpinsPerSecondRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.2500000)
		DrawStyle=1
		Texture=Texture'EpicParticles.Smoke.SparkCloud_01aw'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=-300.0000000,Max=-300.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=150.0000000,Max=150.0000000))
	end object
	Emitters[1]=SpriteEmitter1
	// Reference: SpriteEmitter'BWBP_VPC_Pro.DCTVThorDust.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		UseCollision=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		DampRotation=true
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-800.0000000)
		ExtentMultiplier=(X=0.5000000,Y=0.5000000,Z=0.5000000)
		DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=1.3200000
		FadeInEndTime=0.1200000
		MaxParticles=100
		StartLocationOffset=(X=-50.0000000,Y=0.0000000,Z=-7.0000000)
		StartLocationRange=(X=(Min=-30.0000000,Max=30.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=0.0000000,Max=0.0000000))
		UseRotationFrom=1
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		RotationDampingFactorRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.2500000,Max=0.2500000),Z=(Min=0.2500000,Max=0.2500000))
		StartSizeRange=(X=(Min=8.0000000,Max=15.0000000),Y=(Min=8.0000000,Max=15.0000000),Z=(Min=8.0000000,Max=15.0000000))
		DrawStyle=1
		Texture=Texture'EmitterTextures.MultiFrame.rockchunks02'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		SecondsBeforeInactive=0.0000000
		MinSquaredVelocity=10000.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=-400.0000000,Max=-400.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=600.0000000))
	end object
	Emitters[2]=SpriteEmitter2
	CullDistance=8000.0000000
	Physics=10
	bHardAttach=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_VPC_Pro.DCTVThorDust.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=30.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=204,G=165,B=128,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=204,G=165,B=128,A=255))
	Opacity=0.7000000
	FadeOutStartTime=1.2800000
	FadeInEndTime=0.6400000
	MaxParticles=50
	UseRotationFrom=1
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.4000000)
	StartSizeRange=(X=(Min=100.0000000,Max=120.0000000),Y=(Min=100.0000000,Max=120.0000000),Z=(Min=100.0000000,Max=130.0000000))
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=3.0000000,Max=3.0000000)
	StartVelocityRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BWBP_VPC_Pro.DCTVThorDust.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=204,G=165,B=128,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=204,G=165,B=128,A=255))
	FadeOutStartTime=0.3900000
	FadeInEndTime=0.1800000
	MaxParticles=5
	StartLocationOffset=(X=0.0000000,Y=-30.0000000,Z=0.0000000)
	StartLocationRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=0.0000000,Max=0.0000000))
	UseRotationFrom=1
	SpinsPerSecondRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.2500000)
	DrawStyle=1
	Texture=Texture'EpicParticles.Smoke.SparkCloud_01aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=-300.0000000,Max=-300.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=150.0000000,Max=150.0000000))
end object
// Reference: SpriteEmitter'BWBP_VPC_Pro.DCTVThorDust.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	UseCollision=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	DampRotation=true
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-800.0000000)
	ExtentMultiplier=(X=0.5000000,Y=0.5000000,Z=0.5000000)
	DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=1.3200000
	FadeInEndTime=0.1200000
	MaxParticles=100
	StartLocationOffset=(X=-50.0000000,Y=0.0000000,Z=-7.0000000)
	StartLocationRange=(X=(Min=-30.0000000,Max=30.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=0.0000000,Max=0.0000000))
	UseRotationFrom=1
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	RotationDampingFactorRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.2500000,Max=0.2500000),Z=(Min=0.2500000,Max=0.2500000))
	StartSizeRange=(X=(Min=8.0000000,Max=15.0000000),Y=(Min=8.0000000,Max=15.0000000),Z=(Min=8.0000000,Max=15.0000000))
	DrawStyle=1
	Texture=Texture'EmitterTextures.MultiFrame.rockchunks02'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	SecondsBeforeInactive=0.0000000
	MinSquaredVelocity=10000.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=-400.0000000,Max=-400.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=600.0000000))
end object
