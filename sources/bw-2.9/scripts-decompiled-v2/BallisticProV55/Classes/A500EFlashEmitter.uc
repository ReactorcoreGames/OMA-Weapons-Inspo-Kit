class A500EFlashEmitter extends BallisticEmitter;

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x29
	if(WeaponAttachment(Owner) != none)
	{
		Emitters[1].ZTest = true;
	}
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'BallisticProV55.A500EFlashEmitter.SpriteEmitter10'
	begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		TriggerDisabled=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-300.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=128,B=0,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=96,B=0,A=0))
		FadeOutStartTime=0.4500000
		FadeInEndTime=0.0500000
		CoordinateSystem=1
		MaxParticles=25
		StartSpinRange=(X=(Min=-16384.0000000,Max=-16384.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=25.0000000,Max=30.0000000),Y=(Min=35.0000000,Max=100.0000000),Z=(Min=50.0000000,Max=50.0000000))
		Texture=Texture'BW_Core_WeaponTex.Reptile.AcidDrops01'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
		SpawnOnTriggerPPS=550.0000000
		StartVelocityRange=(X=(Min=150.0000000,Max=1500.0000000),Y=(Min=-300.0000000,Max=300.0000000),Z=(Min=-200.0000000,Max=200.0000000))
	end object
	Emitters[0]=SpriteEmitter10
	// Reference: MeshEmitter'BallisticProV55.A500EFlashEmitter.MeshEmitter2'
	begin object name="MeshEmitter2" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.Reptile.Reptile_MuzzleFlash'
		UseMeshBlendMode=false
		RenderTwoSided=true
		UseParticleColor=true
		UseColorScale=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=128,B=0,A=255))
		ColorScale[1]=(RelativeTime=0.2500000,Color=(R=255,G=96,B=0,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=255))
		CoordinateSystem=1
		MaxParticles=1
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-0.5000000,Max=0.5000000))
		StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-1.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=1.5000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
		SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
		SpawnOnTriggerPPS=500000.0000000
	end object
	Emitters[1]=MeshEmitter2
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.A500EFlashEmitter.SpriteEmitter10'
begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	TriggerDisabled=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-300.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=128,B=0,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=96,B=0,A=0))
	FadeOutStartTime=0.4500000
	FadeInEndTime=0.0500000
	CoordinateSystem=1
	MaxParticles=25
	StartSpinRange=(X=(Min=-16384.0000000,Max=-16384.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=25.0000000,Max=30.0000000),Y=(Min=35.0000000,Max=100.0000000),Z=(Min=50.0000000,Max=50.0000000))
	Texture=Texture'BW_Core_WeaponTex.Reptile.AcidDrops01'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
	SpawnOnTriggerPPS=550.0000000
	StartVelocityRange=(X=(Min=150.0000000,Max=1500.0000000),Y=(Min=-300.0000000,Max=300.0000000),Z=(Min=-200.0000000,Max=200.0000000))
end object
// Reference: MeshEmitter'BallisticProV55.A500EFlashEmitter.MeshEmitter2'
begin object name="MeshEmitter2" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Reptile.Reptile_MuzzleFlash'
	UseMeshBlendMode=false
	RenderTwoSided=true
	UseParticleColor=true
	UseColorScale=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=128,B=0,A=255))
	ColorScale[1]=(RelativeTime=0.2500000,Color=(R=255,G=96,B=0,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=255))
	CoordinateSystem=1
	MaxParticles=1
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-0.5000000,Max=0.5000000))
	StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-1.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=1.5000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
	SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
	SpawnOnTriggerPPS=500000.0000000
end object
