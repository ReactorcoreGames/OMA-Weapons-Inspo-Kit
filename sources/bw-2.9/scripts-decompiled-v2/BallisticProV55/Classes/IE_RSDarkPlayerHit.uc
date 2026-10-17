class IE_RSDarkPlayerHit extends DGVEmitter;

simulated function AlignVelocity()
{
	local int i;
	local Vector X, Y, Z, VMax, vmin;

	i = 0;
	J0x07:

	// End:0x3D7 [Loop If]
	if(i < Emitters.Length)
	{
		// End:0x3D
		if((DisableDGV.Length > i) && DisableDGV[i] != 0)
		{
			// [Explicit Continue]
			goto J0x3CD;
		}
		GetAxes(Rotation, X, Y, Z);
		// End:0x17A
		if(bVerticalZ)
		{
			VMax = ((X * SVX[i].Max) + (Y * SVY[i].Max)) + (vect(0.0000000, 0.0000000, 1.0000000) * SVZ[i].Max);
			vmin = ((X * SVX[i].Min) + (Y * SVY[i].Min)) + (vect(0.0000000, 0.0000000, 1.0000000) * SVZ[i].Min);
			// End:0x177
			if(bYIsSpread)
			{
				VMax = VMax + ((Z * SVY[i].Max) * Abs(X.Z));
				vmin = vmin + ((Z * SVY[i].Min) * Abs(X.Z));
			}			
		}
		else
		{
			VMax = ((X * SVX[i].Max) + (Y * SVY[i].Max)) + (Z * SVZ[i].Max);
			vmin = ((X * SVX[i].Min) + (Y * SVY[i].Min)) + (Z * SVZ[i].Min);
		}
		Emitters[i].StartVelocityRange = VtoRV(VMax, vmin);
		VMax = ((X * default.Emitters[i].StartLocationRange.X.Max) + (Y * default.Emitters[i].StartLocationRange.Y.Max)) + (Z * default.Emitters[i].StartLocationRange.Z.Max);
		vmin = ((X * default.Emitters[i].StartLocationRange.X.Min) + (Y * default.Emitters[i].StartLocationRange.Y.Min)) + (Z * default.Emitters[i].StartLocationRange.Z.Min);
		Emitters[i].StartLocationRange = VtoRV(VMax, vmin);
		Emitters[i].StartLocationOffset = ((X * default.Emitters[i].StartLocationOffset.X) + (Y * default.Emitters[i].StartLocationOffset.Y)) + (Z * default.Emitters[i].StartLocationOffset.Z);
		J0x3CD:

		i++;
		// [Loop Continue]
		goto J0x07;
	}
	//return;	
}

