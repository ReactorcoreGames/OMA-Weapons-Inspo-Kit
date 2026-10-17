class BG_GibBloodTrailBot extends BallisticEmitter;

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
	Emitters[0].StartVelocityRange.X.Max += (Owner.Velocity.X * 0.2500000);
	Emitters[0].StartVelocityRange.X.Min += (Owner.Velocity.X * 0.2500000);
	Emitters[0].StartVelocityRange.Y.Max += (Owner.Velocity.Y * 0.2500000);
	Emitters[0].StartVelocityRange.Y.Min += (Owner.Velocity.Y * 0.2500000);
	Emitters[0].StartVelocityRange.Z.Max += (Owner.Velocity.Z * 0.2500000);
	Emitters[0].StartVelocityRange.Z.Min += (Owner.Velocity.Z * 0.2500000);
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'BallisticProV55.BG_GibBloodTrailBot.SpriteEmitter27'
	begin object name="SpriteEmitter27" class=Engine.SpriteEmitter
		FadeOut=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-100.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.3000000,Max=0.6500000),Z=(Min=0.4000000,Max=0.7000000))
		FadeOutStartTime=0.5040000
		MaxParticles=40
		StartSpinRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=1.0000000,Max=2.0000000),Y=(Min=1.0000000,Max=2.0000000),Z=(Min=1.0000000,Max=2.0000000))
		DrawStyle=1
		Texture=Texture'BallisticBloodPro.Particles.BloodDrip1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.7000000,Max=0.8000000)
		StartVelocityRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=0.0000000,Max=10.0000000))
	end object
	Emitters[0]=SpriteEmitter27
	AutoDestroy=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.BG_GibBloodTrailBot.SpriteEmitter27'
begin object name="SpriteEmitter27" class=Engine.SpriteEmitter
	FadeOut=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-100.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.3000000,Max=0.6500000),Z=(Min=0.4000000,Max=0.7000000))
	FadeOutStartTime=0.5040000
	MaxParticles=40
	StartSpinRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=1.0000000,Max=2.0000000),Y=(Min=1.0000000,Max=2.0000000),Z=(Min=1.0000000,Max=2.0000000))
	DrawStyle=1
	Texture=Texture'BallisticBloodPro.Particles.BloodDrip1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.7000000,Max=0.8000000)
	StartVelocityRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=0.0000000,Max=10.0000000))
end object
