class ShockBall extends Emitter;

simulated function PostBeginPlay()
{
	local PlayerController PC;

	super(Actor).PostBeginPlay();
	PC = Level.GetLocalPlayerController();
	// End:0x71
	if((PC.ViewTarget == none) || VSize(PC.ViewTarget.Location - Location) > float(4000))
	{
		Emitters[2].Disabled = true;
	}
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'XEffects.ShockBall.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		ResetAfterChange=true
		AutoReset=true
		SpinParticles=true
		UniformSize=true
		FadeOutStartTime=0.3200000
		FadeInEndTime=0.0500000
		CoordinateSystem=1
		MaxParticles=1
		StartSpinRange=(X=(Min=0.1320000,Max=0.9000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=45.0000000,Max=45.0000000),Y=(Min=65.0000000,Max=65.0000000),Z=(Min=65.0000000,Max=65.0000000))
		Texture=Texture'XEffectMat.Shock.shock_core_low'
		LifetimeRange=(Min=0.3500000,Max=0.3500000)
		WarmupTicksPerSecond=20.0000000
		RelativeWarmupTime=1.0000000
	end object
	Emitters[0]=SpriteEmitter0
	// Reference: SpriteEmitter'XEffects.ShockBall.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		ResetAfterChange=true
		AutoReset=true
		SpinParticles=true
		UniformSize=true
		FadeOutStartTime=0.2000000
		FadeInEndTime=0.2500000
		CoordinateSystem=1
		MaxParticles=2
		SpinsPerSecondRange=(X=(Min=0.1000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.1540000,Max=0.9130000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=60.0000000,Max=60.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		InitialParticlesPerSecond=2.0000000
		Texture=Texture'XEffectMat.Shock.shock_flare_a'
		LifetimeRange=(Min=0.4000000,Max=0.4000000)
		WarmupTicksPerSecond=20.0000000
		RelativeWarmupTime=1.0000000
	end object
	Emitters[1]=SpriteEmitter1
	// Reference: SpriteEmitter'XEffects.ShockBall.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		ResetAfterChange=true
		AutoReset=true
		UniformSize=true
		FadeOutStartTime=0.3000000
		FadeInEndTime=0.1000000
		CoordinateSystem=1
		MaxParticles=15
		DetailMode=1
		StartSizeRange=(X=(Min=4.5000000,Max=4.5000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		Texture=Texture'XEffectMat.Shock.shock_core'
		LifetimeRange=(Min=0.3500000,Max=0.3500000)
		StartVelocityRange=(X=(Min=-70.0000000,Max=70.0000000),Y=(Min=-70.0000000,Max=70.0000000),Z=(Min=-70.0000000,Max=70.0000000))
		VelocityScale[0]=(RelativeTime=1.0000000,RelativeVelocity=(X=-1.0000000,Y=-1.0000000,Z=-1.0000000))
		WarmupTicksPerSecond=50.0000000
		RelativeWarmupTime=1.0000000
	end object
	Emitters[2]=SpriteEmitter2
	bNoDelete=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'XEffects.ShockBall.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	ResetAfterChange=true
	AutoReset=true
	SpinParticles=true
	UniformSize=true
	FadeOutStartTime=0.3200000
	FadeInEndTime=0.0500000
	CoordinateSystem=1
	MaxParticles=1
	StartSpinRange=(X=(Min=0.1320000,Max=0.9000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=45.0000000,Max=45.0000000),Y=(Min=65.0000000,Max=65.0000000),Z=(Min=65.0000000,Max=65.0000000))
	Texture=Texture'XEffectMat.Shock.shock_core_low'
	LifetimeRange=(Min=0.3500000,Max=0.3500000)
	WarmupTicksPerSecond=20.0000000
	RelativeWarmupTime=1.0000000
end object
// Reference: SpriteEmitter'XEffects.ShockBall.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	ResetAfterChange=true
	AutoReset=true
	SpinParticles=true
	UniformSize=true
	FadeOutStartTime=0.2000000
	FadeInEndTime=0.2500000
	CoordinateSystem=1
	MaxParticles=2
	SpinsPerSecondRange=(X=(Min=0.1000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.1540000,Max=0.9130000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=60.0000000,Max=60.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	InitialParticlesPerSecond=2.0000000
	Texture=Texture'XEffectMat.Shock.shock_flare_a'
	LifetimeRange=(Min=0.4000000,Max=0.4000000)
	WarmupTicksPerSecond=20.0000000
	RelativeWarmupTime=1.0000000
end object
// Reference: SpriteEmitter'XEffects.ShockBall.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	ResetAfterChange=true
	AutoReset=true
	UniformSize=true
	FadeOutStartTime=0.3000000
	FadeInEndTime=0.1000000
	CoordinateSystem=1
	MaxParticles=15
	DetailMode=1
	StartSizeRange=(X=(Min=4.5000000,Max=4.5000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	Texture=Texture'XEffectMat.Shock.shock_core'
	LifetimeRange=(Min=0.3500000,Max=0.3500000)
	StartVelocityRange=(X=(Min=-70.0000000,Max=70.0000000),Y=(Min=-70.0000000,Max=70.0000000),Z=(Min=-70.0000000,Max=70.0000000))
	VelocityScale[0]=(RelativeTime=1.0000000,RelativeVelocity=(X=-1.0000000,Y=-1.0000000,Z=-1.0000000))
	WarmupTicksPerSecond=50.0000000
	RelativeWarmupTime=1.0000000
end object
