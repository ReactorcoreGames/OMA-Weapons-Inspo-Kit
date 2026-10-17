class RSNovaAmmoGlowB extends BallisticEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BallisticProV55.RSNovaAmmoGlowB.SpriteEmitter3'
	begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
		UseDirectionAs=1
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.2500000,Max=0.2500000),Z=(Min=1.0000000,Max=1.0000000))
		Opacity=0.7600000
		MaxParticles=1
		StartSizeRange=(X=(Min=15.0000000,Max=15.0000000),Y=(Min=37.0000000,Max=37.0000000),Z=(Min=52.0000000,Max=52.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=1.0000000,Max=1.0000000))
	end object
	Emitters[0]=SpriteEmitter3
	// Reference: SpriteEmitter'BallisticProV55.RSNovaAmmoGlowB.SpriteEmitter4'
	begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.2500000,Max=0.2500000),Z=(Min=1.0000000,Max=1.0000000))
		Opacity=0.7100000
		MaxParticles=1
		StartSizeRange=(X=(Min=15.0000000,Max=15.0000000),Y=(Min=37.0000000,Max=37.0000000),Z=(Min=52.0000000,Max=52.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=1.0000000,Max=1.0000000))
	end object
	Emitters[1]=SpriteEmitter4
	bHardAttach=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.RSNovaAmmoGlowB.SpriteEmitter3'
begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
	UseDirectionAs=1
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.2500000,Max=0.2500000),Z=(Min=1.0000000,Max=1.0000000))
	Opacity=0.7600000
	MaxParticles=1
	StartSizeRange=(X=(Min=15.0000000,Max=15.0000000),Y=(Min=37.0000000,Max=37.0000000),Z=(Min=52.0000000,Max=52.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=1.0000000,Max=1.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RSNovaAmmoGlowB.SpriteEmitter4'
begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.2500000,Max=0.2500000),Z=(Min=1.0000000,Max=1.0000000))
	Opacity=0.7100000
	MaxParticles=1
	StartSizeRange=(X=(Min=15.0000000,Max=15.0000000),Y=(Min=37.0000000,Max=37.0000000),Z=(Min=52.0000000,Max=52.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.HotFlareA1'
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=1.0000000,Max=1.0000000))
end object
