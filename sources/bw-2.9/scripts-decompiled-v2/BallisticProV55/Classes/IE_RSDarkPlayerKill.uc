class IE_RSDarkPlayerKill extends DGVEmitter;

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
	DisableDGV[4]=1
	DisableDGV[5]=0
	DisableDGV[6]=0
	DisableDGV[7]=1
	EmitterZTestSwitches[0]=0
	EmitterZTestSwitches[1]=0
	EmitterZTestSwitches[2]=2
	// Reference: SpriteEmitter'BallisticProV55.IE_RSDarkPlayerKill.SpriteEmitter11'
	begin object name="SpriteEmitter11" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.7500000,Max=0.7500000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.2500000,Max=0.2500000))
		FadeOutStartTime=1.3600000
		FadeInEndTime=0.1800000
		CoordinateSystem=1
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
		StartSizeRange=(X=(Min=120.0000000,Max=120.0000000),Y=(Min=120.0000000,Max=120.0000000),Z=(Min=120.0000000,Max=120.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=5
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareC1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
	end object
	Emitters[0]=SpriteEmitter11
	// Reference: SpriteEmitter'BallisticProV55.IE_RSDarkPlayerKill.SpriteEmitter12'
	begin object name="SpriteEmitter12" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.6000000,Max=0.6000000),Z=(Min=0.2500000,Max=0.2500000))
		FadeOutStartTime=0.0325000
		CoordinateSystem=1
		MaxParticles=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
		SizeScale[1]=(RelativeTime=0.2800000,RelativeSize=0.5000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.Explode2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.3000000,Max=0.3000000)
		InitialDelayRange=(Min=0.1000000,Max=0.1000000)
	end object
	Emitters[1]=SpriteEmitter12
	// Reference: SpriteEmitter'BallisticProV55.IE_RSDarkPlayerKill.SpriteEmitter13'
	begin object name="SpriteEmitter13" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=224,B=192,A=255))
		ColorScale[1]=(RelativeTime=0.2500000,Color=(R=255,G=255,B=0,A=255))
		ColorScale[2]=(RelativeTime=0.5321430,Color=(R=255,G=0,B=0,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
		ColorMultiplierRange=(X=(Min=0.7500000,Max=0.7500000),Y=(Min=0.7500000,Max=0.7500000),Z=(Min=0.7500000,Max=0.7500000))
		FadeOutStartTime=0.0325000
		CoordinateSystem=1
		MaxParticles=1
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
		SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2000000,Max=0.2000000)
	end object
	Emitters[2]=SpriteEmitter13
	// Reference: SpriteEmitter'BallisticProV55.IE_RSDarkPlayerKill.SpriteEmitter14'
	begin object name="SpriteEmitter14" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=1.4100000
		FadeInEndTime=0.0900000
		CoordinateSystem=1
		MaxParticles=1
		StartSizeRange=(X=(Min=8.0000000,Max=8.0000000),Y=(Min=8.0000000,Max=8.0000000),Z=(Min=8.0000000,Max=8.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=5
		Texture=Texture'BW_Core_WeaponTex.DarkStar.HotFlareA2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=3.0000000,Max=3.0000000)
	end object
	Emitters[3]=SpriteEmitter14
	// Reference: SpriteEmitter'BallisticProV55.IE_RSDarkPlayerKill.SpriteEmitter15'
	begin object name="SpriteEmitter15" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-10.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=0,B=0,A=255))
		ColorScale[1]=(RelativeTime=0.2750000,Color=(R=192,G=96,B=0,A=255))
		ColorScale[2]=(RelativeTime=0.5714290,Color=(R=0,G=0,B=0,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=255))
		Opacity=0.6900000
		FadeOutStartTime=0.3200000
		FadeInEndTime=0.1600000
		MaxParticles=30
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=2.0000000)
		AlphaRef=48
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
		SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=0.2000000)
		SizeScale[2]=(RelativeTime=0.6200000,RelativeSize=0.8000000)
		SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=30.0000000,Max=30.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=30.0000000,Max=30.0000000))
		InitialParticlesPerSecond=10.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Effects.Smoke7'
		SecondsBeforeInactive=0.0000000
		StartVelocityRange=(X=(Min=-2.0000000,Max=2.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=80.0000000,Max=80.0000000))
		VelocityLossRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=2.0000000,Max=2.0000000))
	end object
	Emitters[4]=SpriteEmitter15
	// Reference: SpriteEmitter'BallisticProV55.IE_RSDarkPlayerKill.SpriteEmitter17'
	begin object name="SpriteEmitter17" class=Engine.SpriteEmitter
		UseCollision=true
		FadeOut=true
		RespawnDeadParticles=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-600.0000000)
		ExtentMultiplier=(X=0.5000000,Y=0.5000000,Z=0.5000000)
		DampingFactorRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.2000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
		FadeOutStartTime=2.7200000
		MaxParticles=15
		StartSizeRange=(X=(Min=2.0000000,Max=3.0000000),Y=(Min=2.0000000,Max=3.0000000),Z=(Min=2.0000000,Max=3.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'BW_Core_WeaponTex.DarkStar.HotFlareA2'
		SecondsBeforeInactive=0.0000000
		MinSquaredVelocity=5000.0000000
		StartVelocityRange=(X=(Min=-400.0000000,Max=400.0000000),Y=(Min=-150.0000000,Max=150.0000000),Z=(Min=100.0000000,Max=200.0000000))
		VelocityLossRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
	end object
	Emitters[5]=SpriteEmitter17
	// Reference: SpriteEmitter'BallisticProV55.IE_RSDarkPlayerKill.SpriteEmitter18'
	begin object name="SpriteEmitter18" class=Engine.SpriteEmitter
		UseCollision=true
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-500.0000000)
		ExtentMultiplier=(X=0.7500000,Y=0.7500000,Z=0.7500000)
		DampingFactorRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=192,B=128,A=255))
		ColorScale[1]=(RelativeTime=0.1571430,Color=(R=255,G=128,B=0,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
		FadeOutStartTime=1.2600000
		MaxParticles=3
		StartSpinRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=10.0000000,Max=15.0000000),Y=(Min=10.0000000,Max=15.0000000),Z=(Min=10.0000000,Max=15.0000000))
		InitialParticlesPerSecond=9.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.BlazingSubdivide'
		TextureUSubdivisions=4
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		MinSquaredVelocity=200.0000000
		LifetimeRange=(Min=1.5000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=60.0000000,Max=140.0000000))
	end object
	Emitters[6]=SpriteEmitter18
	// Reference: SpriteEmitter'BallisticProV55.IE_RSDarkPlayerKill.SpriteEmitter25'
	begin object name="SpriteEmitter25" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.1571430,Color=(R=255,G=128,B=0,A=255))
		ColorScale[2]=(RelativeTime=0.4571430,Color=(R=255,G=64,B=0,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
		FadeOutStartTime=0.2300000
		FadeInEndTime=0.0900000
		MaxParticles=100
		AddLocationFromOtherEmitter=5
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.5600000,RelativeSize=0.8000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=3.5000000,Max=3.5000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=30.0000000,Max=30.0000000))
		InitialParticlesPerSecond=200.0000000
		DrawStyle=6
		Texture=Texture'BW_Core_WeaponTex.Particles.FlameParts'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		AddVelocityFromOtherEmitter=5
		AddVelocityMultiplierRange=(X=(Min=0.0500000,Max=0.0500000),Y=(Min=0.0500000,Max=0.0500000),Z=(Min=0.0500000,Max=0.0500000))
	end object
	Emitters[7]=SpriteEmitter25
	AutoDestroy=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.IE_RSDarkPlayerKill.SpriteEmitter11'
