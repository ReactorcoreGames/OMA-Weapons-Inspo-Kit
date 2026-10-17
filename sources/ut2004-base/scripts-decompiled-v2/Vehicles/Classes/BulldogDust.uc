class BulldogDust extends Emitter;

var() int MaxSpritePPS;
var() int MaxMeshPPS;

simulated function UpdateDust(KTire t, float DustSlipRate, float DustSlipThresh)
{
	local float SpritePPS, MeshPPS;

	// End:0x103
	if(t.bTireOnGround && t.GroundSlipVel > DustSlipThresh)
	{
		SpritePPS = FMin(DustSlipRate * (t.GroundSlipVel - DustSlipThresh), float(MaxSpritePPS));
		Emitters[0].ParticlesPerSecond = SpritePPS;
		Emitters[0].InitialParticlesPerSecond = SpritePPS;
		Emitters[0].AllParticlesDead = false;
		MeshPPS = FMin(DustSlipRate * (t.GroundSlipVel - DustSlipThresh), float(MaxMeshPPS));
		Emitters[1].ParticlesPerSecond = MeshPPS;
		Emitters[1].InitialParticlesPerSecond = MeshPPS;
		Emitters[1].AllParticlesDead = false;		
	}
	else
	{
		Emitters[0].ParticlesPerSecond = 0.0000000;
		Emitters[0].InitialParticlesPerSecond = 0.0000000;
		Emitters[1].ParticlesPerSecond = 0.0000000;
		Emitters[1].InitialParticlesPerSecond = 0.0000000;
	}
	//return;	
}

defaultproperties
{
	MaxSpritePPS=35
	MaxMeshPPS=35
	// Reference: SpriteEmitter'Vehicles.BulldogDust.SpriteEmitter1'
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
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
		DrawStyle=1
		Texture=Texture'VehicleFX.Particles.DustyCloud2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
	end object
	Emitters[0]=SpriteEmitter1
	// Reference: MeshEmitter'Vehicles.BulldogDust.MeshEmitter1'
	begin object name="MeshEmitter1" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'EffectMeshes.Particles.DirtChunk_01aw'
		UseParticleColor=true
		UseCollision=true
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		AlphaTest=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-600.0000000)
		DampingFactorRange=(X=(Min=0.8000000,Max=0.8000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.5000000,Max=0.5000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.8000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=220,G=184,B=109,A=0))
		FadeOutStartTime=2.0000000
		MaxParticles=100
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-24.0000000,Max=24.0000000),Z=(Min=0.0000000,Max=0.0000000))
		UseRotationFrom=1
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0100000),Y=(Min=0.0000000,Max=0.0100000),Z=(Min=0.0000000,Max=0.0100000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.0250000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=0.3000000,Max=1.0000000),Y=(Min=0.3000000,Max=1.0000000),Z=(Min=0.3000000,Max=1.0000000))
		DrawStyle=1
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=3.0000000,Max=3.0000000)
		StartVelocityRange=(X=(Min=120.0000000,Max=120.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=60.0000000,Max=120.0000000))
	end object
	Emitters[1]=MeshEmitter1
	bNoDelete=false
	bHardAttach=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'Vehicles.BulldogDust.SpriteEmitter1'
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
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=50.0000000,Max=50.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
	DrawStyle=1
	Texture=Texture'VehicleFX.Particles.DustyCloud2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
end object
// Reference: MeshEmitter'Vehicles.BulldogDust.MeshEmitter1'
begin object name="MeshEmitter1" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'EffectMeshes.Particles.DirtChunk_01aw'
	UseParticleColor=true
	UseCollision=true
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	AlphaTest=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-600.0000000)
	DampingFactorRange=(X=(Min=0.8000000,Max=0.8000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.5000000,Max=0.5000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.8000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=220,G=184,B=109,A=0))
	FadeOutStartTime=2.0000000
	MaxParticles=100
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-24.0000000,Max=24.0000000),Z=(Min=0.0000000,Max=0.0000000))
	UseRotationFrom=1
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0100000),Y=(Min=0.0000000,Max=0.0100000),Z=(Min=0.0000000,Max=0.0100000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.0250000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=0.3000000,Max=1.0000000),Y=(Min=0.3000000,Max=1.0000000),Z=(Min=0.3000000,Max=1.0000000))
	DrawStyle=1
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=3.0000000,Max=3.0000000)
	StartVelocityRange=(X=(Min=120.0000000,Max=120.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=60.0000000,Max=120.0000000))
end object
