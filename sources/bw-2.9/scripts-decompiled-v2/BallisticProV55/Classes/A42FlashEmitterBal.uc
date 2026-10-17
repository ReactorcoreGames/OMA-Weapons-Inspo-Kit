class A42FlashEmitterBal extends BallisticEmitter;

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
	// Reference: MeshEmitter'BallisticProV55.A42FlashEmitterBal.MeshEmitter5'
	begin object name="MeshEmitter5" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.A42.A42MuzzleFlash'
		UseMeshBlendMode=false
		RenderTwoSided=true
		UseParticleColor=true
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.1000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[2]=(RelativeTime=0.2000000,Color=(R=96,G=96,B=96,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=25,A=255))
		FadeOutStartTime=0.0200000
		CoordinateSystem=1
		MaxParticles=1
		SpinCCWorCW=(X=0.5000000,Y=0.5000000,Z=0.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=0.8000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=6.0000000,Max=6.0000000),Y=(Min=6.0000000,Max=6.0000000),Z=(Min=6.0000000,Max=6.0000000))
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.6500000,Max=0.6500000)
		SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
		SpawnOnTriggerPPS=500000.0000000
	end object
	Emitters[0]=MeshEmitter5
	// Reference: SpriteEmitter'BallisticProV55.A42FlashEmitterBal.SpriteEmitter10'
	begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UniformSize=true
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.1000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[2]=(RelativeTime=0.2000000,Color=(R=96,G=96,B=96,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=24,A=255))
		ColorMultiplierRange=(X=(Min=8.0000000,Max=0.8000000),Y=(Min=0.2000000,Max=0.4000000),Z=(Min=0.0000000,Max=0.2000000))
		FadeOutStartTime=0.0200000
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=40.0000000,Y=0.0000000,Z=0.0000000)
		StartSizeRange=(X=(Min=240.0000000,Max=240.0000000),Y=(Min=240.0000000,Max=240.0000000),Z=(Min=240.0000000,Max=240.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
		SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
		SpawnOnTriggerPPS=500000.0000000
	end object
	Emitters[1]=SpriteEmitter10
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'BallisticProV55.A42FlashEmitterBal.MeshEmitter5'
begin object name="MeshEmitter5" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.A42.A42MuzzleFlash'
	UseMeshBlendMode=false
	RenderTwoSided=true
	UseParticleColor=true
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.1000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[2]=(RelativeTime=0.2000000,Color=(R=96,G=96,B=96,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=25,A=255))
	FadeOutStartTime=0.0200000
	CoordinateSystem=1
	MaxParticles=1
	SpinCCWorCW=(X=0.5000000,Y=0.5000000,Z=0.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=0.8000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=6.0000000,Max=6.0000000),Y=(Min=6.0000000,Max=6.0000000),Z=(Min=6.0000000,Max=6.0000000))
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.6500000,Max=0.6500000)
	SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
	SpawnOnTriggerPPS=500000.0000000
end object
// Reference: SpriteEmitter'BallisticProV55.A42FlashEmitterBal.SpriteEmitter10'
begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UniformSize=true
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.1000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[2]=(RelativeTime=0.2000000,Color=(R=96,G=96,B=96,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=24,A=255))
	ColorMultiplierRange=(X=(Min=8.0000000,Max=0.8000000),Y=(Min=0.2000000,Max=0.4000000),Z=(Min=0.0000000,Max=0.2000000))
	FadeOutStartTime=0.0200000
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=40.0000000,Y=0.0000000,Z=0.0000000)
	StartSizeRange=(X=(Min=240.0000000,Max=240.0000000),Y=(Min=240.0000000,Max=240.0000000),Z=(Min=240.0000000,Max=240.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
	SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
	SpawnOnTriggerPPS=500000.0000000
end object