begin object name="SpriteEmitter11" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.7500000,Max=0.7500000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.2500000,Max=0.2500000))
	FadeOutStartTime=1.3600000
	FadeInEndTime=0.1800000
	CoordinateSystem=1
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
	StartSizeRange=(X=(Min=120.0000000,Max=120.0000000),Y=(Min=120.0000000,Max=120.0000000),Z=(Min=120.0000000,Max=120.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=5
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareC1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
end object
// Reference: SpriteEmitter'BallisticProV55.IE_RSDarkPlayerKill.SpriteEmitter12'
begin object name="SpriteEmitter12" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.6000000,Max=0.6000000),Z=(Min=0.2500000,Max=0.2500000))
	FadeOutStartTime=0.0325000
	CoordinateSystem=1
	MaxParticles=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
	SizeScale[1]=(RelativeTime=0.2800000,RelativeSize=0.5000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.Explode2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.3000000,Max=0.3000000)
	InitialDelayRange=(Min=0.1000000,Max=0.1000000)
end object
// Reference: SpriteEmitter'BallisticProV55.IE_RSDarkPlayerKill.SpriteEmitter13'
begin object name="SpriteEmitter13" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=224,B=192,A=255))
	ColorScale[1]=(RelativeTime=0.2500000,Color=(R=255,G=255,B=0,A=255))
	ColorScale[2]=(RelativeTime=0.5321430,Color=(R=255,G=0,B=0,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
	ColorMultiplierRange=(X=(Min=0.7500000,Max=0.7500000),Y=(Min=0.7500000,Max=0.7500000),Z=(Min=0.7500000,Max=0.7500000))
	FadeOutStartTime=0.0325000
	CoordinateSystem=1
	MaxParticles=1
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
	SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2000000,Max=0.2000000)
end object
// Reference: SpriteEmitter'BallisticProV55.IE_RSDarkPlayerKill.SpriteEmitter14'
begin object name="SpriteEmitter14" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=1.4100000
	FadeInEndTime=0.0900000
	CoordinateSystem=1
	MaxParticles=1
	StartSizeRange=(X=(Min=8.0000000,Max=8.0000000),Y=(Min=8.0000000,Max=8.0000000),Z=(Min=8.0000000,Max=8.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=5
	Texture=Texture'BW_Core_WeaponTex.DarkStar.HotFlareA2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=3.0000000,Max=3.0000000)
end object
// Reference: SpriteEmitter'BallisticProV55.IE_RSDarkPlayerKill.SpriteEmitter15'
begin object name="SpriteEmitter15" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-10.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=0,B=0,A=255))
	ColorScale[1]=(RelativeTime=0.2750000,Color=(R=192,G=96,B=0,A=255))
	ColorScale[2]=(RelativeTime=0.5714290,Color=(R=0,G=0,B=0,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=255))
	Opacity=0.6900000
	FadeOutStartTime=0.3200000
	FadeInEndTime=0.1600000
	MaxParticles=30
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=2.0000000)
	AlphaRef=48
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
	SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=0.2000000)
	SizeScale[2]=(RelativeTime=0.6200000,RelativeSize=0.8000000)
	SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=30.0000000,Max=30.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=30.0000000,Max=30.0000000))
	InitialParticlesPerSecond=10.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Effects.Smoke7'
	SecondsBeforeInactive=0.0000000
	StartVelocityRange=(X=(Min=-2.0000000,Max=2.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=80.0000000,Max=80.0000000))
	VelocityLossRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=2.0000000,Max=2.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.IE_RSDarkPlayerKill.SpriteEmitter17'
