class BG_ScnBloodAlien extends BallisticEmitter;

var Actor InitialTarget;

event Tick(float dt)
{
	local Actor A;
	local Vector L;
	local Rotator R;

	super(Actor).Tick(dt);
	// End:0x8F
	if((Owner != none) && PlayerController(Owner) != none)
	{
		// End:0x4A
		if(InitialTarget != PlayerController(Owner).ViewTarget)
		{
			Destroy();
			return;
		}
		PlayerController(Owner).PlayerCalcView(A, L, R);
		SetLocation(L + (Vector(R) * float(16)));
		SetRotation(R);		
	}
	else
	{
		Destroy();
	}
	//return;	
}

event PostBeginPlay()
{
	local float F;

	super.PostBeginPlay();
	// End:0x2F
	if(PlayerController(Owner) != none)
	{
		InitialTarget = PlayerController(Owner).ViewTarget;
	}
	F = FRand();
	// End:0x5F
	if(F <= 0.2500000)
	{
		Emitters[0].Texture = Texture'BallisticBloodPro.Alien.Alien-Spatter1';		
	}
	else
	{
		// End:0x87
		if(F <= 0.5000000)
		{
			Emitters[0].Texture = Texture'BallisticBloodPro.Alien.Alien-Spatter2';			
		}
		else
		{
			// End:0xAF
			if(F <= 0.7500000)
			{
				Emitters[0].Texture = Texture'BallisticBloodPro.Alien.Alien-Spatter3';				
			}
			else
			{
				Emitters[0].Texture = Texture'BallisticBloodPro.Alien.Alien-Spatter4';
			}
		}
	}
	//return;	
}

defaultproperties
{
	// Reference: SpriteEmitter'BallisticProV55.BG_ScnBloodAlien.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseDirectionAs=4
		ProjectionNormal=(X=-1.0000000,Y=0.0000000,Z=0.0000000)
		FadeOut=true
		RespawnDeadParticles=false
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-0.2000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		FadeOutStartTime=1.7700000
		CoordinateSystem=1
		MaxParticles=1
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-14.0000000,Max=14.0000000),Z=(Min=-14.0000000,Max=14.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0020000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=10.0000000,Max=25.0000000),Y=(Min=10.0000000,Max=25.0000000),Z=(Min=10.0000000,Max=25.0000000))
		InitialParticlesPerSecond=400.0000000
		DrawStyle=6
		Texture=Texture'BallisticBloodPro.Alien.Alien-Spatter1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=3.0000000,Max=3.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-0.5000000,Max=-0.3000000))
	end object
	Emitters[0]=SpriteEmitter0
	AutoDestroy=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.BG_ScnBloodAlien.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseDirectionAs=4
	ProjectionNormal=(X=-1.0000000,Y=0.0000000,Z=0.0000000)
	FadeOut=true
	RespawnDeadParticles=false
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-0.2000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	FadeOutStartTime=1.7700000
	CoordinateSystem=1
	MaxParticles=1
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-14.0000000,Max=14.0000000),Z=(Min=-14.0000000,Max=14.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0020000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=10.0000000,Max=25.0000000),Y=(Min=10.0000000,Max=25.0000000),Z=(Min=10.0000000,Max=25.0000000))
	InitialParticlesPerSecond=400.0000000
	DrawStyle=6
	Texture=Texture'BallisticBloodPro.Alien.Alien-Spatter1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=3.0000000,Max=3.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-0.5000000,Max=-0.3000000))
end object