defaultproperties
{
	DisableDGV[0]=1
	DisableDGV[1]=1
	DisableDGV[2]=1
	DisableDGV[3]=1
	DisableDGV[4]=0
	DisableDGV[5]=1
	DisableDGV[6]=1
	EmitterZTestSwitches[0]=0
	EmitterZTestSwitches[1]=2
	// Reference: SpriteEmitter'BallisticProV55.IE_RSDarkPlayerHit.SpriteEmitter7'
	begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=192,B=0,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
		FadeOutStartTime=0.0600000
		FadeInEndTime=0.0150000
		CoordinateSystem=1
		MaxParticles=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0500000)
		SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=0.6000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=70.0000000,Max=80.0000000),Y=(Min=70.0000000,Max=80.0000000),Z=(Min=70.0000000,Max=80.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BW_Core_WeaponTex.DarkStar.DarkShock'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[0]=SpriteEmitter7
	// Reference: SpriteEmitter'BallisticProV55.IE_RSDarkPlayerHit.SpriteEmitter11'
	begin object name="SpriteEmitter11" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		ZTest=false
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=192,B=128,A=255))
		ColorScale[1]=(RelativeTime=0.1714290,Color=(R=255,G=128,B=0,A=255))
		ColorScale[2]=(RelativeTime=0.2857140,Color=(R=192,G=64,B=0,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=128,G=0,B=0,A=255))
		FadeOutStartTime=0.0300000
		CoordinateSystem=1
		MaxParticles=1
		StartSizeRange=(X=(Min=60.0000000,Max=60.0000000),Y=(Min=60.0000000,Max=60.0000000),Z=(Min=60.0000000,Max=60.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2500000,Max=0.2500000)
	end object
	Emitters[1]=SpriteEmitter11
	// Reference: SpriteEmitter'BallisticProV55.IE_RSDarkPlayerHit.SpriteEmitter13'
	begin object name="SpriteEmitter13" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=1.2000000
		FadeInEndTime=0.1200000
		CoordinateSystem=1
		MaxParticles=1
		StartSizeRange=(X=(Min=30.0000000,Max=30.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=30.0000000,Max=30.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=5
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
	end object
	Emitters[2]=SpriteEmitter13
	// Reference: SpriteEmitter'BallisticProV55.IE_RSDarkPlayerHit.SpriteEmitter14'
	begin object name="SpriteEmitter14" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-5.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.0500000,Max=0.0500000),Z=(Min=0.0000000,Max=0.2000000))
		Opacity=0.6300000
		FadeOutStartTime=1.2300000
		FadeInEndTime=0.1800000
		MaxParticles=20
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
		SizeScale[1]=(RelativeTime=0.3100000,RelativeSize=0.2000000)
		SizeScale[2]=(RelativeTime=0.6800000,RelativeSize=0.8000000)
		SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=20.0000000,Max=30.0000000),Y=(Min=20.0000000,Max=30.0000000),Z=(Min=20.0000000,Max=30.0000000))
		InitialParticlesPerSecond=15.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Effects.Smoke7'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=3.0000000,Max=3.0000000)
		StartVelocityRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=70.0000000,Max=70.0000000))
		VelocityLossRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=1.0000000,Max=1.0000000))
	end object
	Emitters[3]=SpriteEmitter14
	// Reference: MeshEmitter'BallisticProV55.IE_RSDarkPlayerHit.MeshEmitter0'
	begin object name="MeshEmitter0" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.Impact.ConcreteChip2'
		UseMeshBlendMode=false
		RenderTwoSided=true
		UseParticleColor=true
		UseCollision=true
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		DampRotation=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-600.0000000)
		ExtentMultiplier=(X=0.7000000,Y=0.7000000,Z=0.7000000)
		DampingFactorRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=128,B=0,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=0,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=1.0000000),Z=(Min=0.5000000,Max=1.0000000))
		FadeOutStartTime=3.1200000
		MaxParticles=12
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=2.0000000),Z=(Min=0.0000000,Max=2.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=0.1000000,Max=0.3000000),Y=(Min=0.1000000,Max=0.3000000),Z=(Min=0.1000000,Max=0.3000000))
		InitialParticlesPerSecond=5000.0000000
		SecondsBeforeInactive=0.0000000
		MinSquaredVelocity=500.0000000
		StartVelocityRange=(X=(Min=-50.0000000,Max=150.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=0.0000000,Max=200.0000000))
	end object
	Emitters[4]=MeshEmitter0
	// Reference: SpriteEmitter'BallisticProV55.IE_RSDarkPlayerHit.SpriteEmitter15'
	begin object name="SpriteEmitter15" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.3000000,Max=0.8000000),Z=(Min=0.0000000,Max=0.0000000))
		Opacity=0.7200000
		FadeOutStartTime=0.1600000
		FadeInEndTime=0.0920000
		MaxParticles=72
		StartLocationRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=-1.0000000,Max=1.0000000),Z=(Min=-1.0000000,Max=1.0000000))
		AddLocationFromOtherEmitter=4
		StartSizeRange=(X=(Min=4.0000000,Max=5.0000000),Y=(Min=4.0000000,Max=5.0000000),Z=(Min=4.0000000,Max=5.0000000))
		InitialParticlesPerSecond=24.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
	end object
	Emitters[5]=SpriteEmitter15
	// Reference: SpriteEmitter'BallisticProV55.IE_RSDarkPlayerHit.SpriteEmitter16'
	begin object name="SpriteEmitter16" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.3000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.6000000,Max=1.0000000))
		Opacity=0.7200000
		FadeOutStartTime=0.1600000
		FadeInEndTime=0.0920000
		MaxParticles=36
		StartLocationRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=-1.0000000,Max=1.0000000),Z=(Min=-1.0000000,Max=1.0000000))
		AddLocationFromOtherEmitter=4
		StartSizeRange=(X=(Min=4.0000000,Max=5.0000000),Y=(Min=4.0000000,Max=5.0000000),Z=(Min=4.0000000,Max=5.0000000))
		InitialParticlesPerSecond=12.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
	end object
	Emitters[6]=SpriteEmitter16
	AutoDestroy=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.IE_RSDarkPlayerHit.SpriteEmitter7'
begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=192,B=0,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
	FadeOutStartTime=0.0600000
	FadeInEndTime=0.0150000
	CoordinateSystem=1
	MaxParticles=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0500000)
	SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=0.6000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=70.0000000,Max=80.0000000),Y=(Min=70.0000000,Max=80.0000000),Z=(Min=70.0000000,Max=80.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BW_Core_WeaponTex.DarkStar.DarkShock'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BallisticProV55.IE_RSDarkPlayerHit.SpriteEmitter11'
begin object name="SpriteEmitter11" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	ZTest=false
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=192,B=128,A=255))
	ColorScale[1]=(RelativeTime=0.1714290,Color=(R=255,G=128,B=0,A=255))
	ColorScale[2]=(RelativeTime=0.2857140,Color=(R=192,G=64,B=0,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=128,G=0,B=0,A=255))
	FadeOutStartTime=0.0300000
	CoordinateSystem=1
	MaxParticles=1
	StartSizeRange=(X=(Min=60.0000000,Max=60.0000000),Y=(Min=60.0000000,Max=60.0000000),Z=(Min=60.0000000,Max=60.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2500000,Max=0.2500000)
end object
// Reference: SpriteEmitter'BallisticProV55.IE_RSDarkPlayerHit.SpriteEmitter13'
begin object name="SpriteEmitter13" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=1.2000000
	FadeInEndTime=0.1200000
	CoordinateSystem=1
	MaxParticles=1
	StartSizeRange=(X=(Min=30.0000000,Max=30.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=30.0000000,Max=30.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=5
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
end object
// Reference: SpriteEmitter'BallisticProV55.IE_RSDarkPlayerHit.SpriteEmitter14'
begin object name="SpriteEmitter14" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-5.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.0500000,Max=0.0500000),Z=(Min=0.0000000,Max=0.2000000))
	Opacity=0.6300000
	FadeOutStartTime=1.2300000
	FadeInEndTime=0.1800000
	MaxParticles=20
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
	SizeScale[1]=(RelativeTime=0.3100000,RelativeSize=0.2000000)
	SizeScale[2]=(RelativeTime=0.6800000,RelativeSize=0.8000000)
	SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=20.0000000,Max=30.0000000),Y=(Min=20.0000000,Max=30.0000000),Z=(Min=20.0000000,Max=30.0000000))
	InitialParticlesPerSecond=15.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Effects.Smoke7'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=3.0000000,Max=3.0000000)
	StartVelocityRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=70.0000000,Max=70.0000000))
	VelocityLossRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=1.0000000,Max=1.0000000))
end object
// Reference: MeshEmitter'BallisticProV55.IE_RSDarkPlayerHit.MeshEmitter0'
begin object name="MeshEmitter0" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Impact.ConcreteChip2'
	UseMeshBlendMode=false
	RenderTwoSided=true
	UseParticleColor=true
	UseCollision=true
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	DampRotation=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-600.0000000)
	ExtentMultiplier=(X=0.7000000,Y=0.7000000,Z=0.7000000)
	DampingFactorRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=128,B=0,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=0,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=1.0000000),Z=(Min=0.5000000,Max=1.0000000))
	FadeOutStartTime=3.1200000
	MaxParticles=12
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=2.0000000),Z=(Min=0.0000000,Max=2.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=0.1000000,Max=0.3000000),Y=(Min=0.1000000,Max=0.3000000),Z=(Min=0.1000000,Max=0.3000000))
	InitialParticlesPerSecond=5000.0000000
	SecondsBeforeInactive=0.0000000
	MinSquaredVelocity=500.0000000
	StartVelocityRange=(X=(Min=-50.0000000,Max=150.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=0.0000000,Max=200.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.IE_RSDarkPlayerHit.SpriteEmitter15'
begin object name="SpriteEmitter15" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.3000000,Max=0.8000000),Z=(Min=0.0000000,Max=0.0000000))
	Opacity=0.7200000
	FadeOutStartTime=0.1600000
	FadeInEndTime=0.0920000
	MaxParticles=72
	StartLocationRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=-1.0000000,Max=1.0000000),Z=(Min=-1.0000000,Max=1.0000000))
	AddLocationFromOtherEmitter=4
	StartSizeRange=(X=(Min=4.0000000,Max=5.0000000),Y=(Min=4.0000000,Max=5.0000000),Z=(Min=4.0000000,Max=5.0000000))
	InitialParticlesPerSecond=24.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
end object
// Reference: SpriteEmitter'BallisticProV55.IE_RSDarkPlayerHit.SpriteEmitter16'
begin object name="SpriteEmitter16" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.3000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.6000000,Max=1.0000000))
	Opacity=0.7200000
	FadeOutStartTime=0.1600000
	FadeInEndTime=0.0920000
	MaxParticles=36
	StartLocationRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=-1.0000000,Max=1.0000000),Z=(Min=-1.0000000,Max=1.0000000))
	AddLocationFromOtherEmitter=4
	StartSizeRange=(X=(Min=4.0000000,Max=5.0000000),Y=(Min=4.0000000,Max=5.0000000),Z=(Min=4.0000000,Max=5.0000000))
	InitialParticlesPerSecond=12.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
end object
