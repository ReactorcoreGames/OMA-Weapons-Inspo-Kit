class RX22ASpray extends DGVEmitter;

simulated function SetFlameRange(float Range)
{
	local int i;

	// End:0x62
	if((Range > float(1800)) && Emitters[0].UseCollision)
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
	// End:0xE9
	if(Owner == none)
	{
		return;
	}
	AlignVelocity();
	i = 0;
	J0xF6:

	// End:0x242 [Loop If]
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
		goto J0xF6;
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
	// Reference: SpriteEmitter'BallisticProV55.RX22ASpray.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseCollision=true
		UseMaxCollisions=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-75.0000000)
		ExtentMultiplier=(X=0.1000000,Y=0.1000000,Z=0.1000000)
		MaxCollisions=(Min=1.0000000,Max=1.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.5000000,Max=0.5000000))
		FadeOutStartTime=0.4884000
		FadeInEndTime=0.0660000
		MaxParticles=3000
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
		SizeScale[1]=(RelativeTime=0.6100000,RelativeSize=0.7500000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.5500000)
		StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
		InitialParticlesPerSecond=45.4540000
		Texture=Texture'BW_Core_WeaponTex.Particles.BlazingSubdivide'
		TextureUSubdivisions=4
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.6600000,Max=0.6600000)
		StartVelocityRange=(X=(Min=2250.0000000,Max=2700.0000000),Y=(Min=-120.0000000,Max=120.0000000),Z=(Min=-65.0000000,Max=120.0000000))
	end object
	Emitters[0]=SpriteEmitter0
	// Reference: MeshEmitter'BallisticProV55.RX22ASpray.MeshEmitter0'
	begin object name="MeshEmitter0" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.R78.RifleMuzzleFlash'
		UseMeshBlendMode=false
		RenderTwoSided=true
		UseParticleColor=true
		UseCollision=true
		UseMaxCollisions=true
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ExtentMultiplier=(X=0.1000000,Y=0.1000000,Z=0.1000000)
		MaxCollisions=(Min=1.0000000,Max=1.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=64,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.3321430,Color=(R=255,G=255,B=255,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=192,B=64,A=255))
		FadeOutStartTime=0.3780000
		FadeInEndTime=0.0660000
		MaxParticles=4000
		StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.8000000)
		StartSizeRange=(X=(Min=2.5000000,Max=2.5000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
		InitialParticlesPerSecond=66.6670000
		DrawStyle=6
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.6000000,Max=0.6000000)
		StartVelocityRange=(X=(Min=3000.0000000,Max=3000.0000000),Y=(Min=-15.0000000,Max=15.0000000),Z=(Min=-15.0000000,Max=15.0000000))
	end object
	Emitters[1]=MeshEmitter0
	// Reference: SparkEmitter'BallisticProV55.RX22ASpray.SparkEmitter0'
	begin object name="SparkEmitter0" class=Engine.SparkEmitter
		LineSegmentsRange=(Min=1.0000000,Max=2.0000000)
		TimeBetweenSegmentsRange=(Min=0.1000000,Max=0.1000000)
		UseColorScale=true
		FadeOut=true
		Disabled=true
		Backup_Disabled=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-75.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=128,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.4142860,Color=(R=255,G=192,B=96,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=0,A=255))
		FadeOutStartTime=0.3840000
		MaxParticles=100
		Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.6000000,Max=0.6000000)
		StartVelocityRange=(X=(Min=2700.0000000,Max=3750.0000000),Y=(Min=-90.0000000,Max=90.0000000),Z=(Min=-90.0000000,Max=90.0000000))
	end object
	Emitters[2]=SparkEmitter0
	// Reference: SpriteEmitter'BallisticProV55.RX22ASpray.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		UseCollision=true
		UseMaxCollisions=true
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
		MaxCollisions=(Min=1.0000000,Max=1.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=128,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.2892860,Color=(R=255,G=255,B=255,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=0,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.5000000,Max=0.5000000))
		Opacity=0.7700000
		FadeOutStartTime=0.3720000
		FadeInEndTime=0.1440000
		MaxParticles=1500
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1700000)
		SizeScale[1]=(RelativeTime=0.5500000,RelativeSize=0.7500000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.3000000)
		StartSizeRange=(X=(Min=100.0000000,Max=140.0000000),Y=(Min=100.0000000,Max=140.0000000),Z=(Min=100.0000000,Max=140.0000000))
		InitialParticlesPerSecond=25.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.6000000,Max=0.6000000)
		StartVelocityRange=(X=(Min=2700.0000000,Max=3300.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
	end object
	Emitters[3]=SpriteEmitter1
	// Reference: SpriteEmitter'BallisticProV55.RX22ASpray.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		UseCollision=true
		UseMaxCollisions=true
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		Disabled=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		ExtentMultiplier=(X=0.1000000,Y=0.1000000,Z=0.1000000)
		MaxCollisions=(Min=1.0000000,Max=1.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=64,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.3428570,Color=(R=255,G=255,B=255,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.5000000,Max=0.5000000))
		Opacity=0.8000000
		FadeOutStartTime=0.4200000
		FadeInEndTime=0.1080000
		MaxParticles=3000
		SpinCCWorCW=(X=1.0000000,Y=0.5000000,Z=0.5000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.3000000)
		SizeScale[1]=(RelativeTime=0.6200000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=0.8700000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=60.0000000,Max=80.0000000),Y=(Min=60.0000000,Max=80.0000000),Z=(Min=60.0000000,Max=80.0000000))
		InitialParticlesPerSecond=50.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlameParts'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.6000000,Max=0.6000000)
		StartVelocityRange=(X=(Min=2700.0000000,Max=3000.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[4]=SpriteEmitter2
	AutoDestroy=true
	bHardAttach=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.RX22ASpray.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseCollision=true
	UseMaxCollisions=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-75.0000000)
	ExtentMultiplier=(X=0.1000000,Y=0.1000000,Z=0.1000000)
	MaxCollisions=(Min=1.0000000,Max=1.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.5000000,Max=0.5000000))
	FadeOutStartTime=0.4884000
	FadeInEndTime=0.0660000
	MaxParticles=3000
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
	SizeScale[1]=(RelativeTime=0.6100000,RelativeSize=0.7500000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.5500000)
	StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
	InitialParticlesPerSecond=45.4540000
	Texture=Texture'BW_Core_WeaponTex.Particles.BlazingSubdivide'
	TextureUSubdivisions=4
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.6600000,Max=0.6600000)
	StartVelocityRange=(X=(Min=2250.0000000,Max=2700.0000000),Y=(Min=-120.0000000,Max=120.0000000),Z=(Min=-65.0000000,Max=120.0000000))
