class XOXOCoverGlow extends BallisticEmitter;

function InvertY()
{
	local int i;

	i = 0;
	J0x07:

	// End:0x43 [Loop If]
	if(i < Emitters.Length)
	{
		Emitters[i].StartLocationOffset.Y *= float(-1);
		i++;
		// [Loop Continue]
		goto J0x07;
	}
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'BWBP_OP_Pro.XOXOCoverGlow.XOXOCoverFlare'
	begin object name="XOXOCoverFlare" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.1000000,Max=0.1000000),Z=(Min=0.0000000,Max=0.0000000))
		Opacity=0.5900000
		FadeOutFactor=(W=1.0000000,X=0.5000000,Y=0.5000000,Z=0.5000000)
		FadeOutStartTime=1.2000000
		FadeInFactor=(W=1.0000000,X=0.5000000,Y=0.5000000,Z=0.5000000)
		FadeInEndTime=0.8000000
		CoordinateSystem=1
		MaxParticles=1
		StartSizeRange=(X=(Min=35.0000000,Max=35.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
		InitialParticlesPerSecond=50.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
	end object
	Emitters[0]=XOXOCoverFlare
	// Reference: SpriteEmitter'BWBP_OP_Pro.XOXOCoverGlow.XOXOCoverFlare2'
	begin object name="XOXOCoverFlare2" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=224,B=192,A=255))
		ColorScale[1]=(RelativeTime=0.5000000,Color=(R=255,G=128,B=0,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
		Opacity=0.6300000
		FadeOutStartTime=0.2460000
		FadeInEndTime=0.0780000
		CoordinateSystem=1
		MaxParticles=8
		DetailMode=2
		StartLocationRange=(X=(Min=-3.0000000,Max=3.0000000),Y=(Min=-3.0000000,Max=3.0000000),Z=(Min=6.0000000,Max=6.0000000))
		MeshSpawningStaticMesh=StaticMesh'BW_Core_WeaponStatic.DarkStar.DarkDiamond'
		MeshSpawning=1
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
		SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=0.4000000,Max=1.0000000),Y=(Min=0.4000000,Max=1.0000000),Z=(Min=0.4000000,Max=1.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
		LifetimeRange=(Min=0.4000000,Max=0.6000000)
	end object
	Emitters[1]=XOXOCoverFlare2
	bHardAttach=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_OP_Pro.XOXOCoverGlow.XOXOCoverFlare'
begin object name="XOXOCoverFlare" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.1000000,Max=0.1000000),Z=(Min=0.0000000,Max=0.0000000))
	Opacity=0.5900000
	FadeOutFactor=(W=1.0000000,X=0.5000000,Y=0.5000000,Z=0.5000000)
	FadeOutStartTime=1.2000000
	FadeInFactor=(W=1.0000000,X=0.5000000,Y=0.5000000,Z=0.5000000)
	FadeInEndTime=0.8000000
	CoordinateSystem=1
	MaxParticles=1
	StartSizeRange=(X=(Min=35.0000000,Max=35.0000000),Y=(Min=20.0000000,Max=20.0000000),Z=(Min=20.0000000,Max=20.0000000))
	InitialParticlesPerSecond=50.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
end object
// Reference: SpriteEmitter'BWBP_OP_Pro.XOXOCoverGlow.XOXOCoverFlare2'
begin object name="XOXOCoverFlare2" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=224,B=192,A=255))
	ColorScale[1]=(RelativeTime=0.5000000,Color=(R=255,G=128,B=0,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
	Opacity=0.6300000
	FadeOutStartTime=0.2460000
	FadeInEndTime=0.0780000
	CoordinateSystem=1
	MaxParticles=8
	DetailMode=2
	StartLocationRange=(X=(Min=-3.0000000,Max=3.0000000),Y=(Min=-3.0000000,Max=3.0000000),Z=(Min=6.0000000,Max=6.0000000))
	MeshSpawningStaticMesh=StaticMesh'BW_Core_WeaponStatic.DarkStar.DarkDiamond'
	MeshSpawning=1
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
	SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=0.4000000,Max=1.0000000),Y=(Min=0.4000000,Max=1.0000000),Z=(Min=0.4000000,Max=1.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
	LifetimeRange=(Min=0.4000000,Max=0.6000000)
end object
