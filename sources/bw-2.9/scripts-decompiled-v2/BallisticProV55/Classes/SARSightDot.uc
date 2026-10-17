class SARSightDot extends BallisticEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BallisticProV55.SARSightDot.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseDirectionAs=4
		ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=-20.0000000,Y=0.0000000,Z=27.2500000)
		StartSizeRange=(X=(Min=11.0000000,Max=11.0000000),Y=(Min=11.0000000,Max=11.0000000),Z=(Min=11.0000000,Max=11.0000000))
		Texture=Texture'BW_Core_WeaponTex.SAR.SAR-SightRed'
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[0]=SpriteEmitter0
	bHidden=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.SARSightDot.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseDirectionAs=4
	ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=-20.0000000,Y=0.0000000,Z=27.2500000)
	StartSizeRange=(X=(Min=11.0000000,Max=11.0000000),Y=(Min=11.0000000,Max=11.0000000),Z=(Min=11.0000000,Max=11.0000000))
	Texture=Texture'BW_Core_WeaponTex.SAR.SAR-SightRed'
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
