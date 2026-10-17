class RX22AGasSpray extends DGVEmitter;

simulated function SetFlameRange(float Range)
{
	local int i;

	// End:0x62
	if((Range > float(1350)) && Emitters[0].UseCollision)
	{
		i = 0;
		J0x2E:

		// End:0x5F [Loop If]
		if(i < Emitters.Length)
		{
			Emitters[i].UseCollision = false;
			i++;
			// [Loop Continue]
			goto J0x2E;
		}		
	}
	else
	{
		// End:0xB0
		if(!Emitters[0].UseCollision)
		{
			i = 0;
			J0x7F:

			// End:0xB0 [Loop If]
			if(i < Emitters.Length)
			{
				Emitters[i].UseCollision = true;
				i++;
				// [Loop Continue]
				goto J0x7F;
			}
		}
	}
	//return;	
}

event Tick(float dt)
{
	local int i;

	super(Actor).Tick(dt);
	Emitters[1].StartSpinRange.X.Max = float(Rotation.Yaw) / float(65536);
	Emitters[1].StartSpinRange.X.Min = Emitters[1].StartSpinRange.X.Max;
	Emitters[1].StartSpinRange.Y.Max = (float(Rotation.Pitch) / float(65536)) + 0.5000000;
	Emitters[1].StartSpinRange.Y.Min = Emitters[1].StartSpinRange.Y.Max;
	AlignVelocity();
	// End:0x240
	if(Owner != none)
	{
		i = 0;
		J0xF4:

		// End:0x240 [Loop If]
		if(i < Emitters.Length)
		{
			Emitters[i].StartVelocityRange.X.Max += Owner.Velocity.X;
			Emitters[i].StartVelocityRange.X.Min += Owner.Velocity.X;
			Emitters[i].StartVelocityRange.Y.Max += Owner.Velocity.Y;
			Emitters[i].StartVelocityRange.Y.Min += Owner.Velocity.Y;
			Emitters[i].StartVelocityRange.Z.Max += Owner.Velocity.Z;
			Emitters[i].StartVelocityRange.Z.Min += Owner.Velocity.Z;
			i++;
			// [Loop Continue]
			goto J0xF4;
		}
	}
	//return;	
}

simulated function InitDGV()
{
	OldRotation = Rotation;
	super.InitDGV();
	//return;	
}

state Terminated
{
	simulated function BeginState()
	{
		SetTimer(0.1500000, false);
		//return;		
	}

	event Timer()
	{
		Kill();
		//return;		
	}
	stop;	
}

