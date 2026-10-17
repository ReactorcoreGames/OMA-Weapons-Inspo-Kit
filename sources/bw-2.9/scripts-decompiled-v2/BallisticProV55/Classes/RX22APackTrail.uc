class RX22APackTrail extends DGVEmitter;

simulated event Tick(float dt)
{
	super(Actor).Tick(dt);
	Emitters[0].StartSpinRange.X.Max = float(Rotation.Yaw) / float(65536);
	Emitters[0].StartSpinRange.X.Min = Emitters[0].StartSpinRange.X.Max;
	Emitters[0].StartSpinRange.Y.Max = (float(Rotation.Pitch) / float(65536)) + 0.5000000;
	Emitters[0].StartSpinRange.Y.Min = Emitters[0].StartSpinRange.Y.Max;
	// End:0xFC
	if(Rotation != OldRotation)
	{
		OldRotation = Rotation;
		AlignVelocity();
	}
	//return;	
}

simulated function InitDGV()
{
	OldRotation = Rotation;
	super.InitDGV();
	//return;	
}

defaultproperties
{
	bVerticalZ=false
	bYIsSpread=false
	// Reference: MeshEmitter'BallisticProV55.RX22APackTrail.MeshEmitter0'
	begin object name="MeshEmitter0" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.M806.PistolMuzzleFlash'
		UseMeshBlendMode=false
		RenderTwoSided=true
		UseParticleColor=true
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.0880000
		FadeInEndTime=0.0720000
		MaxParticles=30
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=2.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7000000)
		SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
		StartSizeRange=(X=(Min=0.4000000,Max=0.5000000),Y=(Min=0.2500000,Max=0.5000000),Z=(Min=0.2500000,Max=0.5000000))
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
		StartVelocityRange=(X=(Min=2800.0000000,Max=3000.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=-100.0000000,Max=100.0000000))
	end object
	Emitters[0]=MeshEmitter0
	// Reference: SpriteEmitter'BallisticProV55.RX22APackTrail.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		Disabled=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.6000000,Max=0.6000000))
		FadeOutStartTime=0.2040000
		FadeInEndTime=0.1760000
		MaxParticles=20
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=120.0000000,Max=120.0000000),Y=(Min=120.0000000,Max=120.0000000),Z=(Min=120.0000000,Max=120.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlameParts'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
		StartVelocityRange=(X=(Min=2800.0000000,Max=3000.0000000),Y=(Min=-200.0000000,Max=200.0000000),Z=(Min=-200.0000000,Max=200.0000000))
	end object
	Emitters[1]=SpriteEmitter0
	// Reference: SpriteEmitter'BallisticProV55.RX22APackTrail.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.6000000,Max=0.6000000))
		FadeOutStartTime=0.2970000
		FadeInEndTime=0.1845000
		MaxParticles=5
		DetailMode=2
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.4000000)
		SizeScale[1]=(RelativeTime=0.5000000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=150.0000000,Max=150.0000000),Y=(Min=150.0000000,Max=150.0000000),Z=(Min=150.0000000,Max=150.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
		LifetimeRange=(Min=0.4500000,Max=0.4500000)
		StartVelocityRange=(X=(Min=2800.0000000,Max=2800.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=-100.0000000,Max=100.0000000))
	end object
	Emitters[2]=SpriteEmitter1
	// Reference: SpriteEmitter'BallisticProV55.RX22APackTrail.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UniformSize=true
		Acceleration=(X=600.0000000,Y=0.0000000,Z=0.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.6000000,Max=0.6000000))
		FadeOutStartTime=0.1700000
		FadeInEndTime=0.0600000
		CoordinateSystem=1
		MaxParticles=3
		StartLocationRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=120.0000000,Max=150.0000000),Y=(Min=120.0000000,Max=150.0000000),Z=(Min=120.0000000,Max=150.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
		LifetimeRange=(Min=0.3000000,Max=0.5000000)
		StartVelocityRange=(X=(Min=-50.0000000,Max=100.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[3]=SpriteEmitter2
	// Reference: TrailEmitter'BallisticProV55.RX22APackTrail.TrailEmitter0'
	begin object name="TrailEmitter0" class=Engine.TrailEmitter
		TrailShadeType=4
		MaxPointsPerTrail=100
		DistanceThreshold=75.0000000
		PointLifeTime=3.0000000
		FadeOut=true
		Disabled=true
		Backup_Disabled=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.7000000,Max=0.8000000),Z=(Min=0.4000000,Max=0.6000000))
		FadeOutStartTime=0.1000000
		DetailMode=2
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=80.0000000,Max=100.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke3'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=3.0000000,Max=3.0000000)
	end object
	Emitters[4]=TrailEmitter0
	// Reference: SpriteEmitter'BallisticProV55.RX22APackTrail.SpriteEmitter3'
	begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.4678570,Color=(R=255,G=192,B=128,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=96,B=32,A=255))
		FadeOutStartTime=0.1470000
		FadeInEndTime=0.0210000
		MaxParticles=2
		DetailMode=2
		StartLocationRange=(X=(Min=0.0000000,Max=200.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.4000000)
		SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.4000000)
		StartSizeRange=(X=(Min=180.0000000,Max=250.0000000),Y=(Min=180.0000000,Max=250.0000000),Z=(Min=180.0000000,Max=250.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.Explode2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2500000,Max=0.4000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=400.0000000),Y=(Min=-200.0000000,Max=200.0000000),Z=(Min=-200.0000000,Max=200.0000000))
	end object
	Emitters[5]=SpriteEmitter3
	// Reference: SpriteEmitter'BallisticProV55.RX22APackTrail.SpriteEmitter4'
	begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		FadeOut=true
		SpinParticles=true
		UniformSize=true
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-600.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=212,B=128,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=64,A=255))
		FadeOutStartTime=0.2800000
		MaxParticles=100
		DetailMode=2
		StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=40.0000000,Max=60.0000000),Y=(Min=40.0000000,Max=60.0000000),Z=(Min=40.0000000,Max=60.0000000))
		Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.7000000,Max=0.7000000)
		StartVelocityRange=(X=(Min=100.0000000,Max=4000.0000000),Y=(Min=-700.0000000,Max=700.0000000),Z=(Min=-700.0000000,Max=700.0000000))
	end object
	Emitters[6]=SpriteEmitter4
	// Reference: SpriteEmitter'BallisticProV55.RX22APackTrail.SpriteEmitter12'
	begin object name="SpriteEmitter12" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=50.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[1]=(RelativeTime=0.2607140,Color=(R=255,G=255,B=255,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
		Opacity=0.6300000
		FadeOutStartTime=0.8850000
		FadeInEndTime=0.3600000
		MaxParticles=80
		DetailMode=2
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.4000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=50.0000000,Max=100.0000000),Y=(Min=50.0000000,Max=100.0000000),Z=(Min=50.0000000,Max=100.0000000))
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke4'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.5000000,Max=1.5000000)
		StartVelocityRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
	end object
	Emitters[7]=SpriteEmitter12
	AutoDestroy=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'BallisticProV55.RX22APackTrail.MeshEmitter0'
