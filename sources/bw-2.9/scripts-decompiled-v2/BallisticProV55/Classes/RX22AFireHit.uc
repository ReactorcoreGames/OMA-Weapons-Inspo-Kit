class RX22AFireHit extends DGVEmitter;

simulated event Tick(float dt)
{
	super(Actor).Tick(dt);
	Emitters[0].StartSpinRange.X.Max = float(Rotation.Yaw) / float(65536);
	Emitters[0].StartSpinRange.X.Min = Emitters[0].StartSpinRange.X.Max;
	Emitters[0].StartSpinRange.Y.Max = float(Rotation.Pitch) / float(65536);
	Emitters[0].StartSpinRange.Y.Min = Emitters[0].StartSpinRange.Y.Max;
	// End:0xF5
	if(Rotation != OldRotation)
	{
		OldRotation = Rotation;
		AlignVelocity();
	}
	//return;	
}

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	SetTimer(0.2500000, true);
	Timer();
	//return;	
}

simulated event Timer()
{
	// End:0x33
	if(!Level.GetLocalPlayerController().LineOfSightTo(self))
	{
		Emitters[2].ZTest = true;		
	}
	else
	{
		Emitters[2].ZTest = false;
	}
	//return;	
}

defaultproperties
{
	bVerticalZ=false
	bYIsSpread=false
	// Reference: MeshEmitter'BallisticProV55.RX22AFireHit.MeshEmitter1'
	begin object name="MeshEmitter1" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.Effects.FBlast'
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
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=192,B=128,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.6000000,Max=0.6000000))
		FadeOutStartTime=0.1610000
		FadeInEndTime=0.1190000
		MaxParticles=4
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=-30.0000000,Max=30.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=1.0000000,Max=3.0000000),Y=(Min=4.0000000,Max=5.0000000),Z=(Min=4.0000000,Max=5.0000000))
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.6000000,Max=0.7000000)
	end object
	Emitters[0]=MeshEmitter1
	// Reference: SpriteEmitter'BallisticProV55.RX22AFireHit.SpriteEmitter3'
	begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
		UseDirectionAs=1
		ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		Disabled=true
		UniformSize=true
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=192,B=128,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.6000000,Max=0.6000000))
		FadeOutStartTime=0.2150000
		FadeInEndTime=0.1050000
		MaxParticles=40
		StartLocationOffset=(X=40.0000000,Y=0.0000000,Z=0.0000000)
		StartSizeRange=(X=(Min=50.0000000,Max=80.0000000),Y=(Min=50.0000000,Max=80.0000000),Z=(Min=50.0000000,Max=80.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlameParts'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4500000,Max=0.5500000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-600.0000000,Max=600.0000000),Z=(Min=-600.0000000,Max=600.0000000))
	end object
	Emitters[1]=SpriteEmitter3
	// Reference: SpriteEmitter'BallisticProV55.RX22AFireHit.SpriteEmitter4'
	begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		ZTest=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.5000000,Max=0.5000000))
		FadeOutStartTime=0.3000000
		FadeInEndTime=0.2040000
		MaxParticles=2
		StartLocationOffset=(X=40.0000000,Y=0.0000000,Z=0.0000000)
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=-30.0000000,Max=30.0000000))
		StartSizeRange=(X=(Min=180.0000000,Max=220.0000000),Y=(Min=180.0000000,Max=220.0000000),Z=(Min=180.0000000,Max=220.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.6000000,Max=0.6000000)
	end object
	Emitters[2]=SpriteEmitter4
	AutoDestroy=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'BallisticProV55.RX22AFireHit.MeshEmitter1'
begin object name="MeshEmitter1" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Effects.FBlast'
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
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=192,B=128,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.6000000,Max=0.6000000))
	FadeOutStartTime=0.1610000
	FadeInEndTime=0.1190000
	MaxParticles=4
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=-30.0000000,Max=30.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=1.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=1.0000000,Max=3.0000000),Y=(Min=4.0000000,Max=5.0000000),Z=(Min=4.0000000,Max=5.0000000))
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.6000000,Max=0.7000000)
end object
// Reference: SpriteEmitter'BallisticProV55.RX22AFireHit.SpriteEmitter3'
begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
	UseDirectionAs=1
	ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	Disabled=true
	UniformSize=true
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=192,B=128,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.6000000,Max=0.6000000))
	FadeOutStartTime=0.2150000
	FadeInEndTime=0.1050000
	MaxParticles=40
	StartLocationOffset=(X=40.0000000,Y=0.0000000,Z=0.0000000)
	StartSizeRange=(X=(Min=50.0000000,Max=80.0000000),Y=(Min=50.0000000,Max=80.0000000),Z=(Min=50.0000000,Max=80.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlameParts'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4500000,Max=0.5500000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-600.0000000,Max=600.0000000),Z=(Min=-600.0000000,Max=600.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RX22AFireHit.SpriteEmitter4'
begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	ZTest=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.5000000,Max=0.5000000))
	FadeOutStartTime=0.3000000
	FadeInEndTime=0.2040000
	MaxParticles=2
	StartLocationOffset=(X=40.0000000,Y=0.0000000,Z=0.0000000)
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=-30.0000000,Max=30.0000000))
	StartSizeRange=(X=(Min=180.0000000,Max=220.0000000),Y=(Min=180.0000000,Max=220.0000000),Z=(Min=180.0000000,Max=220.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.6000000,Max=0.6000000)
end object
