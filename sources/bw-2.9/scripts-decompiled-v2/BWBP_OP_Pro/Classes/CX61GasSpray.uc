class CX61GasSpray extends DGVEmitter;

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
	// Reference: SpriteEmitter'BWBP_OP_Pro.CX61GasSpray.SpriteEmitter7'
	begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
		UseCollision=true
		UseMaxCollisions=true
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ExtentMultiplier=(X=0.1000000,Y=0.1000000,Z=0.1000000)
		MaxCollisions=(Min=1.0000000,Max=1.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=94,G=114,B=253,A=255))
		ColorScale[1]=(RelativeTime=0.5000000,Color=(R=151,G=255,B=255,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=149,G=255,B=255,A=255))
		FadeOutStartTime=0.1400000
		MaxParticles=4000
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.4000000,RelativeSize=0.3000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=45.0000000,Max=45.0000000),Y=(Min=45.0000000,Max=45.0000000),Z=(Min=45.0000000,Max=45.0000000))
		InitialParticlesPerSecond=80.0000000
		DrawStyle=1
		Texture=Texture'BWBP_OP_Tex.CX61.CX61Gas'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.7500000,Max=0.7500000)
		StartVelocityRange=(X=(Min=1250.0000000,Max=1250.0000000),Y=(Min=-80.0000000,Max=80.0000000),Z=(Min=-80.0000000,Max=80.0000000))
	end object
	Emitters[0]=SpriteEmitter7
	// Reference: MeshEmitter'BWBP_OP_Pro.CX61GasSpray.MeshEmitter0'
	begin object name="MeshEmitter0" class=Engine.MeshEmitter
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
		ColorMultiplierRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.2500000,Max=0.2500000),Z=(Min=0.0000000,Max=0.0000000))
		FadeOutStartTime=0.0400000
		FadeInEndTime=0.0275000
		MaxParticles=2000
		StartLocationOffset=(X=80.0000000,Y=0.0000000,Z=0.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.4000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=1.0000000,Max=1.5000000),Y=(Min=1.0000000,Max=1.5000000),Z=(Min=1.0000000,Max=1.5000000))
		InitialParticlesPerSecond=20.0000000
		DrawStyle=5
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.3700000,Max=0.3700000)
		StartVelocityRange=(X=(Min=1250.0000000,Max=1250.0000000),Y=(Min=-40.0000000,Max=40.0000000),Z=(Min=-40.0000000,Max=40.0000000))
	end object
	Emitters[1]=MeshEmitter0
	AutoDestroy=true
	bHardAttach=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_OP_Pro.CX61GasSpray.SpriteEmitter7'
begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
	UseCollision=true
	UseMaxCollisions=true
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ExtentMultiplier=(X=0.1000000,Y=0.1000000,Z=0.1000000)
	MaxCollisions=(Min=1.0000000,Max=1.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=94,G=114,B=253,A=255))
	ColorScale[1]=(RelativeTime=0.5000000,Color=(R=151,G=255,B=255,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=149,G=255,B=255,A=255))
	FadeOutStartTime=0.1400000
	MaxParticles=4000
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.4000000,RelativeSize=0.3000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=45.0000000,Max=45.0000000),Y=(Min=45.0000000,Max=45.0000000),Z=(Min=45.0000000,Max=45.0000000))
	InitialParticlesPerSecond=80.0000000
	DrawStyle=1
	Texture=Texture'BWBP_OP_Tex.CX61.CX61Gas'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.7500000,Max=0.7500000)
	StartVelocityRange=(X=(Min=1250.0000000,Max=1250.0000000),Y=(Min=-80.0000000,Max=80.0000000),Z=(Min=-80.0000000,Max=80.0000000))
end object
// Reference: MeshEmitter'BWBP_OP_Pro.CX61GasSpray.MeshEmitter0'
begin object name="MeshEmitter0" class=Engine.MeshEmitter
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
	ColorMultiplierRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.2500000,Max=0.2500000),Z=(Min=0.0000000,Max=0.0000000))
	FadeOutStartTime=0.0400000
	FadeInEndTime=0.0275000
	MaxParticles=2000
	StartLocationOffset=(X=80.0000000,Y=0.0000000,Z=0.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.4000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=1.0000000,Max=1.5000000),Y=(Min=1.0000000,Max=1.5000000),Z=(Min=1.0000000,Max=1.5000000))
	InitialParticlesPerSecond=20.0000000
	DrawStyle=5
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.3700000,Max=0.3700000)
	StartVelocityRange=(X=(Min=1250.0000000,Max=1250.0000000),Y=(Min=-40.0000000,Max=40.0000000),Z=(Min=-40.0000000,Max=40.0000000))
end object
