class CYLOFirestormRedGlow extends BallisticEmitter;

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x29
	if(WeaponAttachment(Owner) != none)
	{
		Emitters[0].ZTest = true;
	}
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'BWBP_SKC_Pro.CYLOFirestormRedGlow.SpriteEmitter6'
	begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.6071430,Color=(R=255,G=128,B=64,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=64,A=255))
		ColorMultiplierRange=(X=(Min=0.8300000,Max=0.8300000),Y=(Min=0.6300000,Max=0.6300000),Z=(Min=0.4300000,Max=0.6300000))
		FadeOutStartTime=0.7000000
		FadeInEndTime=0.2000000
		CoordinateSystem=1
		MaxParticles=7
		DetailMode=1
		StartLocationOffset=(X=-20.0000000,Y=0.0000000,Z=0.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=0.6200000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=5.0000000,Max=5.0000000),Y=(Min=5.0000000,Max=5.0000000),Z=(Min=5.0000000,Max=5.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=60.0000000,Max=60.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[0]=SpriteEmitter6
	// Reference: SpriteEmitter'BWBP_SKC_Pro.CYLOFirestormRedGlow.SpriteEmitter39'
	begin object name="SpriteEmitter39" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		UseRandomSubdivision=true
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.3500000,Max=0.3500000),Y=(Min=0.3500000,Max=0.3500000),Z=(Min=0.3500000,Max=0.3500000))
		Opacity=0.4000000
		FadeOutStartTime=0.5200000
		FadeInEndTime=0.2200000
		MaxParticles=20
		DetailMode=2
		StartLocationRange=(X=(Min=-60.0000000,Max=20.0000000),Y=(Min=-12.0000000,Max=12.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.7000000)
		SizeScale[1]=(RelativeTime=0.6200000,RelativeSize=3.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
		StartSizeRange=(X=(Min=6.0000000,Max=8.0000000),Y=(Min=6.0000000,Max=8.0000000),Z=(Min=6.0000000,Max=8.0000000))
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.SmokeWisp-Alpha'
		TextureUSubdivisions=4
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=30.0000000,Max=60.0000000))
	end object
	Emitters[1]=SpriteEmitter39
	// Reference: SpriteEmitter'BWBP_SKC_Pro.CYLOFirestormRedGlow.SpriteEmitter26'
	begin object name="SpriteEmitter26" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		UseRandomSubdivision=true
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=160,G=180,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.3000000,Color=(R=91,G=91,B=91,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.2100000
		FadeOutStartTime=1.0200000
		FadeInEndTime=0.5600000
		MaxParticles=20
		StartLocationRange=(X=(Min=-30.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=3.0000000)
		SizeScale[1]=(RelativeTime=0.6200000,RelativeSize=5.5000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=8.0000000)
		StartSizeRange=(X=(Min=12.0000000,Max=16.0000000),Y=(Min=12.0000000,Max=16.0000000),Z=(Min=12.0000000,Max=16.0000000))
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.SmokeWisp-Alpha'
		TextureUSubdivisions=4
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=50.0000000,Max=65.0000000))
	end object
	Emitters[2]=SpriteEmitter26
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_SKC_Pro.CYLOFirestormRedGlow.SpriteEmitter6'
begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.6071430,Color=(R=255,G=128,B=64,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=64,A=255))
	ColorMultiplierRange=(X=(Min=0.8300000,Max=0.8300000),Y=(Min=0.6300000,Max=0.6300000),Z=(Min=0.4300000,Max=0.6300000))
	FadeOutStartTime=0.7000000
	FadeInEndTime=0.2000000
	CoordinateSystem=1
	MaxParticles=7
	DetailMode=1
	StartLocationOffset=(X=-20.0000000,Y=0.0000000,Z=0.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=0.6200000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=5.0000000,Max=5.0000000),Y=(Min=5.0000000,Max=5.0000000),Z=(Min=5.0000000,Max=5.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=60.0000000,Max=60.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.CYLOFirestormRedGlow.SpriteEmitter39'
begin object name="SpriteEmitter39" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	UseRandomSubdivision=true
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.3500000,Max=0.3500000),Y=(Min=0.3500000,Max=0.3500000),Z=(Min=0.3500000,Max=0.3500000))
	Opacity=0.4000000
	FadeOutStartTime=0.5200000
	FadeInEndTime=0.2200000
	MaxParticles=20
	DetailMode=2
	StartLocationRange=(X=(Min=-60.0000000,Max=20.0000000),Y=(Min=-12.0000000,Max=12.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.7000000)
	SizeScale[1]=(RelativeTime=0.6200000,RelativeSize=3.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
	StartSizeRange=(X=(Min=6.0000000,Max=8.0000000),Y=(Min=6.0000000,Max=8.0000000),Z=(Min=6.0000000,Max=8.0000000))
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.SmokeWisp-Alpha'
	TextureUSubdivisions=4
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=30.0000000,Max=60.0000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.CYLOFirestormRedGlow.SpriteEmitter26'
begin object name="SpriteEmitter26" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	UseRandomSubdivision=true
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=160,G=180,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.3000000,Color=(R=91,G=91,B=91,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.2100000
	FadeOutStartTime=1.0200000
	FadeInEndTime=0.5600000
	MaxParticles=20
	StartLocationRange=(X=(Min=-30.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=3.0000000)
	SizeScale[1]=(RelativeTime=0.6200000,RelativeSize=5.5000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=8.0000000)
	StartSizeRange=(X=(Min=12.0000000,Max=16.0000000),Y=(Min=12.0000000,Max=16.0000000),Z=(Min=12.0000000,Max=16.0000000))
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.SmokeWisp-Alpha'
	TextureUSubdivisions=4
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=50.0000000,Max=65.0000000))
end object
