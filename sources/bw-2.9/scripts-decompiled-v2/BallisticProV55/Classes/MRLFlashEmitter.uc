class MRLFlashEmitter extends BallisticEmitter;

var() Vector TubeOffsets[18];

simulated function InitMRLFlash(float Scale)
{
	local int i;

	i = 0;
	J0x07:

	// End:0x2F [Loop If]
	if(i < 18)
	{
		TubeOffsets[i] *= Scale;
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	//return;	
}

simulated function SetBarrelIndex(int Index)
{
	Emitters[0].StartLocationOffset = TubeOffsets[Index];
	Emitters[1].StartLocationOffset = TubeOffsets[Index] + vect(25.0000000, 0.0000000, 0.0000000);
	//return;	
}

defaultproperties
{
	TubeOffsets[0]=(X=-5.0000000,Y=-7.5000000,Z=0.0000000)
	TubeOffsets[1]=(X=-23.0000000,Y=-11.2500000,Z=-6.5000000)
	TubeOffsets[2]=(X=-35.0000000,Y=-8.0000000,Z=-13.8500000)
	TubeOffsets[3]=(X=-5.0000000,Y=-3.7500000,Z=-6.4900000)
	TubeOffsets[4]=(X=-23.0000000,Y=0.0000000,Z=-13.0000000)
	TubeOffsets[5]=(X=-35.0000000,Y=8.0000000,Z=-13.5000000)
	TubeOffsets[6]=(X=-5.0000000,Y=3.7500000,Z=-6.4900000)
	TubeOffsets[7]=(X=-23.0000000,Y=11.2500000,Z=-6.5000000)
	TubeOffsets[8]=(X=-35.0000000,Y=16.0000000,Z=0.0000000)
	TubeOffsets[9]=(X=-5.0000000,Y=7.5000000,Z=0.0000000)
	TubeOffsets[10]=(X=-23.0000000,Y=11.2500000,Z=6.5000000)
	TubeOffsets[11]=(X=-35.0000000,Y=8.0000000,Z=13.5000000)
	TubeOffsets[12]=(X=-5.0000000,Y=3.7500000,Z=6.4900000)
	TubeOffsets[13]=(X=-23.0000000,Y=0.0000000,Z=13.0000000)
	TubeOffsets[14]=(X=-35.0000000,Y=-8.0000000,Z=13.8500000)
	TubeOffsets[15]=(X=-5.0000000,Y=-3.7500000,Z=6.4900000)
	TubeOffsets[16]=(X=-23.0000000,Y=-11.2500000,Z=6.5000000)
	TubeOffsets[17]=(X=-35.0000000,Y=-16.0000000,Z=0.0000000)
	// Reference: MeshEmitter'BallisticProV55.MRLFlashEmitter.MeshEmitter0'
	begin object name="MeshEmitter0" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.R78.RifleMuzzleFlash'
		UseMeshBlendMode=false
		RenderTwoSided=true
		UseParticleColor=true
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=64,A=255))
		FadeOutStartTime=0.0700000
		FadeInEndTime=0.0560000
		CoordinateSystem=1
		MaxParticles=20
		StartLocationOffset=(X=-5.0000000,Y=-7.5000000,Z=0.0000000)
		StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
		SizeScale[1]=(RelativeTime=0.3400000,RelativeSize=0.6000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.2500000)
		StartSizeRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.3500000,Max=0.3500000)
		SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
		SpawnOnTriggerPPS=50000.0000000
	end object
	Emitters[0]=MeshEmitter0
	// Reference: SpriteEmitter'BallisticProV55.MRLFlashEmitter.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UniformSize=true
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=192,B=128,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=64,A=255))
		FadeOutStartTime=0.1575000
		FadeInEndTime=0.0980000
		CoordinateSystem=1
		MaxParticles=20
		StartLocationOffset=(X=20.0000000,Y=-7.5000000,Z=0.0000000)
		StartSizeRange=(X=(Min=30.0000000,Max=30.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=30.0000000,Max=30.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.3500000,Max=0.3500000)
		SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
		SpawnOnTriggerPPS=50000.0000000
	end object
	Emitters[1]=SpriteEmitter0
	// Reference: SpriteEmitter'BallisticProV55.MRLFlashEmitter.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.7500000,Max=0.7500000),Y=(Min=0.7500000,Max=0.7500000),Z=(Min=0.7500000,Max=0.7500000))
		Opacity=0.8500000
		FadeOutStartTime=1.7100000
		FadeInEndTime=0.3000000
		MaxParticles=20
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.SmokeWisp-Alpha'
		TextureUSubdivisions=4
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=3.0000000,Max=3.0000000)
		SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
		SpawnOnTriggerPPS=6.0000000
		StartVelocityRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=50.0000000,Max=50.0000000))
		VelocityLossRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
	end object
	Emitters[2]=SpriteEmitter1
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'BallisticProV55.MRLFlashEmitter.MeshEmitter0'
begin object name="MeshEmitter0" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.R78.RifleMuzzleFlash'
	UseMeshBlendMode=false
	RenderTwoSided=true
	UseParticleColor=true
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=64,A=255))
	FadeOutStartTime=0.0700000
	FadeInEndTime=0.0560000
	CoordinateSystem=1
	MaxParticles=20
	StartLocationOffset=(X=-5.0000000,Y=-7.5000000,Z=0.0000000)
	StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
	SizeScale[1]=(RelativeTime=0.3400000,RelativeSize=0.6000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.2500000)
	StartSizeRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=0.5000000),Z=(Min=0.5000000,Max=0.5000000))
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.3500000,Max=0.3500000)
	SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
	SpawnOnTriggerPPS=50000.0000000
end object
// Reference: SpriteEmitter'BallisticProV55.MRLFlashEmitter.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UniformSize=true
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=192,B=128,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=64,A=255))
	FadeOutStartTime=0.1575000
	FadeInEndTime=0.0980000
	CoordinateSystem=1
	MaxParticles=20
	StartLocationOffset=(X=20.0000000,Y=-7.5000000,Z=0.0000000)
	StartSizeRange=(X=(Min=30.0000000,Max=30.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=30.0000000,Max=30.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.3500000,Max=0.3500000)
	SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
	SpawnOnTriggerPPS=50000.0000000
end object
// Reference: SpriteEmitter'BallisticProV55.MRLFlashEmitter.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.7500000,Max=0.7500000),Y=(Min=0.7500000,Max=0.7500000),Z=(Min=0.7500000,Max=0.7500000))
	Opacity=0.8500000
	FadeOutStartTime=1.7100000
	FadeInEndTime=0.3000000
	MaxParticles=20
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.SmokeWisp-Alpha'
	TextureUSubdivisions=4
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=3.0000000,Max=3.0000000)
	SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
	SpawnOnTriggerPPS=6.0000000
	StartVelocityRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=50.0000000,Max=50.0000000))
	VelocityLossRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.2000000,Max=0.2000000))
end object
