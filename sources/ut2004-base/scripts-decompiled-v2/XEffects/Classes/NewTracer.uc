class NewTracer extends Emitter;

simulated function SpawnParticle(int Amount)
{
	local PlayerController PC;
	local Vector Dir, LineDir, LinePos, RealLocation;

	super.SpawnParticle(Amount);
	// End:0x2C
	if((Instigator == none) || Instigator.IsFirstPerson())
	{
		return;
	}
	PC = Level.GetLocalPlayerController();
	// End:0x195
	if((PC != none) && PC.Pawn != none)
	{
		Dir.X = Emitters[0].StartVelocityRange.X.Min;
		Dir.Y = Emitters[0].StartVelocityRange.Y.Min;
		Dir.Z = Emitters[0].StartVelocityRange.Z.Min;
		Dir = Normal(Dir);
		LinePos = Location + ((Dir Dot (PC.Pawn.Location - Location)) * Dir);
		LineDir = PC.Pawn.Location - LinePos;
		// End:0x195
		if(VSize(LineDir) < float(150))
		{
			RealLocation = Location;
			SetLocation(LinePos);
			// End:0x17D
			if(FRand() < 0.5000000)
			{
				PlaySound(Sound'XEffects.Impact3Snd',,,, 80.0000000);				
			}
			else
			{
				PlaySound(Sound'XEffects.Impact7Snd',,,, 80.0000000);
			}
			SetLocation(RealLocation);
		}
	}
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'XEffects.NewTracer.SpriteEmitter13'
	begin object name="SpriteEmitter13" class=Engine.SpriteEmitter
		UseDirectionAs=2
		RespawnDeadParticles=false
		UseSizeScale=true
		UseAbsoluteTimeForSizeScale=true
		UseRegularSizeScale=false
		ScaleSizeXByVelocity=true
		AutomaticInitialSpawning=false
		ExtentMultiplier=(X=0.2000000,Y=1.0000000,Z=1.0000000)
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.5000000,Max=0.5000000))
		MaxParticles=100
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.0300000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=100.0000000,Max=100.0000000))
		ScaleSizeByVelocityMultiplier=(X=0.0020000,Y=1.0000000,Z=1.0000000)
		Texture=Texture'AW-2004Particles.Weapons.TracerShot'
		LifetimeRange=(Min=0.1000000,Max=0.1000000)
		StartVelocityRange=(X=(Min=10000.0000000,Max=10000.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[0]=SpriteEmitter13
	bNoDelete=false
	bHardAttach=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'XEffects.NewTracer.SpriteEmitter13'
begin object name="SpriteEmitter13" class=Engine.SpriteEmitter
	UseDirectionAs=2
	RespawnDeadParticles=false
	UseSizeScale=true
	UseAbsoluteTimeForSizeScale=true
	UseRegularSizeScale=false
	ScaleSizeXByVelocity=true
	AutomaticInitialSpawning=false
	ExtentMultiplier=(X=0.2000000,Y=1.0000000,Z=1.0000000)
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.5000000,Max=0.5000000))
	MaxParticles=100
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.0300000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=100.0000000,Max=100.0000000))
	ScaleSizeByVelocityMultiplier=(X=0.0020000,Y=1.0000000,Z=1.0000000)
	Texture=Texture'AW-2004Particles.Weapons.TracerShot'
	LifetimeRange=(Min=0.1000000,Max=0.1000000)
	StartVelocityRange=(X=(Min=10000.0000000,Max=10000.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