end object
// Reference: MeshEmitter'BallisticProV55.RX22ASpray.MeshEmitter0'
begin object name="MeshEmitter0" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.R78.RifleMuzzleFlash'
	UseMeshBlendMode=false
	RenderTwoSided=true
	UseParticleColor=true
	UseCollision=true
	UseMaxCollisions=true
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ExtentMultiplier=(X=0.1000000,Y=0.1000000,Z=0.1000000)
	MaxCollisions=(Min=1.0000000,Max=1.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=64,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.3321430,Color=(R=255,G=255,B=255,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=192,B=64,A=255))
	FadeOutStartTime=0.3780000
	FadeInEndTime=0.0660000
	MaxParticles=4000
	StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.8000000)
	StartSizeRange=(X=(Min=2.5000000,Max=2.5000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	InitialParticlesPerSecond=66.6670000
	DrawStyle=6
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.6000000,Max=0.6000000)
	StartVelocityRange=(X=(Min=3000.0000000,Max=3000.0000000),Y=(Min=-15.0000000,Max=15.0000000),Z=(Min=-15.0000000,Max=15.0000000))
end object
// Reference: SparkEmitter'BallisticProV55.RX22ASpray.SparkEmitter0'
begin object name="SparkEmitter0" class=Engine.SparkEmitter
	LineSegmentsRange=(Min=1.0000000,Max=2.0000000)
	TimeBetweenSegmentsRange=(Min=0.1000000,Max=0.1000000)
	UseColorScale=true
	FadeOut=true
	Disabled=true
	Backup_Disabled=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-75.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=128,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.4142860,Color=(R=255,G=192,B=96,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=0,A=255))
	FadeOutStartTime=0.3840000
	MaxParticles=100
	Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.6000000,Max=0.6000000)
	StartVelocityRange=(X=(Min=2700.0000000,Max=3750.0000000),Y=(Min=-90.0000000,Max=90.0000000),Z=(Min=-90.0000000,Max=90.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RX22ASpray.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	UseCollision=true
	UseMaxCollisions=true
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
	MaxCollisions=(Min=1.0000000,Max=1.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=128,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.2892860,Color=(R=255,G=255,B=255,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=0,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.5000000,Max=0.5000000))
	Opacity=0.7700000
	FadeOutStartTime=0.3720000
	FadeInEndTime=0.1440000
	MaxParticles=1500
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1700000)
	SizeScale[1]=(RelativeTime=0.5500000,RelativeSize=0.7500000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.3000000)
	StartSizeRange=(X=(Min=100.0000000,Max=140.0000000),Y=(Min=100.0000000,Max=140.0000000),Z=(Min=100.0000000,Max=140.0000000))
	InitialParticlesPerSecond=25.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.6000000,Max=0.6000000)
	StartVelocityRange=(X=(Min=2700.0000000,Max=3300.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RX22ASpray.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	UseCollision=true
	UseMaxCollisions=true
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	Disabled=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	ExtentMultiplier=(X=0.1000000,Y=0.1000000,Z=0.1000000)
	MaxCollisions=(Min=1.0000000,Max=1.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=64,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.3428570,Color=(R=255,G=255,B=255,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.5000000,Max=0.5000000))
	Opacity=0.8000000
	FadeOutStartTime=0.4200000
	FadeInEndTime=0.1080000
	MaxParticles=3000
	SpinCCWorCW=(X=1.0000000,Y=0.5000000,Z=0.5000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.3000000)
	SizeScale[1]=(RelativeTime=0.6200000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=0.8700000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=60.0000000,Max=80.0000000),Y=(Min=60.0000000,Max=80.0000000),Z=(Min=60.0000000,Max=80.0000000))
	InitialParticlesPerSecond=50.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlameParts'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.6000000,Max=0.6000000)
	StartVelocityRange=(X=(Min=2700.0000000,Max=3000.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
