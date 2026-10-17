class ONSDamagedEffect extends Emitter
	native;

simulated function PostBeginPlay()
{
	local ONSVehicle V;

	super(Actor).PostBeginPlay();
	V = ONSVehicle(Owner);
	// End:0x41
	if(V != none)
	{
		SetEffectScale(V.DamagedEffectScale);
		UpdateDamagedEffect(false, 0.0000000);
	}
	//return;	
}

simulated function SetEffectScale(float Scaling)
{
	Emitters[0].SizeScale[0].RelativeSize = Scaling * default.Emitters[0].SizeScale[0].RelativeSize;
	Emitters[0].SizeScale[1].RelativeSize = Scaling * default.Emitters[0].SizeScale[1].RelativeSize;
	Emitters[1].SizeScale[0].RelativeSize = Scaling * default.Emitters[1].SizeScale[0].RelativeSize;
	Emitters[1].SizeScale[1].RelativeSize = Scaling * default.Emitters[1].SizeScale[1].RelativeSize;
	Emitters[1].SizeScale[2].RelativeSize = Scaling * default.Emitters[1].SizeScale[2].RelativeSize;
	Emitters[1].StartLocationRange.X.Min = Scaling * default.Emitters[1].StartLocationRange.X.Min;
	Emitters[1].StartLocationRange.X.Max = Scaling * default.Emitters[1].StartLocationRange.X.Max;
	Emitters[1].StartLocationRange.Y.Min = Scaling * default.Emitters[1].StartLocationRange.Y.Min;
	Emitters[1].StartLocationRange.Y.Max = Scaling * default.Emitters[1].StartLocationRange.Y.Max;
	Emitters[2].StartSizeRange.X.Min = Scaling * default.Emitters[2].StartSizeRange.X.Min;
	Emitters[2].StartSizeRange.X.Max = Scaling * default.Emitters[2].StartSizeRange.X.Max;
	Emitters[2].StartSizeRange.Y.Min = Scaling * default.Emitters[2].StartSizeRange.Y.Min;
	Emitters[2].StartSizeRange.Y.Max = Scaling * default.Emitters[2].StartSizeRange.Y.Max;
	Emitters[2].StartLocationRange.X.Min = Scaling * default.Emitters[2].StartLocationRange.X.Min;
	Emitters[2].StartLocationRange.X.Max = Scaling * default.Emitters[2].StartLocationRange.X.Max;
	Emitters[2].StartLocationRange.Y.Min = Scaling * default.Emitters[2].StartLocationRange.Y.Min;
	Emitters[2].StartLocationRange.Y.Max = Scaling * default.Emitters[2].StartLocationRange.Y.Max;
	//return;	
}

