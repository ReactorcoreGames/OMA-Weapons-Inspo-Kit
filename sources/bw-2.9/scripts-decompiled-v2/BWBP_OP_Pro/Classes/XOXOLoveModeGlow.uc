class XOXOLoveModeGlow extends BallisticEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BWBP_OP_Pro.XOXOLoveModeGlow.LuvLuvHeartz'
	begin object name="LuvLuvHeartz" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UniformSize=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=250.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.2500000,Max=1.0000000))
		Opacity=0.8400000
		FadeOutStartTime=0.2300000
		FadeInEndTime=0.0900000
		MaxParticles=20
		StartLocationRange=(X=(Min=-22.0000000,Max=22.0000000),Y=(Min=-22.0000000,Max=22.0000000),Z=(Min=-44.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=4.0000000,Max=12.0000000),Y=(Min=4.0000000,Max=12.0000000),Z=(Min=4.0000000,Max=12.0000000))
		DrawStyle=1
		Texture=Texture'BWBP_OP_Tex.XOXO.hearteffect'
		LifetimeRange=(Min=0.7500000,Max=0.7500000)
	end object
	Emitters[0]=LuvLuvHeartz
	// Reference: SpriteEmitter'BWBP_OP_Pro.XOXOLoveModeGlow.LuvLuvSmoke'
	begin object name="LuvLuvSmoke" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		UniformSize=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=100.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=0,B=0,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=255,A=255))
		Opacity=0.2600000
		FadeOutStartTime=1.1000000
		FadeInEndTime=0.0600000
		CoordinateSystem=1
		MaxParticles=25
		StartLocationRange=(X=(Min=-16.0000000,Max=16.0000000),Y=(Min=-16.0000000,Max=16.0000000),Z=(Min=-44.0000000,Max=-44.0000000))
		StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke5'
		LifetimeRange=(Min=1.5000000,Max=2.0000000)
	end object
	Emitters[1]=LuvLuvSmoke
	// Reference: MeshEmitter'BWBP_OP_Pro.XOXOLoveModeGlow.SuperHeart'
	begin object name="SuperHeart" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BWBP_OP_Static.XOXO.Heart'
		SpinParticles=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=60.0000000)
		SpinCCWorCW=(X=1.0000000,Y=1.0000000,Z=1.0000000)
		SpinsPerSecondRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[2]=SuperHeart
	// Reference: SpriteEmitter'BWBP_OP_Pro.XOXOLoveModeGlow.LuvLuvGlow'
	begin object name="LuvLuvGlow" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=160,B=255,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=64,B=255,A=0))
		ColorScaleRepeats=1.0000000
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.8000000,Max=0.8000000))
		Opacity=0.4000000
		FadeOutStartTime=0.2000000
		CoordinateSystem=1
		MaxParticles=5
		DetailMode=1
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=60.0000000)
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=70.0000000,Max=70.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		ParticlesPerSecond=2.0000000
		InitialParticlesPerSecond=2.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.7500000,Max=0.7500000)
	end object
	Emitters[3]=LuvLuvGlow
	AmbientSound=Sound'GeneralAmbience.texture31'
	SoundVolume=255
	SoundRadius=256.0000000
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_OP_Pro.XOXOLoveModeGlow.LuvLuvHeartz'
begin object name="LuvLuvHeartz" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UniformSize=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=250.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.2500000,Max=1.0000000))
	Opacity=0.8400000
	FadeOutStartTime=0.2300000
	FadeInEndTime=0.0900000
	MaxParticles=20
	StartLocationRange=(X=(Min=-22.0000000,Max=22.0000000),Y=(Min=-22.0000000,Max=22.0000000),Z=(Min=-44.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=4.0000000,Max=12.0000000),Y=(Min=4.0000000,Max=12.0000000),Z=(Min=4.0000000,Max=12.0000000))
	DrawStyle=1
	Texture=Texture'BWBP_OP_Tex.XOXO.hearteffect'
	LifetimeRange=(Min=0.7500000,Max=0.7500000)
end object
// Reference: SpriteEmitter'BWBP_OP_Pro.XOXOLoveModeGlow.LuvLuvSmoke'
begin object name="LuvLuvSmoke" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	UniformSize=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=100.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=0,B=0,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=255,A=255))
	Opacity=0.2600000
	FadeOutStartTime=1.1000000
	FadeInEndTime=0.0600000
	CoordinateSystem=1
	MaxParticles=25
	StartLocationRange=(X=(Min=-16.0000000,Max=16.0000000),Y=(Min=-16.0000000,Max=16.0000000),Z=(Min=-44.0000000,Max=-44.0000000))
	StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke5'
	LifetimeRange=(Min=1.5000000,Max=2.0000000)
end object
// Reference: MeshEmitter'BWBP_OP_Pro.XOXOLoveModeGlow.SuperHeart'
begin object name="SuperHeart" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BWBP_OP_Static.XOXO.Heart'
	SpinParticles=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=60.0000000)
	SpinCCWorCW=(X=1.0000000,Y=1.0000000,Z=1.0000000)
	SpinsPerSecondRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
// Reference: SpriteEmitter'BWBP_OP_Pro.XOXOLoveModeGlow.LuvLuvGlow'
begin object name="LuvLuvGlow" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=160,B=255,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=64,B=255,A=0))
	ColorScaleRepeats=1.0000000
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.4000000,Max=0.4000000),Z=(Min=0.8000000,Max=0.8000000))
	Opacity=0.4000000
	FadeOutStartTime=0.2000000
	CoordinateSystem=1
	MaxParticles=5
	DetailMode=1
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=60.0000000)
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=70.0000000,Max=70.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	ParticlesPerSecond=2.0000000
	InitialParticlesPerSecond=2.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.7500000,Max=0.7500000)
end object
