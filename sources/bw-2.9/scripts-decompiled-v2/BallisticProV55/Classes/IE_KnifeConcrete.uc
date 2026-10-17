class IE_KnifeConcrete extends DGVEmitter;

simulated event PreBeginPlay()
{
	// End:0x2C
	if(int(Level.DetailMode) < int(2))
	{
		Emitters[0].Disabled = true;
	}
	super(Actor).PreBeginPlay();
	//return;	
}

simulated event PostBeginPlay()
{
	local Rotator R;
	local int SliceAnim;

	R = Rotation;
	R.Roll = -R.Yaw + Rotator(Owner.Location - Location).Yaw;
	// End:0x15D
	if(((((Owner != none) && Pawn(Owner) != none) && Pawn(Owner).Weapon != none) && Pawn(Owner).Weapon.GetFireMode(0) != none) && X3PrimaryFire(Pawn(Owner).Weapon.GetFireMode(0)) != none)
	{
		SliceAnim = X3PrimaryFire(Pawn(Owner).Weapon.GetFireMode(0)).SliceAnim;
		// End:0x11D
		if(SliceAnim == 0)
		{
			R.Roll -= 24768;			
		}
		else
		{
			// End:0x13D
			if(SliceAnim == 2)
			{
				R.Roll += 32768;				
			}
			else
			{
				// End:0x15A
				if(SliceAnim == 3)
				{
					R.Roll -= 8192;
				}
			}
		}		
	}
	else
	{
		R.Roll = Rand(65536);
	}
	SetRotation(R);
	super.PostBeginPlay();
	//return;	
}

defaultproperties
{
	bVerticalZ=false
	// Reference: MeshEmitter'BallisticProV55.IE_KnifeConcrete.MeshEmitter8'
	begin object name="MeshEmitter8" class=Engine.MeshEmitter
		StaticMesh=StaticMesh'BW_Core_WeaponStatic.Impact.ConcreteChip2'
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
		FadeOutFactor=(W=1.0000000,X=0.5000000,Y=0.5000000,Z=0.5000000)
		FadeOutStartTime=0.8000000
		FadeInEndTime=0.1000000
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=30.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinCCWorCW=(X=0.5000000,Y=0.5000000,Z=1.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=3.0000000),Y=(Min=0.0000000,Max=3.0000000),Z=(Min=0.0000000,Max=3.0000000))
		StartSpinRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=0.1000000,Max=0.5000000),Y=(Min=0.1000000,Max=0.5000000),Z=(Min=0.1000000,Max=0.5000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=0
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=50.0000000,Max=100.0000000),Y=(Min=50.0000000,Max=200.0000000),Z=(Min=20.0000000,Max=100.0000000))
	end object
	Emitters[0]=MeshEmitter8
	// Reference: SparkEmitter'BallisticProV55.IE_KnifeConcrete.SparkEmitter7'
	begin object name="SparkEmitter7" class=Engine.SparkEmitter
		LineSegmentsRange=(Min=1.0000000,Max=1.0000000)
		TimeBeforeVisibleRange=(Min=5.0000000,Max=5.0000000)
		TimeBetweenSegmentsRange=(Min=0.1000000,Max=0.1000000)
		UseColorScale=true
		FadeOut=true
		RespawnDeadParticles=false
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-100.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=0,A=0))
		FadeOutFactor=(W=1.0000000,X=0.5000000,Y=0.5000000,Z=0.5000000)
		FadeOutStartTime=0.3000000
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=100.0000000),Z=(Min=0.0000000,Max=0.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=6
		Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=50.0000000,Max=200.0000000),Y=(Min=0.0000000,Max=500.0000000),Z=(Min=0.0000000,Max=50.0000000))
	end object
	Emitters[1]=SparkEmitter7
	AutoDestroy=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: MeshEmitter'BallisticProV55.IE_KnifeConcrete.MeshEmitter8'
begin object name="MeshEmitter8" class=Engine.MeshEmitter
	StaticMesh=StaticMesh'BW_Core_WeaponStatic.Impact.ConcreteChip2'
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-200.0000000)
	FadeOutFactor=(W=1.0000000,X=0.5000000,Y=0.5000000,Z=0.5000000)
	FadeOutStartTime=0.8000000
	FadeInEndTime=0.1000000
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=30.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinCCWorCW=(X=0.5000000,Y=0.5000000,Z=1.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=3.0000000),Y=(Min=0.0000000,Max=3.0000000),Z=(Min=0.0000000,Max=3.0000000))
	StartSpinRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=0.1000000,Max=0.5000000),Y=(Min=0.1000000,Max=0.5000000),Z=(Min=0.1000000,Max=0.5000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=0
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=50.0000000,Max=100.0000000),Y=(Min=50.0000000,Max=200.0000000),Z=(Min=20.0000000,Max=100.0000000))
end object
// Reference: SparkEmitter'BallisticProV55.IE_KnifeConcrete.SparkEmitter7'
begin object name="SparkEmitter7" class=Engine.SparkEmitter
	LineSegmentsRange=(Min=1.0000000,Max=1.0000000)
	TimeBeforeVisibleRange=(Min=5.0000000,Max=5.0000000)
	TimeBetweenSegmentsRange=(Min=0.1000000,Max=0.1000000)
	UseColorScale=true
	FadeOut=true
	RespawnDeadParticles=false
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-100.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=0,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=0,A=0))
	FadeOutFactor=(W=1.0000000,X=0.5000000,Y=0.5000000,Z=0.5000000)
	FadeOutStartTime=0.3000000
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=100.0000000),Z=(Min=0.0000000,Max=0.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=6
	Texture=Texture'BW_Core_WeaponTex.Particles.AquaFlareA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=50.0000000,Max=200.0000000),Y=(Min=0.0000000,Max=500.0000000),Z=(Min=0.0000000,Max=50.0000000))
end object