defaultproperties
{
	bVerticalZ=false
	bYIsSpread=false
	// Reference: SpriteEmitter'BallisticProV55.RX22AGasSpray.SpriteEmitter16'
	begin object name="SpriteEmitter16" class=Engine.SpriteEmitter
		UseCollision=true
		UseMaxCollisions=true
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ExtentMultiplier=(X=0.1000000,Y=0.1000000,Z=0.1000000)
		MaxCollisions=(Min=1.0000000,Max=1.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.5000000,Max=0.5000000))
		Opacity=0.6100000
		FadeOutStartTime=0.1400000
		MaxParticles=4000
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1500000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=4.0000000,Max=8.0000000),Y=(Min=4.0000000,Max=8.0000000),Z=(Min=4.0000000,Max=8.0000000))
		InitialParticlesPerSecond=80.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.AquaBubble1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2500000,Max=0.2500000)
		StartVelocityRange=(X=(Min=2900.0000000,Max=3000.0000000),Y=(Min=-80.0000000,Max=80.0000000),Z=(Min=-80.0000000,Max=80.0000000))
	end object
	Emitters[0]=SpriteEmitter16
	// Reference: MeshEmitter'BallisticProV55.RX22AGasSpray.MeshEmitter1'
	begin object name="MeshEmitter1" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.Effects.VolumetricA2'
		UseMeshBlendMode=false
		RenderTwoSided=true
		UseParticleColor=true
		UseCollision=true
		UseMaxCollisions=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ExtentMultiplier=(X=0.1000000,Y=0.1000000,Z=0.1000000)
		MaxCollisions=(Min=1.0000000,Max=1.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=0.8000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.9000000,Max=0.9000000))
		FadeOutStartTime=0.0400000
		FadeInEndTime=0.0275000
		MaxParticles=2000
		StartLocationOffset=(X=80.0000000,Y=0.0000000,Z=0.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.4000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=3.0000000,Max=4.0000000),Y=(Min=2.0000000,Max=3.0000000),Z=(Min=2.0000000,Max=3.0000000))
		InitialParticlesPerSecond=40.0000000
		DrawStyle=5
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2500000,Max=0.2500000)
		StartVelocityRange=(X=(Min=2500.0000000,Max=3000.0000000),Y=(Min=-40.0000000,Max=40.0000000),Z=(Min=-40.0000000,Max=40.0000000))
	end object
	Emitters[1]=MeshEmitter1
	// Reference: SpriteEmitter'BallisticProV55.RX22AGasSpray.SpriteEmitter17'
	begin object name="SpriteEmitter17" class=Engine.SpriteEmitter
		UseCollision=true
		UseMaxCollisions=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		ExtentMultiplier=(X=0.1000000,Y=0.1000000,Z=0.1000000)
		MaxCollisions=(Min=1.0000000,Max=1.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.3000000,Max=0.3000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.1000000,Max=0.1000000))
		Opacity=0.5700000
		FadeOutStartTime=0.0600000
		MaxParticles=2000
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=40.0000000,Max=40.0000000),Z=(Min=40.0000000,Max=40.0000000))
		InitialParticlesPerSecond=40.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.FlamePartsAlpha'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
		StartVelocityRange=(X=(Min=2500.0000000,Max=3000.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
	end object
	Emitters[2]=SpriteEmitter17
	AutoDestroy=true
	bHardAttach=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.RX22AGasSpray.SpriteEmitter16'
begin object name="SpriteEmitter16" class=Engine.SpriteEmitter
	UseCollision=true
	UseMaxCollisions=true
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ExtentMultiplier=(X=0.1000000,Y=0.1000000,Z=0.1000000)
	MaxCollisions=(Min=1.0000000,Max=1.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.5000000,Max=0.5000000))
	Opacity=0.6100000
	FadeOutStartTime=0.1400000
	MaxParticles=4000
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1500000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=4.0000000,Max=8.0000000),Y=(Min=4.0000000,Max=8.0000000),Z=(Min=4.0000000,Max=8.0000000))
	InitialParticlesPerSecond=80.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.AquaBubble1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2500000,Max=0.2500000)
	StartVelocityRange=(X=(Min=2900.0000000,Max=3000.0000000),Y=(Min=-80.0000000,Max=80.0000000),Z=(Min=-80.0000000,Max=80.0000000))
end object
// Reference: MeshEmitter'BallisticProV55.RX22AGasSpray.MeshEmitter1'
begin object name="MeshEmitter1" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Effects.VolumetricA2'
	UseMeshBlendMode=false
	RenderTwoSided=true
	UseParticleColor=true
	UseCollision=true
	UseMaxCollisions=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ExtentMultiplier=(X=0.1000000,Y=0.1000000,Z=0.1000000)
	MaxCollisions=(Min=1.0000000,Max=1.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=0.8000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.9000000,Max=0.9000000))
	FadeOutStartTime=0.0400000
	FadeInEndTime=0.0275000
	MaxParticles=2000
	StartLocationOffset=(X=80.0000000,Y=0.0000000,Z=0.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.4000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=3.0000000,Max=4.0000000),Y=(Min=2.0000000,Max=3.0000000),Z=(Min=2.0000000,Max=3.0000000))
	InitialParticlesPerSecond=40.0000000
	DrawStyle=5
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2500000,Max=0.2500000)
	StartVelocityRange=(X=(Min=2500.0000000,Max=3000.0000000),Y=(Min=-40.0000000,Max=40.0000000),Z=(Min=-40.0000000,Max=40.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RX22AGasSpray.SpriteEmitter17'
begin object name="SpriteEmitter17" class=Engine.SpriteEmitter
	UseCollision=true
	UseMaxCollisions=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	ExtentMultiplier=(X=0.1000000,Y=0.1000000,Z=0.1000000)
	MaxCollisions=(Min=1.0000000,Max=1.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.3000000,Max=0.3000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.1000000,Max=0.1000000))
	Opacity=0.5700000
	FadeOutStartTime=0.0600000
	MaxParticles=2000
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=40.0000000,Max=40.0000000),Z=(Min=40.0000000,Max=40.0000000))
	InitialParticlesPerSecond=40.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.FlamePartsAlpha'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
	StartVelocityRange=(X=(Min=2500.0000000,Max=3000.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
end object
