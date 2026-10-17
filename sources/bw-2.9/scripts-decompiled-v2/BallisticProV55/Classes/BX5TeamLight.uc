class BX5TeamLight extends BallisticEmitter;

simulated event BaseChange()
{
	// End:0x0E
	if(Base == none)
	{
		Destroy();
	}
	//return;	
}

simulated function SetTeamColor(int Team)
{
	switch(Team)
	{
		// End:0x8E
		case 0:
			Emitters[0].ColorMultiplierRange.Z.Min = 0.0000000;
			Emitters[0].ColorMultiplierRange.Z.Max = 0.0000000;
			Emitters[0].ColorMultiplierRange.Y.Min = 0.0000000;
			Emitters[0].ColorMultiplierRange.Y.Max = 0.0000000;
			// End:0x230
			break;
		// End:0x115
		case 1:
			Emitters[0].ColorMultiplierRange.X.Min = 0.0000000;
			Emitters[0].ColorMultiplierRange.X.Max = 0.0000000;
			Emitters[0].ColorMultiplierRange.Y.Min = 0.0000000;
			Emitters[0].ColorMultiplierRange.Y.Max = 0.0000000;
			// End:0x230
			break;
		// End:0x19D
		case 2:
			Emitters[0].ColorMultiplierRange.X.Min = 0.0000000;
			Emitters[0].ColorMultiplierRange.X.Max = 0.0000000;
			Emitters[0].ColorMultiplierRange.Z.Min = 0.0000000;
			Emitters[0].ColorMultiplierRange.Z.Max = 0.0000000;
			// End:0x230
			break;
		// End:0x1E5
		case 3:
			Emitters[0].ColorMultiplierRange.Z.Min = 0.0000000;
			Emitters[0].ColorMultiplierRange.Z.Max = 0.0000000;
			// End:0x230
			break;
		// End:0x22D
		case 255:
			Emitters[0].ColorMultiplierRange.Z.Min = 0.0000000;
			Emitters[0].ColorMultiplierRange.Z.Max = 0.0000000;
			// End:0x230
			break;
		// End:0xFFFF
		default:
			break;
	}
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'BallisticProV55.BX5TeamLight.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.4000000
		FadeOutStartTime=1.3000000
		FadeInEndTime=1.3000000
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=9.0000000,Y=0.0000000,Z=0.0000000)
		StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
		InitialParticlesPerSecond=100.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=3.0000000,Max=3.0000000)
	end object
	Emitters[0]=SpriteEmitter0
	CullDistance=3072.0000000
	bHardAttach=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.BX5TeamLight.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.4000000
	FadeOutStartTime=1.3000000
	FadeInEndTime=1.3000000
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=9.0000000,Y=0.0000000,Z=0.0000000)
	StartSizeRange=(X=(Min=10.0000000,Max=10.0000000),Y=(Min=10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
	InitialParticlesPerSecond=100.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=3.0000000,Max=3.0000000)
end object