begin object name="MeshEmitter0" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.M806.PistolMuzzleFlash'
	UseMeshBlendMode=false
	RenderTwoSided=true
	UseParticleColor=true
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.0880000
	FadeInEndTime=0.0720000
	MaxParticles=30
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=2.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7000000)
	SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
	StartSizeRange=(X=(Min=0.4000000,Max=0.5000000),Y=(Min=0.2500000,Max=0.5000000),Z=(Min=0.2500000,Max=0.5000000))
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
	StartVelocityRange=(X=(Min=2800.0000000,Max=3000.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=-100.0000000,Max=100.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RX22APackTrail.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	Disabled=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.6000000,Max=0.6000000))
	FadeOutStartTime=0.2040000
	FadeInEndTime=0.1760000
	MaxParticles=20
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=120.0000000,Max=120.0000000),Y=(Min=120.0000000,Max=120.0000000),Z=(Min=120.0000000,Max=120.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlameParts'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
	StartVelocityRange=(X=(Min=2800.0000000,Max=3000.0000000),Y=(Min=-200.0000000,Max=200.0000000),Z=(Min=-200.0000000,Max=200.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RX22APackTrail.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.6000000,Max=0.6000000))
	FadeOutStartTime=0.2970000
	FadeInEndTime=0.1845000
	MaxParticles=5
	DetailMode=2
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.4000000)
	SizeScale[1]=(RelativeTime=0.5000000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=150.0000000,Max=150.0000000),Y=(Min=150.0000000,Max=150.0000000),Z=(Min=150.0000000,Max=150.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
	LifetimeRange=(Min=0.4500000,Max=0.4500000)
	StartVelocityRange=(X=(Min=2800.0000000,Max=2800.0000000),Y=(Min=-100.0000000,Max=100.0000000),Z=(Min=-100.0000000,Max=100.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RX22APackTrail.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UniformSize=true
	Acceleration=(X=600.0000000,Y=0.0000000,Z=0.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.6000000,Max=0.6000000))
	FadeOutStartTime=0.1700000
	FadeInEndTime=0.0600000
	CoordinateSystem=1
	MaxParticles=3
	StartLocationRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=120.0000000,Max=150.0000000),Y=(Min=120.0000000,Max=150.0000000),Z=(Min=120.0000000,Max=150.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
	LifetimeRange=(Min=0.3000000,Max=0.5000000)
	StartVelocityRange=(X=(Min=-50.0000000,Max=100.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: TrailEmitter'BallisticProV55.RX22APackTrail.TrailEmitter0'
begin object name="TrailEmitter0" class=Engine.TrailEmitter
	TrailShadeType=4
	MaxPointsPerTrail=100
	DistanceThreshold=75.0000000
	PointLifeTime=3.0000000
	FadeOut=true
	Disabled=true
	Backup_Disabled=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.7000000,Max=0.8000000),Z=(Min=0.4000000,Max=0.6000000))
	FadeOutStartTime=0.1000000
	DetailMode=2
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=80.0000000,Max=100.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke3'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=3.0000000,Max=3.0000000)
end object
// Reference: SpriteEmitter'BallisticProV55.RX22APackTrail.SpriteEmitter3'
begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.4678570,Color=(R=255,G=192,B=128,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=96,B=32,A=255))
	FadeOutStartTime=0.1470000
	FadeInEndTime=0.0210000
	MaxParticles=2
	DetailMode=2
	StartLocationRange=(X=(Min=0.0000000,Max=200.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.4000000)
	SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.4000000)
	StartSizeRange=(X=(Min=180.0000000,Max=250.0000000),Y=(Min=180.0000000,Max=250.0000000),Z=(Min=180.0000000,Max=250.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.Explode2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2500000,Max=0.4000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=400.0000000),Y=(Min=-200.0000000,Max=200.0000000),Z=(Min=-200.0000000,Max=200.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RX22APackTrail.SpriteEmitter4'
begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	FadeOut=true
	SpinParticles=true
	UniformSize=true
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-600.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=212,B=128,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=64,A=255))
	FadeOutStartTime=0.2800000
	MaxParticles=100
	DetailMode=2
	StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=40.0000000,Max=60.0000000),Y=(Min=40.0000000,Max=60.0000000),Z=(Min=40.0000000,Max=60.0000000))
	Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.7000000,Max=0.7000000)
	StartVelocityRange=(X=(Min=100.0000000,Max=4000.0000000),Y=(Min=-700.0000000,Max=700.0000000),Z=(Min=-700.0000000,Max=700.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RX22APackTrail.SpriteEmitter12'
begin object name="SpriteEmitter12" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=50.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[1]=(RelativeTime=0.2607140,Color=(R=255,G=255,B=255,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	Opacity=0.6300000
	FadeOutStartTime=0.8850000
	FadeInEndTime=0.3600000
	MaxParticles=80
	DetailMode=2
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.4000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=50.0000000,Max=100.0000000),Y=(Min=50.0000000,Max=100.0000000),Z=(Min=50.0000000,Max=100.0000000))
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke4'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.5000000,Max=1.5000000)
	StartVelocityRange=(X=(Min=-50.0000000,Max=50.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-50.0000000,Max=50.0000000))
end object
