class LAWLaserBlast extends BallisticEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BWBP_SKC_Pro.LAWLaserBlast.SpriteEmitter3'
	begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.8000000,Max=1.0000000),Z=(Min=0.1000000,Max=0.3000000))
		FadeOutStartTime=0.0250000
		FadeInEndTime=0.0060000
		CoordinateSystem=1
		MaxParticles=2
		StartLocationOffset=(X=0.3000000,Y=0.0000000,Z=0.0000000)
		StartSizeRange=(X=(Min=1.7000000,Max=2.1000000),Y=(Min=1.7000000,Max=2.1000000),Z=(Min=1.7000000,Max=2.1000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.0500000,Max=0.1000000)
	end object
	Emitters[0]=SpriteEmitter3
	// Reference: SpriteEmitter'BWBP_SKC_Pro.LAWLaserBlast.SpriteEmitter9'
	begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
		UseDirectionAs=1
		FadeOut=true
		FadeIn=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.8000000,Max=1.0000000),Z=(Min=0.1000000,Max=0.3000000))
		Opacity=0.4600000
		FadeOutStartTime=0.1280000
		FadeInEndTime=0.1280000
		CoordinateSystem=1
		MaxParticles=4
		StartLocationOffset=(X=2.0000000,Y=0.0000000,Z=0.0000000)
		StartSizeRange=(X=(Min=2.0000000,Max=3.0000000),Y=(Min=2.0000000,Max=3.0000000),Z=(Min=2.0000000,Max=3.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.WaterSpray1'
		LifetimeRange=(Min=0.2000000,Max=0.5000000)
		StartVelocityRange=(X=(Min=0.0100000,Max=0.0100000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[1]=SpriteEmitter9
	bHidden=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_SKC_Pro.LAWLaserBlast.SpriteEmitter3'
begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.8000000,Max=1.0000000),Z=(Min=0.1000000,Max=0.3000000))
	FadeOutStartTime=0.0250000
	FadeInEndTime=0.0060000
	CoordinateSystem=1
	MaxParticles=2
	StartLocationOffset=(X=0.3000000,Y=0.0000000,Z=0.0000000)
	StartSizeRange=(X=(Min=1.7000000,Max=2.1000000),Y=(Min=1.7000000,Max=2.1000000),Z=(Min=1.7000000,Max=2.1000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.0500000,Max=0.1000000)
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.LAWLaserBlast.SpriteEmitter9'
begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
	UseDirectionAs=1
	FadeOut=true
	FadeIn=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=0.8000000,Max=1.0000000),Z=(Min=0.1000000,Max=0.3000000))
	Opacity=0.4600000
	FadeOutStartTime=0.1280000
	FadeInEndTime=0.1280000
	CoordinateSystem=1
	MaxParticles=4
	StartLocationOffset=(X=2.0000000,Y=0.0000000,Z=0.0000000)
	StartSizeRange=(X=(Min=2.0000000,Max=3.0000000),Y=(Min=2.0000000,Max=3.0000000),Z=(Min=2.0000000,Max=3.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.WaterSpray1'
	LifetimeRange=(Min=0.2000000,Max=0.5000000)
	StartVelocityRange=(X=(Min=0.0100000,Max=0.0100000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
