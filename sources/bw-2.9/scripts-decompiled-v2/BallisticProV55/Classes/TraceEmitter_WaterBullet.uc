class TraceEmitter_WaterBullet extends BCTraceEmitter;

simulated function Initialize(float Distance, optional float Power)
{
	// End:0x94
	if(Emitters[0] != none)
	{
		Emitters[0].StartLocationRange.X.Max = FMin(2000.0000000, Distance);
		Emitters[0].SpawnOnTriggerRange.Min = FMin(120.0000000, Distance * 0.0600000);
		Emitters[0].SpawnOnTriggerRange.Max = Emitters[0].SpawnOnTriggerRange.Min;
		Trigger(Owner, none);
	}
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'BallisticProV55.TraceEmitter_WaterBullet.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		UniformSize=true
		AutomaticInitialSpawning=false
		TriggerDisabled=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=5.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=2.0750000
		FadeInEndTime=0.1750000
		CoordinateSystem=1
		MaxParticles=120
		StartLocationRange=(X=(Min=0.0000000,Max=1000.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=1.0000000,Max=2.0000000),Y=(Min=1.0000000,Max=2.0000000),Z=(Min=1.0000000,Max=2.0000000))
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.AquaBubble1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.5000000,Max=2.5000000)
		SpawnOnTriggerRange=(Min=100.0000000,Max=100.0000000)
		SpawnOnTriggerPPS=99999.0000000
		StartVelocityRange=(X=(Min=0.0000000,Max=100.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
	end object
	Emitters[0]=SpriteEmitter0
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.TraceEmitter_WaterBullet.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	UniformSize=true
	AutomaticInitialSpawning=false
	TriggerDisabled=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=5.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=2.0750000
	FadeInEndTime=0.1750000
	CoordinateSystem=1
	MaxParticles=120
	StartLocationRange=(X=(Min=0.0000000,Max=1000.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=1.0000000,Max=2.0000000),Y=(Min=1.0000000,Max=2.0000000),Z=(Min=1.0000000,Max=2.0000000))
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.AquaBubble1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.5000000,Max=2.5000000)
	SpawnOnTriggerRange=(Min=100.0000000,Max=100.0000000)
	SpawnOnTriggerPPS=99999.0000000
	StartVelocityRange=(X=(Min=0.0000000,Max=100.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
end object
