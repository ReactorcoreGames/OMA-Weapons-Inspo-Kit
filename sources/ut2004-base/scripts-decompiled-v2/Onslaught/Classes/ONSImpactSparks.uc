class ONSImpactSparks extends Emitter
	native;

var() float HorizontalVelocityRange;
var() float AdditionalVelocityScale;
var() float MaxAdditionalVelocity;
var() float SparkRadiusScale;
var() InterpCurve SparkRate;
var() Sound ScrapeSound;
var bool bSparksActive;

simulated event UpdateSparks(float SparkRadius, Vector VehicleVelocity)
{
	local float UseRadius, VelMag, ParticleRate;
	local Vector LocalVehVel, AddVel;

	VelMag = VSize(VehicleVelocity);
	ParticleRate = InterpCurveEval(SparkRate, VelMag);
	// End:0x26D
	if(ParticleRate > 0.0010000)
	{
		LocalVehVel = VehicleVelocity << Rotation;
		LocalVehVel.X = 0.0000000;
		// End:0x6B
		if(!bSparksActive)
		{
			OldLocation = Location;
		}
		bSparksActive = true;
		UseRadius = SparkRadiusScale * SparkRadius;
		Emitters[0].ParticlesPerSecond = ParticleRate;
		Emitters[0].InitialParticlesPerSecond = ParticleRate;
		Emitters[0].AllParticlesDead = false;
		Emitters[0].StartLocationRange.Y.Min = -UseRadius;
		Emitters[0].StartLocationRange.Y.Max = UseRadius;
		Emitters[0].StartLocationRange.Z.Min = -UseRadius;
		Emitters[0].StartLocationRange.Z.Max = UseRadius;
		AddVel = AdditionalVelocityScale * LocalVehVel;
		// End:0x17F
		if(VSize(AddVel) > MaxAdditionalVelocity)
		{
			AddVel = Normal(AddVel) * MaxAdditionalVelocity;
		}
		Emitters[0].StartVelocityRange.Y.Min = (LocalVehVel.Y + AddVel.Y) - HorizontalVelocityRange;
		Emitters[0].StartVelocityRange.Y.Max = (LocalVehVel.Y + AddVel.Y) + HorizontalVelocityRange;
		Emitters[0].StartVelocityRange.Z.Min = (LocalVehVel.Z + AddVel.Z) - HorizontalVelocityRange;
		Emitters[0].StartVelocityRange.Z.Max = (LocalVehVel.Z + AddVel.Z) + HorizontalVelocityRange;
		AmbientSound = ScrapeSound;		
	}
	else
	{
		bSparksActive = false;
		Emitters[0].ParticlesPerSecond = 0.0000000;
		Emitters[0].InitialParticlesPerSecond = 0.0000000;
		AmbientSound = none;
	}
	//return;	
}

defaultproperties
{
	HorizontalVelocityRange=500.0000000
	AdditionalVelocityScale=0.2500000
	MaxAdditionalVelocity=200.0000000
	SparkRadiusScale=0.0500000
	SparkRate=(Points=((InVal=0.0000000,OutVal=0.0000000),(InVal=350.0000000,OutVal=0.0000000),(InVal=1200.0000000,OutVal=600.0000000),(InVal=100000.0000000,OutVal=600.0000000)))
	ScrapeSound=Sound'ONSVehicleSounds-S.CollisionSounds.MetalScrape03'
	// Reference: SpriteEmitter'Onslaught.ONSImpactSparks.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ScaleSizeYByVelocity=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-600.0000000)
		DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.1000000,Max=0.1000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=174,A=0))
		ColorScale[1]=(RelativeTime=0.5000000,Color=(R=242,G=214,B=49,A=0))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=102,G=40,B=0,A=0))
		MaxParticles=1000
		StartLocationRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		UseRotationFrom=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.0500000,RelativeSize=0.0000000)
		SizeScale[2]=(RelativeTime=0.1000000,RelativeSize=2.0000000)
		SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=2.0000000,Max=4.0000000),Y=(Min=2.0000000,Max=2.0000000),Z=(Min=100.0000000,Max=100.0000000))
		ScaleSizeByVelocityMultiplier=(X=0.0100000,Y=0.0030000,Z=1.0000000)
		ScaleSizeByVelocityMax=1000.0000000
		Texture=Texture'AW-2004Particles.Energy.SparkHead'
		LifetimeRange=(Min=0.4000000,Max=0.6000000)
		StartVelocityRange=(X=(Min=350.0000000,Max=500.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
		MaxAbsVelocity=(X=1000.0000000,Y=1000.0000000,Z=1000.0000000)
		VelocityLossRange=(X=(Min=1.0000000,Max=2.0000000),Y=(Min=1.0000000,Max=2.0000000),Z=(Min=1.0000000,Max=2.0000000))
	end object
	Emitters[0]=SpriteEmitter0
	bNoDelete=false
	SoundVolume=80
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'Onslaught.ONSImpactSparks.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ScaleSizeYByVelocity=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-600.0000000)
	DampingFactorRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.1000000,Max=0.1000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=174,A=0))
	ColorScale[1]=(RelativeTime=0.5000000,Color=(R=242,G=214,B=49,A=0))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=102,G=40,B=0,A=0))
	MaxParticles=1000
	StartLocationRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	UseRotationFrom=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.0500000,RelativeSize=0.0000000)
	SizeScale[2]=(RelativeTime=0.1000000,RelativeSize=2.0000000)
	SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=2.0000000,Max=4.0000000),Y=(Min=2.0000000,Max=2.0000000),Z=(Min=100.0000000,Max=100.0000000))
	ScaleSizeByVelocityMultiplier=(X=0.0100000,Y=0.0030000,Z=1.0000000)
	ScaleSizeByVelocityMax=1000.0000000
	Texture=Texture'AW-2004Particles.Energy.SparkHead'
	LifetimeRange=(Min=0.4000000,Max=0.6000000)
	StartVelocityRange=(X=(Min=350.0000000,Max=500.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
	MaxAbsVelocity=(X=1000.0000000,Y=1000.0000000,Z=1000.0000000)
	VelocityLossRange=(X=(Min=1.0000000,Max=2.0000000),Y=(Min=1.0000000,Max=2.0000000),Z=(Min=1.0000000,Max=2.0000000))
end object
