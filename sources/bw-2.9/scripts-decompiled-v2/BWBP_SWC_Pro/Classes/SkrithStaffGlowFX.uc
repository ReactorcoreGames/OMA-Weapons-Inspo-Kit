class SkrithStaffGlowFX extends BallisticEmitter;

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
	// Reference: SpriteEmitter'BWBP_SWC_Pro.SkrithStaffGlowFX.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		ZTest=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=8.0000000,Max=0.8000000),Y=(Min=2.0000000,Max=0.4000000),Z=(Min=0.0000000,Max=0.2000000))
		FadeOutStartTime=1.0000000
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=22.5000000,Y=0.0000000,Z=0.0000000)
		StartSizeRange=(X=(Min=5.0000000,Max=10.0000000),Y=(Min=5.0000000,Max=10.0000000),Z=(Min=5.0000000,Max=10.0000000))
		Texture=Texture'BW_Core_WeaponTex.A73RedLayout.FlareB1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.1000000,Max=0.1000000)
	end object
	Emitters[0]=SpriteEmitter2
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_SWC_Pro.SkrithStaffGlowFX.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	ZTest=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=8.0000000,Max=0.8000000),Y=(Min=2.0000000,Max=0.4000000),Z=(Min=0.0000000,Max=0.2000000))
	FadeOutStartTime=1.0000000
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=22.5000000,Y=0.0000000,Z=0.0000000)
	StartSizeRange=(X=(Min=5.0000000,Max=10.0000000),Y=(Min=5.0000000,Max=10.0000000),Z=(Min=5.0000000,Max=10.0000000))
	Texture=Texture'BW_Core_WeaponTex.A73RedLayout.FlareB1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.1000000,Max=0.1000000)
end object
