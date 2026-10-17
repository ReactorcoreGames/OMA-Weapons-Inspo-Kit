class RX22AIgniter extends BallisticEmitter;

defaultproperties
{
	EmitterZTestSwitches[0]=0
	EmitterZTestSwitches[1]=2
	// Reference: SpriteEmitter'BallisticProV55.RX22AIgniter.SpriteEmitter4'
	begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		TriggerDisabled=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-50.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=192,B=128,A=255))
		ColorScale[1]=(RelativeTime=0.2892860,Color=(R=128,G=192,B=255,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=64,G=160,B=255,A=255))
		FadeOutStartTime=0.1000000
		CoordinateSystem=1
		MaxParticles=30
		StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=5.0000000,Max=8.0000000),Y=(Min=5.0000000,Max=8.0000000),Z=(Min=5.0000000,Max=8.0000000))
		Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
		SpawnOnTriggerRange=(Min=25.0000000,Max=30.0000000)
		SpawnOnTriggerPPS=200.0000000
		StartVelocityRange=(X=(Min=0.0000000,Max=250.0000000),Y=(Min=-40.0000000,Max=40.0000000),Z=(Min=-40.0000000,Max=40.0000000))
	end object
	Emitters[0]=SpriteEmitter4
	// Reference: SpriteEmitter'BallisticProV55.RX22AIgniter.SpriteEmitter5'
	begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		ZTest=false
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.3035710,Color=(R=64,G=192,B=255,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=64,B=255,A=255))
		Opacity=0.7400000
		FadeOutStartTime=0.0600000
		FadeInEndTime=0.0300000
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=3.0000000,Y=0.0000000,Z=0.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.2000000)
		SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=1.5000000)
		SizeScale[2]=(RelativeTime=0.1700000,RelativeSize=0.8000000)
		SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=0.7000000)
		StartSizeRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=40.0000000,Max=40.0000000),Z=(Min=40.0000000,Max=40.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		LifetimeRange=(Min=0.6000000,Max=0.6000000)
		SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
		SpawnOnTriggerPPS=5000.0000000
	end object
	Emitters[1]=SpriteEmitter5
	// Reference: MeshEmitter'BallisticProV55.RX22AIgniter.MeshEmitter2'
	begin object name="MeshEmitter2" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.A42.A42MuzzleFlash'
		UseMeshBlendMode=false
		RenderTwoSided=true
		UseParticleColor=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=0.8000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=1.0000000,Max=1.0000000))
		FadeOutStartTime=0.2300000
		FadeInEndTime=0.2100000
		CoordinateSystem=1
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.4000000)
		StartSizeRange=(X=(Min=0.1500000,Max=0.1500000),Y=(Min=0.1300000,Max=0.1300000),Z=(Min=0.1300000,Max=0.1300000))
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
		SpawnOnTriggerPPS=5000.0000000
	end object
	Emitters[2]=MeshEmitter2
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.RX22AIgniter.SpriteEmitter4'
begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	TriggerDisabled=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-50.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=192,B=128,A=255))
	ColorScale[1]=(RelativeTime=0.2892860,Color=(R=128,G=192,B=255,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=64,G=160,B=255,A=255))
	FadeOutStartTime=0.1000000
	CoordinateSystem=1
	MaxParticles=30
	StartSpinRange=(X=(Min=0.2500000,Max=0.2500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=5.0000000,Max=8.0000000),Y=(Min=5.0000000,Max=8.0000000),Z=(Min=5.0000000,Max=8.0000000))
	Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
	SpawnOnTriggerRange=(Min=25.0000000,Max=30.0000000)
	SpawnOnTriggerPPS=200.0000000
	StartVelocityRange=(X=(Min=0.0000000,Max=250.0000000),Y=(Min=-40.0000000,Max=40.0000000),Z=(Min=-40.0000000,Max=40.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RX22AIgniter.SpriteEmitter5'
begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	ZTest=false
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.3035710,Color=(R=64,G=192,B=255,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=64,B=255,A=255))
	Opacity=0.7400000
	FadeOutStartTime=0.0600000
	FadeInEndTime=0.0300000
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=3.0000000,Y=0.0000000,Z=0.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.2000000)
	SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=1.5000000)
	SizeScale[2]=(RelativeTime=0.1700000,RelativeSize=0.8000000)
	SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=0.7000000)
	StartSizeRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=40.0000000,Max=40.0000000),Z=(Min=40.0000000,Max=40.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	LifetimeRange=(Min=0.6000000,Max=0.6000000)
	SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
	SpawnOnTriggerPPS=5000.0000000
end object
// Reference: MeshEmitter'BallisticProV55.RX22AIgniter.MeshEmitter2'
begin object name="MeshEmitter2" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.A42.A42MuzzleFlash'
	UseMeshBlendMode=false
	RenderTwoSided=true
	UseParticleColor=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=0.8000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=1.0000000,Max=1.0000000))
	FadeOutStartTime=0.2300000
	FadeInEndTime=0.2100000
	CoordinateSystem=1
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.4000000)
	StartSizeRange=(X=(Min=0.1500000,Max=0.1500000),Y=(Min=0.1300000,Max=0.1300000),Z=(Min=0.1300000,Max=0.1300000))
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
	SpawnOnTriggerPPS=5000.0000000
end object
