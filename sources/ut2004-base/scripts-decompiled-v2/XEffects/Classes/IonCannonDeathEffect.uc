class IonCannonDeathEffect extends Emitter;

var Sound ExplosionSound[11];
var byte bPlayed[11];

simulated function PlayUniqueRandomExplosion()
{
	local int Num;

	Num = int(float(Rand(42)) % float(11));
	// End:0x2F
	if(int(bPlayed[Num]) > 0)
	{
		PlayUniqueRandomExplosion();
		return;
	}
	PlaySound(ExplosionSound[Num],, 4.0000000,, 1600.0000000);
	bPlayed[Num] = 1;
	//return;	
}

auto state Explosion
{Begin:

	PlayUniqueRandomExplosion();
	PlayUniqueRandomExplosion();
	Sleep(0.3300000);
	PlayUniqueRandomExplosion();
	stop;		
}

defaultproperties
{
	ExplosionSound[0]=Sound'ONSVehicleSounds-S.Explosions.Explosion01'
	ExplosionSound[1]=Sound'ONSVehicleSounds-S.Explosions.Explosion02'
	ExplosionSound[2]=Sound'ONSVehicleSounds-S.Explosions.Explosion03'
	ExplosionSound[3]=Sound'ONSVehicleSounds-S.Explosions.Explosion04'
	ExplosionSound[4]=Sound'ONSVehicleSounds-S.Explosions.Explosion05'
	ExplosionSound[5]=Sound'ONSVehicleSounds-S.Explosions.Explosion06'
	ExplosionSound[6]=Sound'ONSVehicleSounds-S.Explosions.Explosion07'
	ExplosionSound[7]=Sound'ONSVehicleSounds-S.Explosions.Explosion08'
	ExplosionSound[8]=Sound'ONSVehicleSounds-S.Explosions.Explosion09'
	ExplosionSound[9]=Sound'ONSVehicleSounds-S.Explosions.Explosion10'
	ExplosionSound[10]=Sound'ONSVehicleSounds-S.Explosions.Explosion11'
	// Reference: SpriteEmitter'XEffects.IonCannonDeathEffect.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		RespawnDeadParticles=false
		AutoDestroy=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.6000000,Max=0.6000000),Z=(Min=1.0000000,Max=1.0000000))
		MaxParticles=1
		StartLocationOffset=(X=150.0000000,Y=0.0000000,Z=350.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.5000000,RelativeSize=0.3000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
		InitialParticlesPerSecond=500.0000000
		Texture=Texture'AW-2004Particles.Energy.PurpleSwell'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[0]=SpriteEmitter1
	// Reference: SpriteEmitter'XEffects.IonCannonDeathEffect.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		RespawnDeadParticles=false
		AutoDestroy=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.6000000,Max=0.6000000),Z=(Min=1.0000000,Max=1.0000000))
		Opacity=0.5000000
		MaxParticles=30
		StartLocationOffset=(X=150.0000000,Y=0.0000000,Z=200.0000000)
		StartLocationRange=(X=(Min=-500.0000000,Max=500.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartLocationShape=3
		SphereRadiusRange=(Min=400.0000000,Max=500.0000000)
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
		StartSizeRange=(X=(Min=300.0000000,Max=400.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=500.0000000
		Texture=Texture'ExplosionTex.Framed.exp2_framesP'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
	end object
	Emitters[1]=SpriteEmitter2
	// Reference: SpriteEmitter'XEffects.IonCannonDeathEffect.SpriteEmitter4'
	begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
		UseColorScale=true
		RespawnDeadParticles=false
		AutoDestroy=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[1]=(RelativeTime=0.8000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		MaxParticles=15
		StartLocationOffset=(X=150.0000000,Y=0.0000000,Z=350.0000000)
		StartLocationRange=(X=(Min=-600.0000000,Max=600.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=-100.0000000,Max=100.0000000))
		StartLocationShape=3
		SphereRadiusRange=(Min=600.0000000,Max=800.0000000)
		UseRotationFrom=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
		StartSizeRange=(X=(Min=300.0000000,Max=400.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=100.0000000
		Texture=Texture'ExplosionTex.Framed.exp2_framesP'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2000000,Max=0.4000000)
		InitialDelayRange=(Min=0.1500000,Max=0.1500000)
	end object
	Emitters[2]=SpriteEmitter4
	// Reference: BeamEmitter'XEffects.IonCannonDeathEffect.BeamEmitter0'
	begin object name="BeamEmitter0" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=2000.0000000,Max=4000.0000000)
		DetermineEndPointBy=1
		LowFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
		HighFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-80.0000000,Max=80.0000000),Z=(Min=-80.0000000,Max=80.0000000))
		RespawnDeadParticles=false
		AutoDestroy=true
		AutomaticInitialSpawning=false
		ColorMultiplierRange=(X=(Min=0.8000000,Max=0.8000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.8000000,Max=0.8000000))
		Opacity=0.2000000
		MaxParticles=50
		StartLocationOffset=(X=100.0000000,Y=0.0000000,Z=336.0000000)
		UseRotationFrom=1
		StartSizeRange=(X=(Min=5.0000000,Max=200.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=80.0000000
		Texture=Texture'AW-2004Particles.Energy.PowerBolt'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
		InitialDelayRange=(Min=0.3000000,Max=0.3000000)
		StartVelocityRange=(X=(Min=300.0000000,Max=600.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=-100.0000000,Max=100.0000000))
	end object
	Emitters[3]=BeamEmitter0
	// Reference: BeamEmitter'XEffects.IonCannonDeathEffect.BeamEmitter1'
	begin object name="BeamEmitter1" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=300.0000000,Max=600.0000000)
		DetermineEndPointBy=1
		LowFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-20.0000000,Max=-100.0000000),Z=(Min=-50.0000000,Max=50.0000000))
		HighFrequencyNoiseRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
		NoiseDeterminesEndPoint=true
		RespawnDeadParticles=false
		AutoDestroy=true
		AutomaticInitialSpawning=false
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=1.0000000,Max=1.0000000))
		MaxParticles=20
		StartLocationOffset=(X=-860.0000000,Y=-140.0000000,Z=288.0000000)
		StartLocationRange=(X=(Min=-10.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-80.0000000,Max=10.0000000))
		StartLocationShape=1
		UseRotationFrom=1
		StartSizeRange=(X=(Min=-25.0000000,Max=25.0000000),Y=(Min=100.0000000,Max=-100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=30.0000000
		Texture=Texture'EpicParticles.Beams.HotBolt03aw'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.1000000,Max=0.2000000)
		InitialDelayRange=(Min=0.3000000,Max=0.3500000)
		StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[4]=BeamEmitter1
	// Reference: BeamEmitter'XEffects.IonCannonDeathEffect.BeamEmitter3'
	begin object name="BeamEmitter3" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=300.0000000,Max=800.0000000)
		DetermineEndPointBy=1
		LowFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=40.0000000,Max=150.0000000),Z=(Min=-50.0000000,Max=50.0000000))
		HighFrequencyNoiseRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
		NoiseDeterminesEndPoint=true
		RespawnDeadParticles=false
		AutoDestroy=true
		AutomaticInitialSpawning=false
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=1.0000000,Max=1.0000000))
		MaxParticles=25
		StartLocationOffset=(X=-780.0000000,Y=86.0000000,Z=288.0000000)
		StartLocationRange=(X=(Min=-10.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-80.0000000,Max=10.0000000))
		StartLocationShape=1
		UseRotationFrom=1
		StartSizeRange=(X=(Min=-25.0000000,Max=25.0000000),Y=(Min=100.0000000,Max=-100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=30.0000000
		Texture=Texture'EpicParticles.Beams.HotBolt03aw'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.1000000,Max=0.1500000)
		InitialDelayRange=(Min=0.3000000,Max=0.3500000)
		StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=-0.3000000,Max=-0.3000000),Z=(Min=0.1000000,Max=0.1000000))
	end object
	Emitters[5]=BeamEmitter3
	// Reference: BeamEmitter'XEffects.IonCannonDeathEffect.BeamEmitter10'
	begin object name="BeamEmitter10" class=Engine.BeamEmitter
		BeamDistanceRange=(Min=900.0000000,Max=930.0000000)
		DetermineEndPointBy=1
		BeamTextureUScale=2.0000000
		LowFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-20.0000000,Max=100.0000000))
		HighFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=-30.0000000,Max=30.0000000))
		UseColorScale=true
		RespawnDeadParticles=false
		AutoDestroy=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.3000000,Max=0.7000000),Z=(Min=1.0000000,Max=1.0000000))
		MaxParticles=20
		StartLocationOffset=(X=240.0000000,Y=-30.0000000,Z=220.0000000)
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
		UseRotationFrom=1
		StartSizeRange=(X=(Min=10.0000000,Max=30.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=30.0000000
		Texture=Texture'EpicParticles.Beams.HotBolt03aw'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.1000000,Max=0.2000000)
		InitialDelayRange=(Min=0.3000000,Max=0.3000000)
		StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-0.3000000,Max=-0.3000000))
	end object
	Emitters[6]=BeamEmitter10
	// Reference: MeshEmitter'XEffects.IonCannonDeathEffect.MeshEmitter0'
	begin object name="MeshEmitter0" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'AW-2004Particles.Weapons.PlasmaSphere'
		UseParticleColor=true
		UseColorScale=true
		RespawnDeadParticles=false
		AutoDestroy=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[1]=(RelativeTime=0.7000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
		Opacity=0.5000000
		MaxParticles=1
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=115.0000000)
		UseRotationFrom=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=10.0000000)
		StartSizeRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		InitialParticlesPerSecond=5000.0000000
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.7000000,Max=0.7000000)
	end object
	Emitters[7]=MeshEmitter0
	AutoDestroy=true
	bNoDelete=false
	AmbientGlow=254
	bDirectional=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'XEffects.IonCannonDeathEffect.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	RespawnDeadParticles=false
	AutoDestroy=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.6000000,Max=0.6000000),Z=(Min=1.0000000,Max=1.0000000))
	MaxParticles=1
	StartLocationOffset=(X=150.0000000,Y=0.0000000,Z=350.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.5000000,RelativeSize=0.3000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
	InitialParticlesPerSecond=500.0000000
	Texture=Texture'AW-2004Particles.Energy.PurpleSwell'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'XEffects.IonCannonDeathEffect.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	RespawnDeadParticles=false
	AutoDestroy=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.6000000,Max=0.6000000),Z=(Min=1.0000000,Max=1.0000000))
	Opacity=0.5000000
	MaxParticles=30
	StartLocationOffset=(X=150.0000000,Y=0.0000000,Z=200.0000000)
	StartLocationRange=(X=(Min=-500.0000000,Max=500.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartLocationShape=3
	SphereRadiusRange=(Min=400.0000000,Max=500.0000000)
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
	StartSizeRange=(X=(Min=300.0000000,Max=400.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=500.0000000
	Texture=Texture'ExplosionTex.Framed.exp2_framesP'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
end object
// Reference: SpriteEmitter'XEffects.IonCannonDeathEffect.SpriteEmitter4'
begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
	UseColorScale=true
	RespawnDeadParticles=false
	AutoDestroy=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[1]=(RelativeTime=0.8000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	MaxParticles=15
	StartLocationOffset=(X=150.0000000,Y=0.0000000,Z=350.0000000)
	StartLocationRange=(X=(Min=-600.0000000,Max=600.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=-100.0000000,Max=100.0000000))
	StartLocationShape=3
	SphereRadiusRange=(Min=600.0000000,Max=800.0000000)
	UseRotationFrom=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
	StartSizeRange=(X=(Min=300.0000000,Max=400.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=100.0000000
	Texture=Texture'ExplosionTex.Framed.exp2_framesP'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2000000,Max=0.4000000)
	InitialDelayRange=(Min=0.1500000,Max=0.1500000)
end object
// Reference: BeamEmitter'XEffects.IonCannonDeathEffect.BeamEmitter0'
begin object name="BeamEmitter0" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=2000.0000000,Max=4000.0000000)
	DetermineEndPointBy=1
	LowFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
	HighFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-80.0000000,Max=80.0000000),Z=(Min=-80.0000000,Max=80.0000000))
	RespawnDeadParticles=false
	AutoDestroy=true
	AutomaticInitialSpawning=false
	ColorMultiplierRange=(X=(Min=0.8000000,Max=0.8000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.8000000,Max=0.8000000))
	Opacity=0.2000000
	MaxParticles=50
	StartLocationOffset=(X=100.0000000,Y=0.0000000,Z=336.0000000)
	UseRotationFrom=1
	StartSizeRange=(X=(Min=5.0000000,Max=200.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=80.0000000
	Texture=Texture'AW-2004Particles.Energy.PowerBolt'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
	InitialDelayRange=(Min=0.3000000,Max=0.3000000)
	StartVelocityRange=(X=(Min=300.0000000,Max=600.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=-100.0000000,Max=100.0000000))
end object
// Reference: BeamEmitter'XEffects.IonCannonDeathEffect.BeamEmitter1'
begin object name="BeamEmitter1" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=300.0000000,Max=600.0000000)
	DetermineEndPointBy=1
	LowFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-20.0000000,Max=-100.0000000),Z=(Min=-50.0000000,Max=50.0000000))
	HighFrequencyNoiseRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
	NoiseDeterminesEndPoint=true
	RespawnDeadParticles=false
	AutoDestroy=true
	AutomaticInitialSpawning=false
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=1.0000000,Max=1.0000000))
	MaxParticles=20
	StartLocationOffset=(X=-860.0000000,Y=-140.0000000,Z=288.0000000)
	StartLocationRange=(X=(Min=-10.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-80.0000000,Max=10.0000000))
	StartLocationShape=1
	UseRotationFrom=1
	StartSizeRange=(X=(Min=-25.0000000,Max=25.0000000),Y=(Min=100.0000000,Max=-100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=30.0000000
	Texture=Texture'EpicParticles.Beams.HotBolt03aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.1000000,Max=0.2000000)
	InitialDelayRange=(Min=0.3000000,Max=0.3500000)
	StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: BeamEmitter'XEffects.IonCannonDeathEffect.BeamEmitter3'
begin object name="BeamEmitter3" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=300.0000000,Max=800.0000000)
	DetermineEndPointBy=1
	LowFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=40.0000000,Max=150.0000000),Z=(Min=-50.0000000,Max=50.0000000))
	HighFrequencyNoiseRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
	NoiseDeterminesEndPoint=true
	RespawnDeadParticles=false
	AutoDestroy=true
	AutomaticInitialSpawning=false
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=1.0000000,Max=1.0000000))
	MaxParticles=25
	StartLocationOffset=(X=-780.0000000,Y=86.0000000,Z=288.0000000)
	StartLocationRange=(X=(Min=-10.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-80.0000000,Max=10.0000000))
	StartLocationShape=1
	UseRotationFrom=1
	StartSizeRange=(X=(Min=-25.0000000,Max=25.0000000),Y=(Min=100.0000000,Max=-100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=30.0000000
	Texture=Texture'EpicParticles.Beams.HotBolt03aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.1000000,Max=0.1500000)
	InitialDelayRange=(Min=0.3000000,Max=0.3500000)
	StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=-0.3000000,Max=-0.3000000),Z=(Min=0.1000000,Max=0.1000000))
