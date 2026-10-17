class ONSHoverBikeHoverDust extends Emitter;

var bool bDustActive;

simulated function SetDustColor(Color DustColor)
{
	local Color DustColorZeroAlpha, BlackColor;

	// End:0x61
	if(((int(DustColor.R) == 0) && int(DustColor.G) == 0) && int(DustColor.B) == 0)
	{
		DustColor.R = 128;
		DustColor.G = 100;
		DustColor.B = 64;
	}
	DustColor.A = byte(255);
	DustColorZeroAlpha = DustColor;
	DustColorZeroAlpha.A = 0;
	BlackColor.R = 0;
	BlackColor.G = 0;
	BlackColor.B = 0;
	BlackColor.A = 0;
	Emitters[0].ColorScale[0].Color = DustColorZeroAlpha;
	Emitters[0].ColorScale[1].Color = DustColor;
	Emitters[0].ColorScale[2].Color = DustColor;
	Emitters[0].ColorScale[3].Color = DustColorZeroAlpha;
	Emitters[1].ColorScale[0].Color = BlackColor;
	Emitters[1].ColorScale[1].Color = DustColor;
	Emitters[1].ColorScale[2].Color = DustColor;
	Emitters[1].ColorScale[3].Color = BlackColor;
	//return;	
}

simulated function UpdateHoverDust(bool bActive, float HoverHeight)
{
	local float Force;

	Force = 1.0000000 - HoverHeight;
	// End:0x61
	if(!bActive)
	{
		Emitters[0].ParticlesPerSecond = 0.0000000;
		Emitters[0].InitialParticlesPerSecond = 0.0000000;
		Emitters[1].Disabled = true;
		return;		
	}
	else
	{
		Emitters[0].ParticlesPerSecond = 100.0000000;
		Emitters[0].InitialParticlesPerSecond = 100.0000000;
		Emitters[0].AllParticlesDead = false;
		Emitters[1].Disabled = int(Level.DetailMode) == int(0);
	}
	Emitters[0].StartVelocityRadialRange.Min = -650.0000000 + (Force * float(-100));
	Emitters[0].StartVelocityRadialRange.Max = Emitters[0].StartVelocityRadialRange.Min - float(100);
	Emitters[0].StartLocationPolarRange.Z.Min = 10.0000000 + (HoverHeight * float(30));
	Emitters[0].StartLocationPolarRange.Z.Max = Emitters[0].StartLocationPolarRange.Z.Min;
	Emitters[1].StartSizeRange.X.Min = 30.0000000 + (HoverHeight * float(40));
	Emitters[1].StartSizeRange.X.Max = Emitters[1].StartSizeRange.X.Min + float(20);
	Emitters[1].Opacity = FClamp(2.5000000 * Force, 0.0000000, 0.8000000);
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'Onslaught.ONSHoverBikeHoverDust.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		UseRandomSubdivision=true
		UseVelocityScale=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=500.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=164,G=128,B=96,A=0))
		ColorScale[1]=(RelativeTime=0.2000000,Color=(R=164,G=128,B=96,A=255))
		ColorScale[2]=(RelativeTime=0.5000000,Color=(R=128,G=100,B=64,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=125,G=104,B=68,A=0))
		FadeOutStartTime=0.5000000
		FadeInEndTime=0.3500000
		MaxParticles=50
		StartLocationShape=2
		StartLocationPolarRange=(X=(Min=16384.0000000,Max=16384.0000000),Y=(Min=0.0000000,Max=65536.0000000),Z=(Min=20.0000000,Max=20.0000000))
		UseRotationFrom=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.3000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=50.0000000,Max=90.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		ParticlesPerSecond=50.0000000
		InitialParticlesPerSecond=50.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Weapons.SmokePanels2'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.5000000,Max=0.8000000)
		StartVelocityRange=(X=(Min=70.0000000,Max=70.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartVelocityRadialRange=(Min=-600.0000000,Max=-800.0000000)
		GetVelocityDirectionFrom=3
		VelocityScale[0]=(RelativeTime=0.0000000,RelativeVelocity=(X=1.0000000,Y=1.0000000,Z=1.0000000))
		VelocityScale[1]=(RelativeTime=0.2000000,RelativeVelocity=(X=0.3500000,Y=0.3500000,Z=0.3500000))
		VelocityScale[2]=(RelativeTime=0.5000000,RelativeVelocity=(X=0.1000000,Y=0.1000000,Z=0.1000000))
		VelocityScale[3]=(RelativeTime=1.0000000,RelativeVelocity=(X=0.0000000,Y=0.0000000,Z=0.0000000))
	end object
	Emitters[0]=SpriteEmitter0
	// Reference: SpriteEmitter'Onslaught.ONSHoverBikeHoverDust.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		UseDirectionAs=4
		ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
		UseColorScale=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.4500000,Color=(R=128,G=100,B=64,A=0))
		ColorScale[2]=(RelativeTime=0.5500000,Color=(R=128,G=100,B=64,A=0))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		Opacity=0.7500000
		CoordinateSystem=1
		MaxParticles=3
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=6.0000000)
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.5000000)
		StartSizeRange=(X=(Min=50.0000000,Max=65.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		Texture=Texture'AW-2004Particles.Energy.AirBlast'
		LifetimeRange=(Min=0.3000000,Max=0.3000000)
	end object
	Emitters[1]=SpriteEmitter1
	CullDistance=8000.0000000
	bNoDelete=false
	bHardAttach=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'Onslaught.ONSHoverBikeHoverDust.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	UseRandomSubdivision=true
	UseVelocityScale=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=500.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=164,G=128,B=96,A=0))
	ColorScale[1]=(RelativeTime=0.2000000,Color=(R=164,G=128,B=96,A=255))
	ColorScale[2]=(RelativeTime=0.5000000,Color=(R=128,G=100,B=64,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=125,G=104,B=68,A=0))
	FadeOutStartTime=0.5000000
	FadeInEndTime=0.3500000
	MaxParticles=50
	StartLocationShape=2
	StartLocationPolarRange=(X=(Min=16384.0000000,Max=16384.0000000),Y=(Min=0.0000000,Max=65536.0000000),Z=(Min=20.0000000,Max=20.0000000))
	UseRotationFrom=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.3000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=50.0000000,Max=90.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	ParticlesPerSecond=50.0000000
	InitialParticlesPerSecond=50.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Weapons.SmokePanels2'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.5000000,Max=0.8000000)
	StartVelocityRange=(X=(Min=70.0000000,Max=70.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartVelocityRadialRange=(Min=-600.0000000,Max=-800.0000000)
	GetVelocityDirectionFrom=3
	VelocityScale[0]=(RelativeTime=0.0000000,RelativeVelocity=(X=1.0000000,Y=1.0000000,Z=1.0000000))
	VelocityScale[1]=(RelativeTime=0.2000000,RelativeVelocity=(X=0.3500000,Y=0.3500000,Z=0.3500000))
	VelocityScale[2]=(RelativeTime=0.5000000,RelativeVelocity=(X=0.1000000,Y=0.1000000,Z=0.1000000))
	VelocityScale[3]=(RelativeTime=1.0000000,RelativeVelocity=(X=0.0000000,Y=0.0000000,Z=0.0000000))
end object
// Reference: SpriteEmitter'Onslaught.ONSHoverBikeHoverDust.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	UseDirectionAs=4
	ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
	UseColorScale=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.4500000,Color=(R=128,G=100,B=64,A=0))
	ColorScale[2]=(RelativeTime=0.5500000,Color=(R=128,G=100,B=64,A=0))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	Opacity=0.7500000
	CoordinateSystem=1
	MaxParticles=3
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=6.0000000)
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.5000000)
	StartSizeRange=(X=(Min=50.0000000,Max=65.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	Texture=Texture'AW-2004Particles.Energy.AirBlast'
	LifetimeRange=(Min=0.3000000,Max=0.3000000)
end object
