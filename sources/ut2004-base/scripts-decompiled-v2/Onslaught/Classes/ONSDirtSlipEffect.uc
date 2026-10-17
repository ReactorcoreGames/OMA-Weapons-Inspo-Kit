class ONSDirtSlipEffect extends Emitter;

var() int MaxSpritePPS;
var() int MaxMeshPPS;
var() Sound DirtSlipSound;

simulated function SetDirtColor(Color DirtColor)
{
	local Color DirtColorZeroAlpha, DirtColorHalfAlpha;

	// End:0x3C
	if(((int(DirtColor.R) == 0) && int(DirtColor.G) == 0) && int(DirtColor.B) == 0)
	{
		return;
	}
	DirtColor.A = byte(255);
	DirtColorZeroAlpha = DirtColor;
	DirtColorZeroAlpha.A = 0;
	DirtColorHalfAlpha = DirtColor;
	DirtColorHalfAlpha.A = 128;
	Emitters[0].ColorScale[0].Color = DirtColorZeroAlpha;
	Emitters[0].ColorScale[1].Color = DirtColorHalfAlpha;
	Emitters[0].ColorScale[2].Color = DirtColorHalfAlpha;
	Emitters[0].ColorScale[3].Color = DirtColorZeroAlpha;
	//return;	
}

simulated function UpdateDust(SVehicleWheel t, float DustSlipRate, float DustSlipThresh)
{
	local float SpritePPS, MeshPPS;

	// End:0x10E
	if(t.bWheelOnGround && t.SlipVel > DustSlipThresh)
	{
		SpritePPS = FMin(DustSlipRate * (t.SlipVel - DustSlipThresh), float(MaxSpritePPS));
		Emitters[0].ParticlesPerSecond = SpritePPS;
		Emitters[0].InitialParticlesPerSecond = SpritePPS;
		Emitters[0].AllParticlesDead = false;
		MeshPPS = FMin(DustSlipRate * (t.SlipVel - DustSlipThresh), float(MaxMeshPPS));
		Emitters[1].ParticlesPerSecond = MeshPPS;
		Emitters[1].InitialParticlesPerSecond = MeshPPS;
		Emitters[1].AllParticlesDead = false;
		AmbientSound = DirtSlipSound;		
	}
	else
	{
		Emitters[0].ParticlesPerSecond = 0.0000000;
		Emitters[0].InitialParticlesPerSecond = 0.0000000;
		Emitters[1].ParticlesPerSecond = 0.0000000;
		Emitters[1].InitialParticlesPerSecond = 0.0000000;
		AmbientSound = none;
	}
	//return;	
}

defaultproperties
{
	MaxSpritePPS=70
	MaxMeshPPS=70
	DirtSlipSound=Sound'ONSVehicleSounds-S.PRV.DirtSkid03'
	// Reference: SpriteEmitter'Onslaught.ONSDirtSlipEffect.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=15.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=110,G=90,B=30,A=0))
		ColorScale[1]=(RelativeTime=0.1000000,Color=(R=66,G=44,B=34,A=128))
		ColorScale[2]=(RelativeTime=0.9000000,Color=(R=64,G=49,B=36,A=128))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=80,G=50,B=20,A=0))
		MaxParticles=100
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-24.0000000,Max=24.0000000),Z=(Min=0.0000000,Max=0.0000000))
		UseRotationFrom=1
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0250000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2500000)
		SizeScale[1]=(RelativeTime=0.5000000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=0.9000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
		DrawStyle=1
		Texture=Texture'VehicleFX.Particles.DustyCloud2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=1.1000000)
	end object
	Emitters[0]=SpriteEmitter1
	// Reference: SpriteEmitter'Onslaught.ONSDirtSlipEffect.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-550.0000000)
		FadeOutStartTime=0.5000000
		MaxParticles=150
		StartLocationRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
		UseRotationFrom=1
		SpinsPerSecondRange=(X=(Min=0.5000000,Max=2.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=2.0000000,Max=8.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		DrawStyle=1
		Texture=Texture'VMparticleTextures.DirtKICKGROUP.dirtKICKTEX'
		TextureUSubdivisions=16
		TextureVSubdivisions=16
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.6500000,Max=0.6500000)
		StartVelocityRange=(X=(Min=-150.0000000,Max=-250.0000000),Y=(Min=-80.0000000,Max=80.0000000),Z=(Min=50.0000000,Max=250.0000000))
	end object
	Emitters[1]=SpriteEmitter0
	CullDistance=5000.0000000
	bNoDelete=false
	bHardAttach=true
	SoundVolume=40
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'Onslaught.ONSDirtSlipEffect.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=15.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=110,G=90,B=30,A=0))
	ColorScale[1]=(RelativeTime=0.1000000,Color=(R=66,G=44,B=34,A=128))
	ColorScale[2]=(RelativeTime=0.9000000,Color=(R=64,G=49,B=36,A=128))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=80,G=50,B=20,A=0))
	MaxParticles=100
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-24.0000000,Max=24.0000000),Z=(Min=0.0000000,Max=0.0000000))
	UseRotationFrom=1
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0250000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2500000)
	SizeScale[1]=(RelativeTime=0.5000000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=0.9000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
	DrawStyle=1
	Texture=Texture'VehicleFX.Particles.DustyCloud2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=1.1000000)
end object
// Reference: SpriteEmitter'Onslaught.ONSDirtSlipEffect.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-550.0000000)
	FadeOutStartTime=0.5000000
	MaxParticles=150
	StartLocationRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
	UseRotationFrom=1
	SpinsPerSecondRange=(X=(Min=0.5000000,Max=2.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=2.0000000,Max=8.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	DrawStyle=1
	Texture=Texture'VMparticleTextures.DirtKICKGROUP.dirtKICKTEX'
	TextureUSubdivisions=16
	TextureVSubdivisions=16
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.6500000,Max=0.6500000)
	StartVelocityRange=(X=(Min=-150.0000000,Max=-250.0000000),Y=(Min=-80.0000000,Max=80.0000000),Z=(Min=50.0000000,Max=250.0000000))
end object