begin object name="SpriteEmitter17" class=Engine.SpriteEmitter
	UseCollision=true
	FadeOut=true
	RespawnDeadParticles=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-600.0000000)
	ExtentMultiplier=(X=0.5000000,Y=0.5000000,Z=0.5000000)
	DampingFactorRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.2000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
	FadeOutStartTime=2.7200000
	MaxParticles=15
	StartSizeRange=(X=(Min=2.0000000,Max=3.0000000),Y=(Min=2.0000000,Max=3.0000000),Z=(Min=2.0000000,Max=3.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'BW_Core_WeaponTex.DarkStar.HotFlareA2'
	SecondsBeforeInactive=0.0000000
	MinSquaredVelocity=5000.0000000
	StartVelocityRange=(X=(Min=-400.0000000,Max=400.0000000),Y=(Min=-150.0000000,Max=150.0000000),Z=(Min=100.0000000,Max=200.0000000))
	VelocityLossRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=1.0000000,Max=1.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.IE_RSDarkPlayerKill.SpriteEmitter18'
begin object name="SpriteEmitter18" class=Engine.SpriteEmitter
	UseCollision=true
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-500.0000000)
	ExtentMultiplier=(X=0.7500000,Y=0.7500000,Z=0.7500000)
	DampingFactorRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=192,B=128,A=255))
	ColorScale[1]=(RelativeTime=0.1571430,Color=(R=255,G=128,B=0,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
	FadeOutStartTime=1.2600000
	MaxParticles=3
	StartSpinRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=10.0000000,Max=15.0000000),Y=(Min=10.0000000,Max=15.0000000),Z=(Min=10.0000000,Max=15.0000000))
	InitialParticlesPerSecond=9.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.BlazingSubdivide'
	TextureUSubdivisions=4
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	MinSquaredVelocity=200.0000000
	LifetimeRange=(Min=1.5000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=60.0000000,Max=140.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.IE_RSDarkPlayerKill.SpriteEmitter25'
begin object name="SpriteEmitter25" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.1571430,Color=(R=255,G=128,B=0,A=255))
	ColorScale[2]=(RelativeTime=0.4571430,Color=(R=255,G=64,B=0,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
	FadeOutStartTime=0.2300000
	FadeInEndTime=0.0900000
	MaxParticles=100
	AddLocationFromOtherEmitter=5
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.5600000,RelativeSize=0.8000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=3.5000000,Max=3.5000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=30.0000000,Max=30.0000000))
	InitialParticlesPerSecond=200.0000000
	DrawStyle=6
	Texture=Texture'BW_Core_WeaponTex.Particles.FlameParts'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	AddVelocityFromOtherEmitter=5
	AddVelocityMultiplierRange=(X=(Min=0.0500000,Max=0.0500000),Y=(Min=0.0500000,Max=0.0500000),Z=(Min=0.0500000,Max=0.0500000))
end object
