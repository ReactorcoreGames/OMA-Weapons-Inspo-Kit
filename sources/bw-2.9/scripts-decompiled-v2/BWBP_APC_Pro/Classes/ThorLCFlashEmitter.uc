class ThorLCFlashEmitter extends BallisticEmitter;

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x29
	if(Weapon(Owner) == none)
	{
		Emitters[0].ZTest = true;
	}
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'BWBP_APC_Pro.ThorLCFlashEmitter.SpriteEmitter5'
	begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		UniformSize=true
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.3500000,Max=0.3500000),Z=(Min=0.0000000,Max=0.0000000))
		Opacity=0.8000000
		FadeOutStartTime=0.1000000
		CoordinateSystem=1
		MaxParticles=1
		StartSizeRange=(X=(Min=75.0000000,Max=75.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.3000000,Max=0.3000000)
		SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
		SpawnOnTriggerPPS=500000.0000000
	end object
	Emitters[0]=SpriteEmitter5
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_APC_Pro.ThorLCFlashEmitter.SpriteEmitter5'
begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	UniformSize=true
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.3500000,Max=0.3500000),Z=(Min=0.0000000,Max=0.0000000))
	Opacity=0.8000000
	FadeOutStartTime=0.1000000
	CoordinateSystem=1
	MaxParticles=1
	StartSizeRange=(X=(Min=75.0000000,Max=75.0000000),Y=(Min=50.0000000,Max=50.0000000),Z=(Min=50.0000000,Max=50.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.3000000,Max=0.3000000)
	SpawnOnTriggerRange=(Min=1.0000000,Max=1.0000000)
	SpawnOnTriggerPPS=500000.0000000
end object
