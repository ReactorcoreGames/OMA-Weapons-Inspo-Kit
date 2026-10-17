class MACExplodeSphere extends BallisticEmitter;

simulated event PostBeginPlay()
{
	local float Size;

	super.PostBeginPlay();
	// End:0x187
	if((Owner != none) && MACBeacon(Owner) != none)
	{
		Size = MACBeacon(Owner).DamageRadius * (float(1) - (40.0000000 / MACBeacon(Owner).Damage));
		Emitters[0].StartSizeRange.X.Max = Size / 64.0000000;
		Emitters[0].StartSizeRange.X.Min = Size / 64.0000000;
		Emitters[0].StartSizeRange.Y.Max = Size / 64.0000000;
		Emitters[0].StartSizeRange.Y.Min = Size / 64.0000000;
		Emitters[0].StartSizeRange.Z.Max = Size / 64.0000000;
		Emitters[0].StartSizeRange.Z.Min = Size / 64.0000000;
		Emitters[1].StartSizeRange.X.Max = Size;
		Emitters[1].StartSizeRange.X.Min = Size;
	}
	//return;	
}

defaultproperties
{
	EmitterZTestSwitches[0]=0
	EmitterZTestSwitches[1]=2
	// Reference: MeshEmitter'BallisticProV55.MACExplodeSphere.MeshEmitter0'
	begin object name="MeshEmitter0" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.Artillery.ExplodeSphere'
		UseMeshBlendMode=false
		RenderTwoSided=true
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=0,B=0,A=255))
		ColorScale[1]=(RelativeTime=0.0285710,Color=(R=255,G=255,B=255,A=255))
		ColorScale[2]=(RelativeTime=0.0571430,Color=(R=255,G=128,B=0,A=255))
		ColorScale[3]=(RelativeTime=0.0892860,Color=(R=255,G=0,B=0,A=255))
		ColorScale[4]=(RelativeTime=0.1178570,Color=(R=255,G=128,B=0,A=255))
		ColorScale[5]=(RelativeTime=0.1500000,Color=(R=255,G=0,B=0,A=255))
		ColorScale[6]=(RelativeTime=0.1785710,Color=(R=255,G=128,B=0,A=255))
		ColorScale[7]=(RelativeTime=0.2500000,Color=(R=255,G=0,B=0,A=255))
		ColorScale[8]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
		FadeOutStartTime=5.2800000
		MaxParticles=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=6
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=8.0000000,Max=8.0000000)
	end object
	Emitters[0]=MeshEmitter0
	// Reference: SpriteEmitter'BallisticProV55.MACExplodeSphere.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.1642860,Color=(R=255,G=0,B=0,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
		FadeOutStartTime=1.7600000
		MaxParticles=1
		StartSizeRange=(X=(Min=64.0000000,Max=64.0000000),Y=(Min=64.0000000,Max=64.0000000),Z=(Min=64.0000000,Max=64.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		SecondsBeforeInactive=0.0000000
	end object
	Emitters[1]=SpriteEmitter2
	AutoDestroy=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'BallisticProV55.MACExplodeSphere.MeshEmitter0'
begin object name="MeshEmitter0" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Artillery.ExplodeSphere'
	UseMeshBlendMode=false
	RenderTwoSided=true
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=0,B=0,A=255))
	ColorScale[1]=(RelativeTime=0.0285710,Color=(R=255,G=255,B=255,A=255))
	ColorScale[2]=(RelativeTime=0.0571430,Color=(R=255,G=128,B=0,A=255))
	ColorScale[3]=(RelativeTime=0.0892860,Color=(R=255,G=0,B=0,A=255))
	ColorScale[4]=(RelativeTime=0.1178570,Color=(R=255,G=128,B=0,A=255))
	ColorScale[5]=(RelativeTime=0.1500000,Color=(R=255,G=0,B=0,A=255))
	ColorScale[6]=(RelativeTime=0.1785710,Color=(R=255,G=128,B=0,A=255))
	ColorScale[7]=(RelativeTime=0.2500000,Color=(R=255,G=0,B=0,A=255))
	ColorScale[8]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
	FadeOutStartTime=5.2800000
	MaxParticles=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=6
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=8.0000000,Max=8.0000000)
end object
// Reference: SpriteEmitter'BallisticProV55.MACExplodeSphere.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.1642860,Color=(R=255,G=0,B=0,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
	FadeOutStartTime=1.7600000
	MaxParticles=1
	StartSizeRange=(X=(Min=64.0000000,Max=64.0000000),Y=(Min=64.0000000,Max=64.0000000),Z=(Min=64.0000000,Max=64.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	SecondsBeforeInactive=0.0000000
end object
