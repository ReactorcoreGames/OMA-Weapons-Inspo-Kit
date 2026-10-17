class AM67FlashEmitterAlt extends BallisticEmitter;

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
	// Reference: MeshEmitter'BallisticProV55.AM67FlashEmitterAlt.MeshEmitter7'
	begin object name="MeshEmitter7" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.R78.RifleMuzzleFlash'
		UseMeshBlendMode=false
		RenderTwoSided=true
		UseParticleColor=true
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[1]=(RelativeTime=0.1000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[2]=(RelativeTime=0.4000000,Color=(R=66,G=64,B=64,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=128,G=64,B=0,A=0))
		Opacity=0.4000000
		FadeOutStartTime=0.0480000
		CoordinateSystem=1
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=1.5000000,Max=1.5000000),Y=(Min=1.5000000,Max=1.5000000),Z=(Min=1.5000000,Max=1.5000000))
		DrawStyle=6
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.1000000,Max=0.1000000)
		SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
		SpawnOnTriggerPPS=500000.0000000
	end object
	Emitters[0]=MeshEmitter7
	// Reference: SpriteEmitter'BallisticProV55.AM67FlashEmitterAlt.SpriteEmitter11'
	begin object name="SpriteEmitter11" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UniformSize=true
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=192,A=0))
		ColorScale[1]=(RelativeTime=0.1000000,Color=(R=255,G=192,B=0,A=255))
		ColorScale[2]=(RelativeTime=0.3000000,Color=(R=0,G=0,B=0,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=128,G=64,B=0,A=0))
		Opacity=0.3000000
		FadeOutStartTime=0.0540000
		CoordinateSystem=1
		MaxParticles=1
		StartLocationRange=(X=(Min=100.0000000,Max=100.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=90.0000000,Max=90.0000000),Y=(Min=90.0000000,Max=90.0000000),Z=(Min=90.0000000,Max=90.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.1000000,Max=0.1000000)
		SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
		SpawnOnTriggerPPS=500000.0000000
	end object
	Emitters[1]=SpriteEmitter11
	// Reference: SpriteEmitter'BallisticProV55.AM67FlashEmitterAlt.SpriteEmitter21'
	begin object name="SpriteEmitter21" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.5000000,Color=(R=255,G=192,B=64,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=192,B=128,A=255))
		Opacity=0.4000000
		FadeOutStartTime=0.0150000
		FadeInEndTime=0.0150000
		CoordinateSystem=1
		MaxParticles=20
		StartLocationOffset=(X=5.0000000,Y=0.0000000,Z=6.0000000)
		StartSpinRange=(X=(Min=0.2700000,Max=0.2700000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=15.0000000,Max=15.0000000),Y=(Min=15.0000000,Max=15.0000000),Z=(Min=15.0000000,Max=15.0000000))
		Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.1000000,Max=0.1000000)
		SpawnOnTriggerRange=(Min=15.0000000,Max=20.0000000)
		SpawnOnTriggerPPS=50000.0000000
		StartVelocityRange=(X=(Min=300.0000000,Max=3800.0000000),Y=(Min=-300.0000000,Max=300.0000000),Z=(Min=-300.0000000,Max=300.0000000))
	end object
	Emitters[2]=SpriteEmitter21
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'BallisticProV55.AM67FlashEmitterAlt.MeshEmitter7'
begin object name="MeshEmitter7" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.R78.RifleMuzzleFlash'
	UseMeshBlendMode=false
	RenderTwoSided=true
	UseParticleColor=true
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[1]=(RelativeTime=0.1000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[2]=(RelativeTime=0.4000000,Color=(R=66,G=64,B=64,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=128,G=64,B=0,A=0))
	Opacity=0.4000000
	FadeOutStartTime=0.0480000
	CoordinateSystem=1
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.0700000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=1.5000000,Max=1.5000000),Y=(Min=1.5000000,Max=1.5000000),Z=(Min=1.5000000,Max=1.5000000))
	DrawStyle=6
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.1000000,Max=0.1000000)
	SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
	SpawnOnTriggerPPS=500000.0000000
end object
// Reference: SpriteEmitter'BallisticProV55.AM67FlashEmitterAlt.SpriteEmitter11'
begin object name="SpriteEmitter11" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UniformSize=true
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=192,A=0))
	ColorScale[1]=(RelativeTime=0.1000000,Color=(R=255,G=192,B=0,A=255))
	ColorScale[2]=(RelativeTime=0.3000000,Color=(R=0,G=0,B=0,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=128,G=64,B=0,A=0))
	Opacity=0.3000000
	FadeOutStartTime=0.0540000
	CoordinateSystem=1
	MaxParticles=1
	StartLocationRange=(X=(Min=100.0000000,Max=100.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=90.0000000,Max=90.0000000),Y=(Min=90.0000000,Max=90.0000000),Z=(Min=90.0000000,Max=90.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.1000000,Max=0.1000000)
	SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
	SpawnOnTriggerPPS=500000.0000000
end object
// Reference: SpriteEmitter'BallisticProV55.AM67FlashEmitterAlt.SpriteEmitter21'
begin object name="SpriteEmitter21" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.5000000,Color=(R=255,G=192,B=64,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=192,B=128,A=255))
	Opacity=0.4000000
	FadeOutStartTime=0.0150000
	FadeInEndTime=0.0150000
	CoordinateSystem=1
	MaxParticles=20
	StartLocationOffset=(X=5.0000000,Y=0.0000000,Z=6.0000000)
	StartSpinRange=(X=(Min=0.2700000,Max=0.2700000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=15.0000000,Max=15.0000000),Y=(Min=15.0000000,Max=15.0000000),Z=(Min=15.0000000,Max=15.0000000))
	Texture=Texture'BW_Core_WeaponTex.Effects.SparkA1'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.1000000,Max=0.1000000)
	SpawnOnTriggerRange=(Min=15.0000000,Max=20.0000000)
	SpawnOnTriggerPPS=50000.0000000
	StartVelocityRange=(X=(Min=300.0000000,Max=3800.0000000),Y=(Min=-300.0000000,Max=300.0000000),Z=(Min=-300.0000000,Max=300.0000000))
end object
