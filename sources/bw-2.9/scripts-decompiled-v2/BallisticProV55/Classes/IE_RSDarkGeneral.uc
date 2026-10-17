class IE_RSDarkGeneral extends DGVEmitter;

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

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	bDynamicLight = true;
	SetTimer(0.2000000, false);
	//return;	
}

simulated event Timer()
{
	super.Timer();
	bDynamicLight = false;
	//return;	
}

defaultproperties
{
	DisableDGV[0]=1
	DisableDGV[1]=1
	DisableDGV[2]=1
	DisableDGV[3]=0
	DisableDGV[4]=1
	DisableDGV[5]=1
	EmitterZTestSwitches[0]=0
	EmitterZTestSwitches[1]=0
	EmitterZTestSwitches[2]=0
	EmitterZTestSwitches[3]=0
	EmitterZTestSwitches[4]=0
	EmitterZTestSwitches[5]=2
	// Reference: SpriteEmitter'BallisticProV55.IE_RSDarkGeneral.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseDirectionAs=4
		ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=224,B=0,A=255))
		ColorScale[1]=(RelativeTime=0.1214290,Color=(R=255,G=128,B=0,A=255))
		ColorScale[2]=(RelativeTime=0.7035710,Color=(R=255,G=0,B=0,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
		Opacity=0.8300000
		FadeOutStartTime=0.1480000
		FadeInEndTime=0.0480000
		CoordinateSystem=1
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
		SizeScale[1]=(RelativeTime=0.6100000,RelativeSize=0.7000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=200.0000000,Max=200.0000000),Y=(Min=200.0000000,Max=200.0000000),Z=(Min=200.0000000,Max=200.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'BW_Core_WeaponTex.DarkStar.DarkShock'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[0]=SpriteEmitter0
	// Reference: SpriteEmitter'BallisticProV55.IE_RSDarkGeneral.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.1950000
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=15.0000000,Y=0.0000000,Z=0.0000000)
		SpinCCWorCW=(X=1.0000000,Y=0.5000000,Z=0.5000000)
		SpinsPerSecondRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.8000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=60.0000000,Max=60.0000000),Y=(Min=60.0000000,Max=60.0000000),Z=(Min=60.0000000,Max=60.0000000))
		InitialParticlesPerSecond=5000.0000000
		DrawStyle=5
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareC1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[1]=SpriteEmitter1
	// Reference: MeshEmitter'BallisticProV55.IE_RSDarkGeneral.MeshEmitter0'
	begin object name="MeshEmitter0" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.NovaStaff.Nova-GlowChips'
		UseMeshBlendMode=false
		RenderTwoSided=true
		UseParticleColor=true
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=64,B=0,A=255))
		ColorScale[1]=(RelativeTime=0.0642860,Color=(R=255,G=255,B=64,A=255))
		ColorScale[2]=(RelativeTime=0.1714290,Color=(R=255,G=64,B=0,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
		Opacity=0.7100000
		FadeOutStartTime=2.3600000
		CoordinateSystem=1
		MaxParticles=1
		StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
		StartSizeRange=(X=(Min=0.3000000,Max=0.4000000),Y=(Min=0.3000000,Max=0.4000000),Z=(Min=0.3000000,Max=0.4000000))
		InitialParticlesPerSecond=5000.0000000
		SecondsBeforeInactive=0.0000000
	end object
	Emitters[2]=MeshEmitter0
	// Reference: MeshEmitter'BallisticProV55.IE_RSDarkGeneral.MeshEmitter1'
	begin object name="MeshEmitter1" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.Impact.ConcreteChip2'
		UseMeshBlendMode=false
		RenderTwoSided=true
		UseParticleColor=true
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-800.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.4000000,Color=(R=255,G=128,B=0,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
		FadeOutStartTime=1.0950000
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=2.0000000),Z=(Min=0.0000000,Max=2.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-0.2500000,Max=-0.2500000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=0.3000000,Max=0.5000000),Y=(Min=0.3000000,Max=0.5000000),Z=(Min=0.5000000,Max=1.0000000))
		InitialParticlesPerSecond=5000.0000000
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.5000000,Max=1.5000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=100.0000000),Y=(Min=-500.0000000,Max=500.0000000),Z=(Min=-100.0000000,Max=500.0000000))
		VelocityLossRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=2.0000000,Max=2.0000000),Z=(Min=2.0000000,Max=2.0000000))
	end object
	Emitters[3]=MeshEmitter1
	// Reference: SpriteEmitter'BallisticProV55.IE_RSDarkGeneral.SpriteEmitter3'
	begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
		UseDirectionAs=1
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.2500000,Max=0.2500000),Z=(Min=0.0000000,Max=0.0000000))
		Opacity=0.5200000
		FadeOutStartTime=0.1500000
		FadeInEndTime=0.0450000
		MaxParticles=80
		AddLocationFromOtherEmitter=3
		StartSizeRange=(X=(Min=4.0000000,Max=4.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
		InitialParticlesPerSecond=100.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlameParts'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		AddVelocityFromOtherEmitter=3
		AddVelocityMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
	end object
	Emitters[4]=SpriteEmitter3
	// Reference: SpriteEmitter'BallisticProV55.IE_RSDarkGeneral.SpriteEmitter4'
	begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		ZTest=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=192,A=255))
		ColorScale[1]=(RelativeTime=0.1857140,Color=(R=255,G=192,B=0,A=255))
		ColorScale[2]=(RelativeTime=0.6464290,Color=(R=255,G=0,B=0,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
		FadeOutStartTime=0.0450000
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.5000000)
		SizeScale[1]=(RelativeTime=0.2800000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=150.0000000,Max=150.0000000),Y=(Min=150.0000000,Max=150.0000000),Z=(Min=150.0000000,Max=150.0000000))
		InitialParticlesPerSecond=50000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2500000,Max=0.2500000)
	end object
	Emitters[5]=SpriteEmitter4
	// Reference: SpriteEmitter'BallisticProV55.IE_RSDarkGeneral.SpriteEmitter5'
	begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=0,B=0,A=255))
		ColorScale[1]=(RelativeTime=0.1142860,Color=(R=255,G=224,B=192,A=255))
		ColorScale[2]=(RelativeTime=0.2000000,Color=(R=255,G=128,B=0,A=255))
		ColorScale[3]=(RelativeTime=0.2892860,Color=(R=255,G=128,B=0,A=255))
		ColorScale[4]=(RelativeTime=0.4285710,Color=(R=255,G=32,B=0,A=255))
		ColorScale[5]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
		Opacity=0.5300000
		FadeOutStartTime=0.2700000
		FadeInEndTime=0.0500000
		MaxParticles=30
		StartLocationOffset=(X=6.0000000,Y=0.0000000,Z=4.0000000)
		StartLocationRange=(X=(Min=-2.0000000,Max=2.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.4800000,Max=0.5200000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.3000000)
		SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=0.3700000,RelativeSize=0.7500000)
		SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
		StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
		InitialParticlesPerSecond=15.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.BlazingSubdivide'
		TextureUSubdivisions=4
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=3.0000000),Y=(Min=-3.0000000,Max=3.0000000),Z=(Min=45.0000000,Max=45.0000000))
	end object
	Emitters[6]=SpriteEmitter5
	// Reference: SpriteEmitter'BallisticProV55.IE_RSDarkGeneral.SpriteEmitter9'
	begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.1500000,Max=0.1500000))
		Opacity=0.7200000
		FadeOutStartTime=0.7400000
		FadeInEndTime=0.2200000
		MaxParticles=20
		StartLocationOffset=(X=8.0000000,Y=0.0000000,Z=16.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.3400000,RelativeSize=0.1500000)
		SizeScale[2]=(RelativeTime=0.7400000,RelativeSize=0.5000000)
		SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=35.0000000,Max=35.0000000),Y=(Min=35.0000000,Max=35.0000000),Z=(Min=35.0000000,Max=35.0000000))
		InitialParticlesPerSecond=7.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Effects.Smoke7'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=40.0000000,Max=40.0000000))
		VelocityLossRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.8000000,Max=0.8000000))
	end object
	Emitters[7]=SpriteEmitter9
	AutoDestroy=true
	LightType=2
	LightEffect=13
	LightBrightness=160.0000000
	LightRadius=16.0000000
	LightPeriod=3
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.IE_RSDarkGeneral.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseDirectionAs=4
	ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=224,B=0,A=255))
	ColorScale[1]=(RelativeTime=0.1214290,Color=(R=255,G=128,B=0,A=255))
	ColorScale[2]=(RelativeTime=0.7035710,Color=(R=255,G=0,B=0,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
	Opacity=0.8300000
	FadeOutStartTime=0.1480000
	FadeInEndTime=0.0480000
	CoordinateSystem=1
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
	SizeScale[1]=(RelativeTime=0.6100000,RelativeSize=0.7000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=200.0000000,Max=200.0000000),Y=(Min=200.0000000,Max=200.0000000),Z=(Min=200.0000000,Max=200.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'BW_Core_WeaponTex.DarkStar.DarkShock'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BallisticProV55.IE_RSDarkGeneral.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.1950000
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=15.0000000,Y=0.0000000,Z=0.0000000)
	SpinCCWorCW=(X=1.0000000,Y=0.5000000,Z=0.5000000)
	SpinsPerSecondRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.8000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=60.0000000,Max=60.0000000),Y=(Min=60.0000000,Max=60.0000000),Z=(Min=60.0000000,Max=60.0000000))
	InitialParticlesPerSecond=5000.0000000
	DrawStyle=5
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareC1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
// Reference: MeshEmitter'BallisticProV55.IE_RSDarkGeneral.MeshEmitter0'
begin object name="MeshEmitter0" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.NovaStaff.Nova-GlowChips'
	UseMeshBlendMode=false
	RenderTwoSided=true
	UseParticleColor=true
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=64,B=0,A=255))
	ColorScale[1]=(RelativeTime=0.0642860,Color=(R=255,G=255,B=64,A=255))
	ColorScale[2]=(RelativeTime=0.1714290,Color=(R=255,G=64,B=0,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
	Opacity=0.7100000
	FadeOutStartTime=2.3600000
	CoordinateSystem=1
	MaxParticles=1
	StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
	StartSizeRange=(X=(Min=0.3000000,Max=0.4000000),Y=(Min=0.3000000,Max=0.4000000),Z=(Min=0.3000000,Max=0.4000000))
	InitialParticlesPerSecond=5000.0000000
	SecondsBeforeInactive=0.0000000
end object
// Reference: MeshEmitter'BallisticProV55.IE_RSDarkGeneral.MeshEmitter1'
begin object name="MeshEmitter1" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Impact.ConcreteChip2'
	UseMeshBlendMode=false
	RenderTwoSided=true
	UseParticleColor=true
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-800.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.4000000,Color=(R=255,G=128,B=0,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
	FadeOutStartTime=1.0950000
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=2.0000000),Y=(Min=0.0000000,Max=2.0000000),Z=(Min=0.0000000,Max=2.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-0.2500000,Max=-0.2500000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=0.3000000,Max=0.5000000),Y=(Min=0.3000000,Max=0.5000000),Z=(Min=0.5000000,Max=1.0000000))
	InitialParticlesPerSecond=5000.0000000
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.5000000,Max=1.5000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=100.0000000),Y=(Min=-500.0000000,Max=500.0000000),Z=(Min=-100.0000000,Max=500.0000000))
	VelocityLossRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=2.0000000,Max=2.0000000),Z=(Min=2.0000000,Max=2.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.IE_RSDarkGeneral.SpriteEmitter3'
begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
	UseDirectionAs=1
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.2500000,Max=0.2500000),Z=(Min=0.0000000,Max=0.0000000))
	Opacity=0.5200000
	FadeOutStartTime=0.1500000
	FadeInEndTime=0.0450000
	MaxParticles=80
	AddLocationFromOtherEmitter=3
	StartSizeRange=(X=(Min=4.0000000,Max=4.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
	InitialParticlesPerSecond=100.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlameParts'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	AddVelocityFromOtherEmitter=3
	AddVelocityMultiplierRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
end object
// Reference: SpriteEmitter'BallisticProV55.IE_RSDarkGeneral.SpriteEmitter4'
begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	ZTest=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=192,A=255))
	ColorScale[1]=(RelativeTime=0.1857140,Color=(R=255,G=192,B=0,A=255))
	ColorScale[2]=(RelativeTime=0.6464290,Color=(R=255,G=0,B=0,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
	FadeOutStartTime=0.0450000
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.5000000)
	SizeScale[1]=(RelativeTime=0.2800000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=150.0000000,Max=150.0000000),Y=(Min=150.0000000,Max=150.0000000),Z=(Min=150.0000000,Max=150.0000000))
	InitialParticlesPerSecond=50000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2500000,Max=0.2500000)