simulated event UpdateDamagedEffect(bool bFlame, float VelMag)
{
	local float SmokeLifeScale;

	// End:0xBB
	if(bFlame)
	{
		Emitters[1].ParticlesPerSecond = default.Emitters[1].ParticlesPerSecond;
		Emitters[1].InitialParticlesPerSecond = default.Emitters[1].InitialParticlesPerSecond;
		Emitters[1].AllParticlesDead = false;
		Emitters[2].ParticlesPerSecond = default.Emitters[2].ParticlesPerSecond;
		Emitters[2].InitialParticlesPerSecond = default.Emitters[2].InitialParticlesPerSecond;
		Emitters[2].AllParticlesDead = false;		
	}
	else
	{
		Emitters[1].ParticlesPerSecond = 0.0000000;
		Emitters[1].InitialParticlesPerSecond = 0.0000000;
		Emitters[2].ParticlesPerSecond = 0.0000000;
		Emitters[2].InitialParticlesPerSecond = 0.0000000;
	}
	SmokeLifeScale = 1.0000000 - (0.5500000 * ((VelMag - float(500)) / float(2000)));
	SmokeLifeScale = FClamp(SmokeLifeScale, 0.4500000, 1.0000000);
	Emitters[0].InitialParticlesPerSecond = 7.5000000 / SmokeLifeScale;
	Emitters[0].ParticlesPerSecond = 7.5000000 / SmokeLifeScale;
	Emitters[0].LifetimeRange.Min = 2.0000000 * SmokeLifeScale;
	Emitters[0].LifetimeRange.Max = 2.0000000 * SmokeLifeScale;
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'Onslaught.ONSDamagedEffect.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseColorScale=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		UseVelocityScale=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=175.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=0))
		ColorScale[1]=(RelativeTime=0.1000000,Color=(R=160,G=160,B=160,A=255))
		ColorScale[2]=(RelativeTime=0.8000000,Color=(R=128,G=128,B=128,A=192))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=0))
		MaxParticles=50
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=20.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
		StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		ParticlesPerSecond=25.0000000
		InitialParticlesPerSecond=25.0000000
		DrawStyle=1
		Texture=Texture'AW-2004Particles.Weapons.DustSmoke'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=2.5000000,Max=1.5000000)
		StartVelocityRange=(X=(Min=-100.0000000,Max=100.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=200.0000000,Max=200.0000000))
		VelocityScale[0]=(RelativeTime=0.0000000,RelativeVelocity=(X=0.0000000,Y=0.0000000,Z=0.5000000))
		VelocityScale[1]=(RelativeTime=0.5000000,RelativeVelocity=(X=0.2000000,Y=0.2000000,Z=0.2000000))
		VelocityScale[2]=(RelativeTime=1.0000000,RelativeVelocity=(X=1.0000000,Y=1.0000000,Z=0.2000000))
	end object
	Emitters[0]=SpriteEmitter0
	// Reference: SpriteEmitter'Onslaught.ONSDamagedEffect.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=50.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.5000000,Color=(R=210,G=135,B=34,A=255))
		ColorScale[2]=(RelativeTime=0.6000000,Color=(R=255,G=255,B=255,A=64))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		Opacity=0.5000000
		CoordinateSystem=1
		MaxParticles=4
		StartLocationRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartLocationShape=3
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=0.5000000,RelativeSize=1.2000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
		StartSizeRange=(X=(Min=10.0000000,Max=20.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		ParticlesPerSecond=8.0000000
		InitialParticlesPerSecond=8.0000000
		Texture=Texture'AW-2004Particles.Fire.NapalmSpot'
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=4.0000000,Max=4.0000000))
	end object
	Emitters[1]=SpriteEmitter1
	// Reference: SpriteEmitter'Onslaught.ONSDamagedEffect.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		UseColorScale=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorScale[1]=(RelativeTime=0.2000000,Color=(R=255,G=175,B=9,A=0))
		ColorScale[2]=(RelativeTime=0.4000000,Color=(R=242,G=122,B=13,A=0))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		StartLocationRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7500000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=20.0000000,Max=30.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		ParticlesPerSecond=25.0000000
		InitialParticlesPerSecond=25.0000000
		Texture=Texture'AW-2004Particles.Fire.SmokeFragment'
		LifetimeRange=(Min=0.1500000,Max=0.1500000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=140.0000000,Max=180.0000000))
	end object
	Emitters[2]=SpriteEmitter2
	AutoDestroy=true
	bNoDelete=false
	bHardAttach=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'Onslaught.ONSDamagedEffect.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseColorScale=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	UseVelocityScale=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=175.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=192,B=192,A=0))
	ColorScale[1]=(RelativeTime=0.1000000,Color=(R=160,G=160,B=160,A=255))
	ColorScale[2]=(RelativeTime=0.8000000,Color=(R=128,G=128,B=128,A=192))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=0))
	MaxParticles=50
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=20.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
	StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	ParticlesPerSecond=25.0000000
	InitialParticlesPerSecond=25.0000000
	DrawStyle=1
	Texture=Texture'AW-2004Particles.Weapons.DustSmoke'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=2.5000000,Max=1.5000000)
	StartVelocityRange=(X=(Min=-100.0000000,Max=100.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=200.0000000,Max=200.0000000))
	VelocityScale[0]=(RelativeTime=0.0000000,RelativeVelocity=(X=0.0000000,Y=0.0000000,Z=0.5000000))
	VelocityScale[1]=(RelativeTime=0.5000000,RelativeVelocity=(X=0.2000000,Y=0.2000000,Z=0.2000000))
	VelocityScale[2]=(RelativeTime=1.0000000,RelativeVelocity=(X=1.0000000,Y=1.0000000,Z=0.2000000))
end object
// Reference: SpriteEmitter'Onslaught.ONSDamagedEffect.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=50.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.5000000,Color=(R=210,G=135,B=34,A=255))
	ColorScale[2]=(RelativeTime=0.6000000,Color=(R=255,G=255,B=255,A=64))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	Opacity=0.5000000
	CoordinateSystem=1
	MaxParticles=4
	StartLocationRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartLocationShape=3
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=0.5000000,RelativeSize=1.2000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
	StartSizeRange=(X=(Min=10.0000000,Max=20.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	ParticlesPerSecond=8.0000000
	InitialParticlesPerSecond=8.0000000
	Texture=Texture'AW-2004Particles.Fire.NapalmSpot'
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=4.0000000,Max=4.0000000))
end object
// Reference: SpriteEmitter'Onslaught.ONSDamagedEffect.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	UseColorScale=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorScale[1]=(RelativeTime=0.2000000,Color=(R=255,G=175,B=9,A=0))
	ColorScale[2]=(RelativeTime=0.4000000,Color=(R=242,G=122,B=13,A=0))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	StartLocationRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7500000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=20.0000000,Max=30.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	ParticlesPerSecond=25.0000000
	InitialParticlesPerSecond=25.0000000
	Texture=Texture'AW-2004Particles.Fire.SmokeFragment'
	LifetimeRange=(Min=0.1500000,Max=0.1500000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=140.0000000,Max=180.0000000))
end object
