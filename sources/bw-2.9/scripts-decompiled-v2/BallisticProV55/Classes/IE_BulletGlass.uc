class IE_BulletGlass extends DGVEmitter;

defaultproperties
{
	// Reference: SpriteEmitter'BallisticProV55.IE_BulletGlass.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		Disabled=true
		Backup_Disabled=true
		UniformSize=true
		SecondsBeforeInactive=0.0000000
	end object
	Emitters[0]=SpriteEmitter0
	// Reference: SpriteEmitter'BallisticProV55.IE_BulletGlass.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		Disabled=true
		Backup_Disabled=true
		UniformSize=true
		SecondsBeforeInactive=0.0000000
	end object
	Emitters[1]=SpriteEmitter1
	// Reference: SpriteEmitter'BallisticProV55.IE_BulletGlass.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		Disabled=true
		Backup_Disabled=true
		UniformSize=true
		SecondsBeforeInactive=0.0000000
	end object
	Emitters[2]=SpriteEmitter2
	// Reference: MeshEmitter'BallisticProV55.IE_BulletGlass.MeshEmitter0'
	begin object name="MeshEmitter0" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.Impact.Shard1'
		UseMeshBlendMode=false
		UseParticleColor=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-100.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=0.5000000
		MaxParticles=25
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=3.0000000),Y=(Min=0.0000000,Max=4.0000000),Z=(Min=0.0000000,Max=4.0000000))
		StartSizeRange=(X=(Min=0.1250000,Max=0.3750000),Y=(Min=0.1250000,Max=0.3750000),Z=(Min=0.1250000,Max=0.3750000))
		InitialParticlesPerSecond=10000.0000000
		DrawStyle=6
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=50.0000000,Max=100.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-25.0000000,Max=50.0000000))
	end object
	Emitters[3]=MeshEmitter0
	// Reference: SparkEmitter'BallisticProV55.IE_BulletGlass.SparkEmitter0'
	begin object name="SparkEmitter0" class=Engine.SparkEmitter
		Disabled=true
		Backup_Disabled=true
		SecondsBeforeInactive=0.0000000
	end object
	Emitters[4]=SparkEmitter0
	AutoDestroy=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SparkEmitter'BallisticProV55.IE_BulletGlass.SparkEmitter0'
begin object name="SparkEmitter0" class=Engine.SparkEmitter
	Disabled=true
	Backup_Disabled=true
	SecondsBeforeInactive=0.0000000
end object
// Reference: MeshEmitter'BallisticProV55.IE_BulletGlass.MeshEmitter0'
begin object name="MeshEmitter0" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Impact.Shard1'
	UseMeshBlendMode=false
	UseParticleColor=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-100.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=0.5000000
	MaxParticles=25
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=3.0000000),Y=(Min=0.0000000,Max=4.0000000),Z=(Min=0.0000000,Max=4.0000000))
	StartSizeRange=(X=(Min=0.1250000,Max=0.3750000),Y=(Min=0.1250000,Max=0.3750000),Z=(Min=0.1250000,Max=0.3750000))
	InitialParticlesPerSecond=10000.0000000
	DrawStyle=6
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=50.0000000,Max=100.0000000),Y=(Min=-50.0000000,Max=50.0000000),Z=(Min=-25.0000000,Max=50.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.IE_BulletGlass.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	Disabled=true
	Backup_Disabled=true
	UniformSize=true
	SecondsBeforeInactive=0.0000000
end object
// Reference: SpriteEmitter'BallisticProV55.IE_BulletGlass.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	Disabled=true
	Backup_Disabled=true
	UniformSize=true
	SecondsBeforeInactive=0.0000000
end object
// Reference: SpriteEmitter'BallisticProV55.IE_BulletGlass.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	Disabled=true
	Backup_Disabled=true
	UniformSize=true
	SecondsBeforeInactive=0.0000000
end object
