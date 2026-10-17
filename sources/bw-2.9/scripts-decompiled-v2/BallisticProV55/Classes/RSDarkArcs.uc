class RSDarkArcs extends BallisticEmitter;

simulated function SetGap(float Alpha)
{
	Emitters[0].StartLocationOffset.Z = (default.Emitters[0].StartLocationOffset.Z * Alpha) * Owner.DrawScale;
	Emitters[0].StartVelocityRange.Z.Max = (default.Emitters[0].StartVelocityRange.Z.Max * Alpha) * Owner.DrawScale;
	Emitters[0].StartVelocityRange.Z.Min = Emitters[0].StartVelocityRange.Z.Max;
	Emitters[1].StartLocationOffset.Z = (default.Emitters[1].StartLocationOffset.Z * Alpha) * Owner.DrawScale;
	Emitters[2].StartLocationOffset.Z = (default.Emitters[2].StartLocationOffset.Z * Alpha) * Owner.DrawScale;
	//return;	
}

defaultproperties
{
	// Reference: BeamEmitter'BallisticProV55.RSDarkArcs.BeamEmitter0'
	begin object name="BeamEmitter0" class=Engine.BeamEmitter
		LowFrequencyNoiseRange=(X=(Min=-1.5000000,Max=1.5000000),Y=(Min=-1.5000000,Max=1.5000000),Z=(Min=0.0000000,Max=0.0000000))
		HighFrequencyNoiseRange=(X=(Min=-0.5000000,Max=0.5000000),Y=(Min=-0.5000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
		HighFrequencyPoints=5
		UseColorScale=true
		FadeOut=true
		UseSizeScale=true
		UseRegularSizeScale=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=128,B=64,A=255))
		ColorScale[1]=(RelativeTime=0.2500000,Color=(R=255,G=64,B=0,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
		FadeOutStartTime=0.0330000
		CoordinateSystem=1
		MaxParticles=6
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=-3.0000000)
		StartLocationRange=(X=(Min=0.0000000,Max=40.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
		SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=0.8000000,Max=1.2000000),Y=(Min=0.8000000,Max=1.2000000),Z=(Min=0.8000000,Max=1.2000000))
		Texture=Texture'EpicParticles.Beams.HotBolt03aw'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2000000,Max=0.3000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=18.0000000,Max=18.0000000))
	end object
	Emitters[0]=BeamEmitter0
	// Reference: SpriteEmitter'BallisticProV55.RSDarkArcs.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseDirectionAs=4
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=18.0000000,Y=0.0000000,Z=-2.2000000)
		StartSizeRange=(X=(Min=30.0000000,Max=30.0000000),Y=(Min=1.7000000,Max=1.7000000),Z=(Min=1.7000000,Max=1.7000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[1]=SpriteEmitter0
	// Reference: SpriteEmitter'BallisticProV55.RSDarkArcs.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		UseDirectionAs=4
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=18.0000000,Y=0.0000000,Z=2.2000000)
		StartSizeRange=(X=(Min=30.0000000,Max=30.0000000),Y=(Min=1.7000000,Max=1.7000000),Z=(Min=1.7000000,Max=1.7000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[2]=SpriteEmitter1
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: BeamEmitter'BallisticProV55.RSDarkArcs.BeamEmitter0'
begin object name="BeamEmitter0" class=Engine.BeamEmitter
	LowFrequencyNoiseRange=(X=(Min=-1.5000000,Max=1.5000000),Y=(Min=-1.5000000,Max=1.5000000),Z=(Min=0.0000000,Max=0.0000000))
	HighFrequencyNoiseRange=(X=(Min=-0.5000000,Max=0.5000000),Y=(Min=-0.5000000,Max=0.5000000),Z=(Min=0.0000000,Max=0.0000000))
	HighFrequencyPoints=5
	UseColorScale=true
	FadeOut=true
	UseSizeScale=true
	UseRegularSizeScale=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=128,B=64,A=255))
	ColorScale[1]=(RelativeTime=0.2500000,Color=(R=255,G=64,B=0,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=0,A=255))
	FadeOutStartTime=0.0330000
	CoordinateSystem=1
	MaxParticles=6
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=-3.0000000)
	StartLocationRange=(X=(Min=0.0000000,Max=40.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=2.0000000)
	SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=0.8000000,Max=1.2000000),Y=(Min=0.8000000,Max=1.2000000),Z=(Min=0.8000000,Max=1.2000000))
	Texture=Texture'EpicParticles.Beams.HotBolt03aw'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2000000,Max=0.3000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=18.0000000,Max=18.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RSDarkArcs.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseDirectionAs=4
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=18.0000000,Y=0.0000000,Z=-2.2000000)
	StartSizeRange=(X=(Min=30.0000000,Max=30.0000000),Y=(Min=1.7000000,Max=1.7000000),Z=(Min=1.7000000,Max=1.7000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
// Reference: SpriteEmitter'BallisticProV55.RSDarkArcs.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	UseDirectionAs=4
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=18.0000000,Y=0.0000000,Z=2.2000000)
	StartSizeRange=(X=(Min=30.0000000,Max=30.0000000),Y=(Min=1.7000000,Max=1.7000000),Z=(Min=1.7000000,Max=1.7000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