end object
// Reference: BeamEmitter'XEffects.IonCannonDeathEffect.BeamEmitter10'
begin object name="BeamEmitter10" class=Engine.BeamEmitter
	BeamDistanceRange=(Min=900.0000000,Max=930.0000000)
	DetermineEndPointBy=1
	BeamTextureUScale=2.0000000
	LowFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-20.0000000,Max=100.0000000))
	HighFrequencyNoiseRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=-30.0000000,Max=30.0000000))
	UseColorScale=true
	RespawnDeadParticles=false
	AutoDestroy=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.3000000,Max=0.7000000),Z=(Min=1.0000000,Max=1.0000000))
	MaxParticles=20
	StartLocationOffset=(X=240.0000000,Y=-30.0000000,Z=220.0000000)
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
	UseRotationFrom=1
	StartSizeRange=(X=(Min=10.0000000,Max=30.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=30.0000000
	Texture=Texture'EpicParticles.Beams.HotBolt03aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.1000000,Max=0.2000000)
	InitialDelayRange=(Min=0.3000000,Max=0.3000000)
	StartVelocityRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-0.3000000,Max=-0.3000000))
end object
// Reference: MeshEmitter'XEffects.IonCannonDeathEffect.MeshEmitter0'
begin object name="MeshEmitter0" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'AW-2004Particles.Weapons.PlasmaSphere'
	UseParticleColor=true
	UseColorScale=true
	RespawnDeadParticles=false
	AutoDestroy=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[1]=(RelativeTime=0.7000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=0))
	Opacity=0.5000000
	MaxParticles=1
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=115.0000000)
	UseRotationFrom=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=10.0000000)
	StartSizeRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	InitialParticlesPerSecond=5000.0000000
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.7000000,Max=0.7000000)
end object
