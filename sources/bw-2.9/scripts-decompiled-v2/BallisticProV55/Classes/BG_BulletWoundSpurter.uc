class BG_BulletWoundSpurter extends DGVEmitter;

var bool bKillingTime;

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	SetTimer(0.1000000, true);
	//return;	
}

simulated event Timer()
{
	// End:0x0E
	if(bKillingTime)
	{
		Destroy();
		return;
	}
	super.Timer();
	Emitters[0].InitialParticlesPerSecond -= float(Rand(2));
	// End:0x89
	if(((Emitters[0].InitialParticlesPerSecond < float(12)) || Pawn(Owner) == none) || Pawn(Owner).Health < 1)
	{
		SetTimer(6.0000000, false);
		bKillingTime = true;
		Kill();
	}
	//return;	
}

defaultproperties
{
	bAutoAlignVelocity=true
	DisableDGV[0]=0
	DisableDGV[1]=1
	DisableDGV[2]=1
	// Reference: SpriteEmitter'BallisticProV55.BG_BulletWoundSpurter.SpriteEmitter8'
	begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseCollision=true
		UseMaxCollisions=true
		UseSpawnedVelocityScale=true
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-140.0000000)
		ExtentMultiplier=(X=0.5000000,Y=0.5000000,Z=0.5000000)
		MaxCollisions=(Min=1.0000000,Max=1.0000000)
		SpawnFromOtherEmitter=1
		SpawnAmount=1
		SpawnedVelocityScaleRange=(X=(Min=-0.1000000,Max=-0.1000000),Y=(Min=-0.1000000,Max=-0.1000000),Z=(Min=-0.1000000,Max=-0.1000000))
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.4000000,Max=0.7000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		FadeOutStartTime=0.2500000
		MaxParticles=24
		StartSpinRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
		SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=2.0000000,Max=3.0000000),Y=(Min=2.0000000,Max=3.0000000),Z=(Min=2.0000000,Max=3.0000000))
		InitialParticlesPerSecond=24.0000000
		DrawStyle=1
		Texture=Texture'BallisticBloodPro.Particles.BloodDrip1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=3.0000000,Max=3.0000000)
		StartVelocityRange=(X=(Min=12.0000000,Max=16.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=10.0000000,Max=20.0000000))
	end object
	Emitters[0]=SpriteEmitter8
	// Reference: SpriteEmitter'BallisticProV55.BG_BulletWoundSpurter.SpriteEmitter9'
	begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
		UseDirectionAs=3
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=9.0000000
		MaxParticles=30
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
		SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=0.9000000,RelativeSize=1.0000000)
		SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
		StartSizeRange=(X=(Min=4.0000000,Max=5.0000000),Y=(Min=4.0000000,Max=5.0000000),Z=(Min=4.0000000,Max=5.0000000))
		DrawStyle=2
		Texture=Texture'BallisticBloodPro.Decals.Splat2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=10.0000000,Max=10.0000000)
	end object
	Emitters[1]=SpriteEmitter9
	// Reference: SpriteEmitter'BallisticProV55.BG_BulletWoundSpurter.SpriteEmitter10'
	begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
		FadeOut=true
		RespawnDeadParticles=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=3.1200000
		CoordinateSystem=1
		MaxParticles=1
		StartSizeRange=(X=(Min=7.0000000,Max=7.0000000),Y=(Min=7.0000000,Max=7.0000000),Z=(Min=7.0000000,Max=7.0000000))
		DrawStyle=2
		Texture=Texture'BallisticBloodPro.Decals.Splat4'
		SecondsBeforeInactive=0.0000000
	end object
	Emitters[2]=SpriteEmitter10
	AutoDestroy=true
	bHardAttach=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.BG_BulletWoundSpurter.SpriteEmitter8'
begin object name="SpriteEmitter8" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseCollision=true
	UseMaxCollisions=true
	UseSpawnedVelocityScale=true
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-140.0000000)
	ExtentMultiplier=(X=0.5000000,Y=0.5000000,Z=0.5000000)
	MaxCollisions=(Min=1.0000000,Max=1.0000000)
	SpawnFromOtherEmitter=1
	SpawnAmount=1
	SpawnedVelocityScaleRange=(X=(Min=-0.1000000,Max=-0.1000000),Y=(Min=-0.1000000,Max=-0.1000000),Z=(Min=-0.1000000,Max=-0.1000000))
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.4000000,Max=0.7000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	FadeOutStartTime=0.2500000
	MaxParticles=24
	StartSpinRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.0000000)
	SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=2.0000000,Max=3.0000000),Y=(Min=2.0000000,Max=3.0000000),Z=(Min=2.0000000,Max=3.0000000))
	InitialParticlesPerSecond=24.0000000
	DrawStyle=1
	Texture=Texture'BallisticBloodPro.Particles.BloodDrip1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=3.0000000,Max=3.0000000)
	StartVelocityRange=(X=(Min=12.0000000,Max=16.0000000),Y=(Min=-2.0000000,Max=2.0000000),Z=(Min=10.0000000,Max=20.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.BG_BulletWoundSpurter.SpriteEmitter9'
begin object name="SpriteEmitter9" class=Engine.SpriteEmitter
	UseDirectionAs=3
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=9.0000000
	MaxParticles=30
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1000000)
	SizeScale[1]=(RelativeTime=0.1700000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=0.9000000,RelativeSize=1.0000000)
	SizeScale[3]=(RelativeTime=1.0000000,RelativeSize=0.0000000)
	StartSizeRange=(X=(Min=4.0000000,Max=5.0000000),Y=(Min=4.0000000,Max=5.0000000),Z=(Min=4.0000000,Max=5.0000000))
	DrawStyle=2
	Texture=Texture'BallisticBloodPro.Decals.Splat2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=10.0000000,Max=10.0000000)
end object
// Reference: SpriteEmitter'BallisticProV55.BG_BulletWoundSpurter.SpriteEmitter10'
begin object name="SpriteEmitter10" class=Engine.SpriteEmitter
	FadeOut=true
	RespawnDeadParticles=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=3.1200000
	CoordinateSystem=1
	MaxParticles=1
	StartSizeRange=(X=(Min=7.0000000,Max=7.0000000),Y=(Min=7.0000000,Max=7.0000000),Z=(Min=7.0000000,Max=7.0000000))
	DrawStyle=2
	Texture=Texture'BallisticBloodPro.Decals.Splat4'
	SecondsBeforeInactive=0.0000000
end object
