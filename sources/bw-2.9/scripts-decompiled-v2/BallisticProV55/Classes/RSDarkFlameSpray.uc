class RSDarkFlameSpray extends DGVEmitter;

simulated function SetFlameRange(float Range)
{
	local int i;

	// End:0x62
	if((Range > float(600)) && Emitters[0].UseCollision)
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
	Emitters[0].StartSpinRange.X.Max = float(Rotation.Yaw) / float(65536);
	Emitters[0].StartSpinRange.X.Min = Emitters[0].StartSpinRange.X.Max;
	Emitters[0].StartSpinRange.Y.Max = (float(Rotation.Pitch) / float(65536)) + 0.5000000;
	Emitters[0].StartSpinRange.Y.Min = Emitters[0].StartSpinRange.Y.Max;
	// End:0xE9
	if(Owner == none)
	{
		return;
	}
	AlignVelocity();
	i = 0;
	J0xF6:

	// End:0x251 [Loop If]
	if(i < Emitters.Length)
	{
		// End:0x115
		if(i == 4)
		{
			// [Explicit Continue]
			goto J0x247;
		}
		Emitters[i].StartVelocityRange.X.Max += Owner.Velocity.X;
		Emitters[i].StartVelocityRange.X.Min += Owner.Velocity.X;
		Emitters[i].StartVelocityRange.Y.Max += Owner.Velocity.Y;
		Emitters[i].StartVelocityRange.Y.Min += Owner.Velocity.Y;
		Emitters[i].StartVelocityRange.Z.Max += Owner.Velocity.Z;
		Emitters[i].StartVelocityRange.Z.Min += Owner.Velocity.Z;
		J0x247:

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
	DisableDGV[0]=0
	DisableDGV[1]=0
	DisableDGV[2]=0
	DisableDGV[3]=0
	DisableDGV[4]=1
	bVerticalZ=false
	bYIsSpread=false
	// Reference: MeshEmitter'BallisticProV55.RSDarkFlameSpray.MeshEmitter1'
	begin object name="MeshEmitter1" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.M806.PistolMuzzleFlash'
		UseMeshBlendMode=false
		RenderTwoSided=true
		UseParticleColor=true
		UseMaxCollisions=true
		UseColorScale=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
		MaxCollisions=(Min=1.0000000,Max=1.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=64,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.1250000,Color=(R=128,G=64,B=255,A=255))
		ColorScale[2]=(RelativeTime=0.2214290,Color=(R=128,G=64,B=255,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=255))
		ColorMultiplierRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		FadeOutStartTime=0.2500000
		FadeInEndTime=0.0300000
		MaxParticles=15000
		StartLocationOffset=(X=30.0000000,Y=0.0000000,Z=0.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.5000000,RelativeSize=0.5000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=0.4000000,Max=0.5000000),Y=(Min=0.0200000,Max=0.0800000),Z=(Min=0.0200000,Max=0.0800000))
		InitialParticlesPerSecond=15.0000000
		DrawStyle=6
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5500000,Max=0.5500000)
		StartVelocityRange=(X=(Min=1200.0000000,Max=1200.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[0]=MeshEmitter1
	// Reference: SpriteEmitter'BallisticProV55.RSDarkFlameSpray.SpriteEmitter7'
	begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
		UseMaxCollisions=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
		MaxCollisions=(Min=1.0000000,Max=1.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.5000000,Max=1.0000000),Y=(Min=0.2500000,Max=0.3000000),Z=(Min=0.0000000,Max=0.0000000))
		FadeOutStartTime=0.2700000
		FadeInEndTime=0.2400000
		MaxParticles=2000
		AlphaRef=128
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
		SizeScale[1]=(RelativeTime=0.5500000,RelativeSize=0.5000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=60.0000000,Max=60.0000000),Y=(Min=60.0000000,Max=60.0000000),Z=(Min=60.0000000,Max=60.0000000))
		InitialParticlesPerSecond=40.0000000
		DrawStyle=6
		Texture=Texture'BW_Core_WeaponTex.DarkStar.Plasma-A'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		StartVelocityRange=(X=(Min=1200.0000000,Max=1200.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[1]=SpriteEmitter7
	// Reference: SpriteEmitter'BallisticProV55.RSDarkFlameSpray.SpriteEmitter8'
	begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
		UseMaxCollisions=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
		MaxCollisions=(Min=1.0000000,Max=1.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0500000),Z=(Min=0.0000000,Max=0.4000000))
		FadeOutStartTime=0.3000000
		FadeInEndTime=0.1200000
		MaxParticles=1000
		AlphaRef=128
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
		SizeScale[1]=(RelativeTime=0.3900000,RelativeSize=0.6000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=120.0000000,Max=120.0000000),Y=(Min=120.0000000,Max=120.0000000),Z=(Min=120.0000000,Max=120.0000000))
		InitialParticlesPerSecond=20.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareC1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4500000,Max=0.5000000)
		StartVelocityRange=(X=(Min=1100.0000000,Max=1250.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[2]=SpriteEmitter8
	// Reference: MeshEmitter'BallisticProV55.RSDarkFlameSpray.MeshEmitter2'
	begin object name="MeshEmitter2" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.DarkStar.GlowChunk'
		UseMeshBlendMode=false
		RenderTwoSided=true
		UseParticleColor=true
		UseMaxCollisions=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
		ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
		MaxCollisions=(Min=1.0000000,Max=1.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.3000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
		FadeOutStartTime=0.3700000
		MaxParticles=400
		StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=3.0000000),Y=(Min=0.0000000,Max=3.0000000),Z=(Min=0.0000000,Max=3.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=0.3000000,Max=0.6000000),Y=(Min=0.3000000,Max=0.6000000),Z=(Min=0.3000000,Max=0.6000000))
		InitialParticlesPerSecond=8.0000000
		DrawStyle=6
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		StartVelocityRange=(X=(Min=500.0000000,Max=1200.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=-80.0000000,Max=200.0000000))
	end object
	Emitters[3]=MeshEmitter2
	// Reference: SpriteEmitter'BallisticProV55.RSDarkFlameSpray.SpriteEmitter10'
	begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseMaxCollisions=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
		MaxCollisions=(Min=1.0000000,Max=1.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.2000000,Max=0.6000000),Z=(Min=0.0000000,Max=0.0000000))
		FadeOutStartTime=0.1680000
		FadeInEndTime=0.0560000
		MaxParticles=4000
		AddLocationFromOtherEmitter=3
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.3000000)
		SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=0.8000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=1.0000000,Max=1.5000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
		InitialParticlesPerSecond=80.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke4'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
		AddVelocityFromOtherEmitter=3
		AddVelocityMultiplierRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.1000000,Max=0.1000000),Z=(Min=0.1000000,Max=0.1000000))
	end object
	Emitters[4]=SpriteEmitter10
	// Reference: SpriteEmitter'BallisticProV55.RSDarkFlameSpray.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseMaxCollisions=true
		UseColorScale=true
		FadeIn=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
		MaxCollisions=(Min=1.0000000,Max=1.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.1214290,Color=(R=255,G=0,B=0,A=255))
		ColorScale[2]=(RelativeTime=0.2571430,Color=(R=255,G=0,B=0,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=255))
		Opacity=0.5400000
		FadeOutStartTime=0.5000000
		FadeInEndTime=0.3000000
		MaxParticles=1400
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.5000000,RelativeSize=0.8000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=15.0000000,Max=40.0000000),Y=(Min=120.0000000,Max=150.0000000),Z=(Min=120.0000000,Max=150.0000000))
		InitialParticlesPerSecond=28.0000000
		Texture=Texture'BW_Core_WeaponTex.DarkStar.Plasma-A'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		StartVelocityRange=(X=(Min=1120.0000000,Max=1250.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[5]=SpriteEmitter0
	// Reference: SpriteEmitter'BallisticProV55.RSDarkFlameSpray.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseMaxCollisions=true
		UseColorScale=true
		FadeIn=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
		MaxCollisions=(Min=1.0000000,Max=1.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.1214290,Color=(R=255,G=176,B=0,A=255))
		ColorScale[2]=(RelativeTime=0.2750000,Color=(R=192,G=160,B=0,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=255))
		FadeOutStartTime=0.5000000
		FadeInEndTime=0.1800000
		MaxParticles=600
		AlphaRef=96
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.5000000,RelativeSize=0.8000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=15.0000000,Max=40.0000000),Y=(Min=200.0000000,Max=200.0000000),Z=(Min=200.0000000,Max=200.0000000))
		InitialParticlesPerSecond=12.0000000
		Texture=Texture'BW_Core_WeaponTex.DarkStar.Plasma-A-AlphaAdd'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		StartVelocityRange=(X=(Min=1120.0000000,Max=1250.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[6]=SpriteEmitter1
	AutoDestroy=true
	bHardAttach=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'BallisticProV55.RSDarkFlameSpray.MeshEmitter1'
begin object name="MeshEmitter1" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.M806.PistolMuzzleFlash'
	UseMeshBlendMode=false
	RenderTwoSided=true
	UseParticleColor=true
	UseMaxCollisions=true
	UseColorScale=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
	MaxCollisions=(Min=1.0000000,Max=1.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=64,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.1250000,Color=(R=128,G=64,B=255,A=255))
	ColorScale[2]=(RelativeTime=0.2214290,Color=(R=128,G=64,B=255,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=255))
	ColorMultiplierRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	FadeOutStartTime=0.2500000
	FadeInEndTime=0.0300000
	MaxParticles=15000
	StartLocationOffset=(X=30.0000000,Y=0.0000000,Z=0.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.5000000,RelativeSize=0.5000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=0.4000000,Max=0.5000000),Y=(Min=0.0200000,Max=0.0800000),Z=(Min=0.0200000,Max=0.0800000))
	InitialParticlesPerSecond=15.0000000
	DrawStyle=6
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5500000,Max=0.5500000)
	StartVelocityRange=(X=(Min=1200.0000000,Max=1200.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RSDarkFlameSpray.SpriteEmitter7'
begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
	UseMaxCollisions=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
	MaxCollisions=(Min=1.0000000,Max=1.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.5000000,Max=1.0000000),Y=(Min=0.2500000,Max=0.3000000),Z=(Min=0.0000000,Max=0.0000000))
	FadeOutStartTime=0.2700000
	FadeInEndTime=0.2400000
	MaxParticles=2000
	AlphaRef=128
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
	SizeScale[1]=(RelativeTime=0.5500000,RelativeSize=0.5000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=60.0000000,Max=60.0000000),Y=(Min=60.0000000,Max=60.0000000),Z=(Min=60.0000000,Max=60.0000000))
	InitialParticlesPerSecond=40.0000000
	DrawStyle=6
	Texture=Texture'BW_Core_WeaponTex.DarkStar.Plasma-A'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	StartVelocityRange=(X=(Min=1200.0000000,Max=1200.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RSDarkFlameSpray.SpriteEmitter8'
begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
	UseMaxCollisions=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
	MaxCollisions=(Min=1.0000000,Max=1.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0500000),Z=(Min=0.0000000,Max=0.4000000))
	FadeOutStartTime=0.3000000
	FadeInEndTime=0.1200000
	MaxParticles=1000
	AlphaRef=128
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
	SizeScale[1]=(RelativeTime=0.3900000,RelativeSize=0.6000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=120.0000000,Max=120.0000000),Y=(Min=120.0000000,Max=120.0000000),Z=(Min=120.0000000,Max=120.0000000))
	InitialParticlesPerSecond=20.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareC1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4500000,Max=0.5000000)
	StartVelocityRange=(X=(Min=1100.0000000,Max=1250.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: MeshEmitter'BallisticProV55.RSDarkFlameSpray.MeshEmitter2'
begin object name="MeshEmitter2" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.DarkStar.GlowChunk'
	UseMeshBlendMode=false
	RenderTwoSided=true
	UseParticleColor=true
	UseMaxCollisions=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
	ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
	MaxCollisions=(Min=1.0000000,Max=1.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.3000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
	FadeOutStartTime=0.3700000
	MaxParticles=400
	StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=3.0000000),Y=(Min=0.0000000,Max=3.0000000),Z=(Min=0.0000000,Max=3.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=0.3000000,Max=0.6000000),Y=(Min=0.3000000,Max=0.6000000),Z=(Min=0.3000000,Max=0.6000000))
	InitialParticlesPerSecond=8.0000000
	DrawStyle=6
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	StartVelocityRange=(X=(Min=500.0000000,Max=1200.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=-80.0000000,Max=200.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RSDarkFlameSpray.SpriteEmitter10'
begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseMaxCollisions=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
	MaxCollisions=(Min=1.0000000,Max=1.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.2000000,Max=0.6000000),Z=(Min=0.0000000,Max=0.0000000))
	FadeOutStartTime=0.1680000
	FadeInEndTime=0.0560000
	MaxParticles=4000
	AddLocationFromOtherEmitter=3
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.3000000)
	SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=0.8000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=1.0000000,Max=1.5000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
	InitialParticlesPerSecond=80.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke4'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
	AddVelocityFromOtherEmitter=3
	AddVelocityMultiplierRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.1000000,Max=0.1000000),Z=(Min=0.1000000,Max=0.1000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RSDarkFlameSpray.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseMaxCollisions=true
	UseColorScale=true
	FadeIn=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
	MaxCollisions=(Min=1.0000000,Max=1.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.1214290,Color=(R=255,G=0,B=0,A=255))
	ColorScale[2]=(RelativeTime=0.2571430,Color=(R=255,G=0,B=0,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=255))
	Opacity=0.5400000
	FadeOutStartTime=0.5000000
	FadeInEndTime=0.3000000
	MaxParticles=1400
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.5000000,RelativeSize=0.8000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=15.0000000,Max=40.0000000),Y=(Min=120.0000000,Max=150.0000000),Z=(Min=120.0000000,Max=150.0000000))
	InitialParticlesPerSecond=28.0000000
	Texture=Texture'BW_Core_WeaponTex.DarkStar.Plasma-A'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	StartVelocityRange=(X=(Min=1120.0000000,Max=1250.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RSDarkFlameSpray.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseMaxCollisions=true
	UseColorScale=true
	FadeIn=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ExtentMultiplier=(X=0.0000000,Y=0.0000000,Z=0.0000000)
	MaxCollisions=(Min=1.0000000,Max=1.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.1214290,Color=(R=255,G=176,B=0,A=255))
	ColorScale[2]=(RelativeTime=0.2750000,Color=(R=192,G=160,B=0,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=255))
	FadeOutStartTime=0.5000000
	FadeInEndTime=0.1800000
	MaxParticles=600
	AlphaRef=96
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.5000000,RelativeSize=0.8000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=15.0000000,Max=40.0000000),Y=(Min=200.0000000,Max=200.0000000),Z=(Min=200.0000000,Max=200.0000000))
	InitialParticlesPerSecond=12.0000000
	Texture=Texture'BW_Core_WeaponTex.DarkStar.Plasma-A-AlphaAdd'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	StartVelocityRange=(X=(Min=1120.0000000,Max=1250.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