end object
// Reference: SpriteEmitter'BallisticProV55.IE_RSDarkGeneral.SpriteEmitter5'
begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=0,B=0,A=255))
	ColorScale[1]=(RelativeTime=0.1142860,Color=(R=255,G=224,B=192,A=255))
	ColorScale[2]=(RelativeTime=0.2000000,Color=(R=255,G=128,B=0,A=255))
	ColorScale[3]=(RelativeTime=0.2892860,Color=(R=255,G=128,B=0,A=255))
	ColorScale[4]=(RelativeTime=0.4285710,Color=(R=255,G=32,B=0,A=255))
	ColorScale[5]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
	Opacity=0.5300000
	FadeOutStartTime=0.2700000
	FadeInEndTime=0.0500000
	MaxParticles=30
	StartLocationOffset=(X=6.0000000,Y=0.0000000,Z=4.0000000)
	StartLocationRange=(X=(Min=-2.0000000,Max=2.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.4800000,Max=0.5200000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.3000000)
	SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=0.3700000,RelativeSize=0.7500000)
	SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
	StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
	InitialParticlesPerSecond=15.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.BlazingSubdivide'
	TextureUSubdivisions=4
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=3.0000000),Y=(Min=-3.0000000,Max=3.0000000),Z=(Min=45.0000000,Max=45.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.IE_RSDarkGeneral.SpriteEmitter9'
begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.1500000,Max=0.1500000))
	Opacity=0.7200000
	FadeOutStartTime=0.7400000
	FadeInEndTime=0.2200000
	MaxParticles=20
	StartLocationOffset=(X=8.0000000,Y=0.0000000,Z=16.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.3400000,RelativeSize=0.1500000)
	SizeScale[2]=(RelativeTime=0.7400000,RelativeSize=0.5000000)
	SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=35.0000000,Max=35.0000000),Y=(Min=35.0000000,Max=35.0000000),Z=(Min=35.0000000,Max=35.0000000))
	InitialParticlesPerSecond=7.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Effects.Smoke7'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=40.0000000,Max=40.0000000))
	VelocityLossRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.8000000,Max=0.8000000))
end object
