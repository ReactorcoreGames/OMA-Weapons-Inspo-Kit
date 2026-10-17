class HVPCMk66GreenGlow extends BallisticEmitter;

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

simulated function SetColorShift(float Alpha)
{
	Emitters[0].ColorMultiplierRange.X.Min = Lerp(Alpha, 0.4000000, 1.0000000);
	Emitters[0].ColorMultiplierRange.X.Max = Emitters[0].ColorMultiplierRange.X.Min;
	Emitters[0].ColorMultiplierRange.Z.Min = Lerp(Alpha, 0.4000000, 0.0000000);
	Emitters[0].ColorMultiplierRange.Z.Max = Emitters[0].ColorMultiplierRange.Z.Min;
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'BWBP_SKC_Pro.HVPCMk66GreenGlow.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		TriggerDisabled=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.6071430,Color=(R=0,G=255,B=0,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=255,B=0,A=255))
		ColorMultiplierRange=(X=(Min=0.2300000,Max=0.3300000),Y=(Min=0.9300000,Max=0.9300000),Z=(Min=0.4300000,Max=0.6300000))
		FadeOutStartTime=0.7000000
		FadeInEndTime=0.2000000
		CoordinateSystem=1
		MaxParticles=7
		DetailMode=1
		StartLocationOffset=(X=-20.0000000,Y=0.0000000,Z=0.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=0.6200000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=30.0000000,Max=30.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=30.0000000,Max=30.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=60.0000000,Max=60.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	end object
	Emitters[0]=SpriteEmitter0
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_SKC_Pro.HVPCMk66GreenGlow.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	TriggerDisabled=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.6071430,Color=(R=0,G=255,B=0,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=255,B=0,A=255))
	ColorMultiplierRange=(X=(Min=0.2300000,Max=0.3300000),Y=(Min=0.9300000,Max=0.9300000),Z=(Min=0.4300000,Max=0.6300000))
	FadeOutStartTime=0.7000000
	FadeInEndTime=0.2000000
	CoordinateSystem=1
	MaxParticles=7
	DetailMode=1
	StartLocationOffset=(X=-20.0000000,Y=0.0000000,Z=0.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=0.6200000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=30.0000000,Max=30.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=30.0000000,Max=30.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=60.0000000,Max=60.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
end object
