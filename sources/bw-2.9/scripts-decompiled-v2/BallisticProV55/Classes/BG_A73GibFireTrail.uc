class BG_A73GibFireTrail extends BallisticEmitter;

simulated event Tick(float dt)
{
	super(Actor).Tick(dt);
	// End:0x1B
	if(Owner == none)
	{
		Destroy();
		return;
	}
	Emitters[0].StartVelocityRange = default.Emitters[0].StartVelocityRange;
	Emitters[0].StartVelocityRange.X.Max += Owner.Velocity.X;
	Emitters[0].StartVelocityRange.X.Min += Owner.Velocity.X;
	Emitters[0].StartVelocityRange.Y.Max += Owner.Velocity.Y;
	Emitters[0].StartVelocityRange.Y.Min += Owner.Velocity.Y;
	Emitters[0].StartVelocityRange.Z.Max += Owner.Velocity.Z;
	Emitters[0].StartVelocityRange.Z.Min += Owner.Velocity.Z;
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'BallisticProV55.BG_A73GibFireTrail.SpriteEmitter29'
	begin object name="SpriteEmitter29" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UniformSize=true
		BlendBetweenSubdivisions=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=12.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.2000000,Color=(R=128,G=128,B=255,A=255))
		ColorScale[2]=(RelativeTime=0.3857140,Color=(R=64,G=64,B=255,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=255))
		FadeOutStartTime=0.4880000
		FadeInEndTime=0.1120000
		MaxParticles=2
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=4.0000000)
		StartLocationRange=(X=(Min=-2.0000000,Max=2.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=-2.0000000,Max=2.0000000))
		StartSpinRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=6.0000000,Max=8.0000000),Y=(Min=6.0000000,Max=8.0000000),Z=(Min=6.0000000,Max=8.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.BlazingSubdivide'
		TextureUSubdivisions=4
		TextureVSubdivisions=2
		LifetimeRange=(Min=0.8000000,Max=0.8000000)
	end object
	Emitters[0]=SpriteEmitter29
	// Reference: SpriteEmitter'BallisticProV55.BG_A73GibFireTrail.SpriteEmitter33'
	begin object name="SpriteEmitter33" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		Disabled=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=20.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.1428570,Color=(R=128,G=128,B=255,A=255))
		ColorScale[2]=(RelativeTime=0.2857140,Color=(R=64,G=64,B=255,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=255))
		FadeOutStartTime=0.1530000
		FadeInEndTime=0.0270000
		MaxParticles=60
		StartLocationRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=-1.0000000,Max=1.0000000),Z=(Min=-1.0000000,Max=1.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
		StartSizeRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=2.0000000,Max=2.0000000),Z=(Min=2.0000000,Max=2.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlameParts'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		LifetimeRange=(Min=0.2000000,Max=0.3000000)
		StartVelocityRange=(X=(Min=-2.0000000,Max=2.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=20.0000000,Max=20.0000000))
	end object
	Emitters[1]=SpriteEmitter33
	AutoDestroy=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.BG_A73GibFireTrail.SpriteEmitter29'
begin object name="SpriteEmitter29" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UniformSize=true
	BlendBetweenSubdivisions=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=12.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.2000000,Color=(R=128,G=128,B=255,A=255))
	ColorScale[2]=(RelativeTime=0.3857140,Color=(R=64,G=64,B=255,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=255))
	FadeOutStartTime=0.4880000
	FadeInEndTime=0.1120000
	MaxParticles=2
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=4.0000000)
	StartLocationRange=(X=(Min=-2.0000000,Max=2.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=-2.0000000,Max=2.0000000))
	StartSpinRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=6.0000000,Max=8.0000000),Y=(Min=6.0000000,Max=8.0000000),Z=(Min=6.0000000,Max=8.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.BlazingSubdivide'
	TextureUSubdivisions=4
	TextureVSubdivisions=2
	LifetimeRange=(Min=0.8000000,Max=0.8000000)
end object
// Reference: SpriteEmitter'BallisticProV55.BG_A73GibFireTrail.SpriteEmitter33'
begin object name="SpriteEmitter33" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	Disabled=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=20.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=192,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.1428570,Color=(R=128,G=128,B=255,A=255))
	ColorScale[2]=(RelativeTime=0.2857140,Color=(R=64,G=64,B=255,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=255,A=255))
	FadeOutStartTime=0.1530000
	FadeInEndTime=0.0270000
	MaxParticles=60
	StartLocationRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=-1.0000000,Max=1.0000000),Z=(Min=-1.0000000,Max=1.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=0.5000000)
	StartSizeRange=(X=(Min=2.0000000,Max=2.0000000),Y=(Min=2.0000000,Max=2.0000000),Z=(Min=2.0000000,Max=2.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlameParts'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	LifetimeRange=(Min=0.2000000,Max=0.3000000)
	StartVelocityRange=(X=(Min=-2.0000000,Max=2.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=20.0000000,Max=20.0000000))
end object
