class A51GroundAcid extends BallisticEmitter;

const BURNINTERVAL = 0.3;

var float BurnTime;
var() float Damage;
var() Class<DamageType> DamageType;
var AvoidMarker Fear;
var Controller InstigatorController;
var bool bStuck;
var bool bSetup;
var A51AcidControl AcidControl;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		BurnTime;
}

function Reset()
{
	Destroy();
	//return;	
}

simulated function Tick(float dt)
{
	super(Actor).Tick(dt);
	// End:0x1E
	if(BurnTime == float(666))
	{
		return;
	}
	BurnTime -= dt;
	// End:0x69
	if(BurnTime <= float(0))
	{
		// End:0x58
		if(int(Level.NetMode) == int(NM_DedicatedServer))
		{
			bTearOff = true;
		}
		Kill();
		BurnTime = 666.0000000;
	}
	//return;	
}

function Landed(Vector HitNormal)
{
	HitWall(HitNormal, none);
	//return;	
}

function HitWall(Vector HitNormal, Actor Wall)
{
	local Projector P;

	SetPhysics(0);
	// End:0x20
	if(int(Level.NetMode) == int(NM_Client))
	{
		return;
	}
	bCollideWorld = false;
	SetRotation(rot(32768, 0, 0));
	SetCollision(true, false, false);
	SetCollisionSize(108.0000000, 128.0000000);
	Fear = Spawn(Class'Engine.AvoidMarker');
	Fear.SetCollisionSize(120.0000000, 120.0000000);
	Fear.StartleBots();
	P = Spawn(Class'BallisticProV55.AD_A500BlastSplat', self,, Location, Rotator(-HitNormal));
	// End:0xD9
	if((BallisticDecal(P) != none) && BallisticDecal(P).bWaitForInit)
	{
		BallisticDecal(P).InitDecal();
	}
	//return;	
}

function PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x33
	if(int(Level.NetMode) != int(NM_Client))
	{
		SetTimer(0.3000000 + (FRand() * 0.5000000), true);
	}
	BurnTime -= (float(2) * FRand());
	// End:0x95
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		Emitters[0].Disabled = true;
		Emitters[1].Disabled = true;
		Emitters[2].Disabled = true;
	}
	//return;	
}

function Timer()
{
	local Actor A;

	// End:0x3C
	if(((int(Level.NetMode) == int(NM_DedicatedServer)) && BurnTime == float(666)) || AcidControl == none)
	{
		Destroy();
	}
	// End:0x50
	if(PhysicsVolume.bWaterVolume)
	{
		return;
	}
	// End:0x10F
	foreach TouchingActors(Class'Engine.Actor', A)
	{
		// End:0x95
		if((Instigator == none) || Instigator.Controller == none)
		{
			A.SetDelayedDamageInstigatorController(InstigatorController);
		}
		// End:0xD0
		if(Pawn(A) != none)
		{
			AcidControl.TryDamage(Pawn(A), 0.3000000, Damage, DamageType);
			// End:0x10E
			continue;
		}
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(A, Damage, Instigator, A.Location, vect(0.0000000, 0.0000000, 0.0000000), DamageType);		
	}	
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(Fear != none)
	{
		Fear.Destroy();
	}
	super(Actor).Destroyed();
	//return;	
}

simulated function PhysicsVolumeChange(PhysicsVolume NewVolume)
{
	// End:0x37
	if(NewVolume.bWaterVolume)
	{
		// End:0x31
		if(int(Level.NetMode) == int(NM_DedicatedServer))
		{
			Destroy();			
		}
		else
		{
			Kill();
		}
	}
	//return;	
}

defaultproperties
{
	BurnTime=6.0000000
	Damage=15.0000000
	DamageType=Class'BWBP_SWC_Pro.DTA51Pool'
	// Reference: SpriteEmitter'BWBP_SWC_Pro.A51GroundAcid.SpriteEmitter12'
	begin object name="SpriteEmitter12" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		UseSizeScale=true
		UseRegularSizeScale=false
		AutomaticInitialSpawning=false
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=-800.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=255,B=0,A=255))
		ColorScale[1]=(RelativeTime=0.5214290,Color=(R=128,G=255,B=0,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=170,G=255,B=0,A=255))
		ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.0000000))
		FadeOutStartTime=0.3375000
		FadeInEndTime=0.0360000
		MaxParticles=75
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=-30.0000000,Max=30.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7000000)
		SizeScale[1]=(RelativeTime=0.3100000,RelativeSize=1.2500000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=2.5000000)
		StartSizeRange=(X=(Min=4.0000000,Max=6.0000000),Y=(Min=4.0000000,Max=15.0000000),Z=(Min=4.0000000,Max=6.0000000))
		InitialParticlesPerSecond=100.0000000
		Texture=Texture'BW_Core_WeaponTex.Reptile.AcidDrops01'
		TextureUSubdivisions=2
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.4500000,Max=0.4500000)
		StartVelocityRange=(X=(Min=-350.0000000,Max=350.0000000),Y=(Min=-350.0000000,Max=350.0000000),Z=(Min=250.0000000,Max=750.0000000))
		VelocityLossRange=(X=(Min=3.0000000,Max=3.0000000),Y=(Min=3.0000000,Max=3.0000000),Z=(Min=3.0000000,Max=3.0000000))
		AddVelocityFromOtherEmitter=0
		AddVelocityMultiplierRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.1000000,Max=0.1000000),Z=(Min=0.1000000,Max=0.1000000))
	end object
	Emitters[0]=SpriteEmitter12
	// Reference: SpriteEmitter'BWBP_SWC_Pro.A51GroundAcid.SpriteEmitter13'
	begin object name="SpriteEmitter13" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=255,B=0,A=255))
		ColorScale[1]=(RelativeTime=0.2214290,Color=(R=128,G=255,B=0,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=255,B=0,A=255))
		Opacity=0.7600000
		FadeOutStartTime=0.2460000
		FadeInEndTime=0.0300000
		MaxParticles=16
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-25.0000000,Max=25.0000000),Z=(Min=-25.0000000,Max=25.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.6000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.4000000)
		SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=18.0000000,Max=30.0000000),Y=(Min=18.0000000,Max=30.0000000),Z=(Min=18.0000000,Max=30.0000000))
		InitialParticlesPerSecond=25.0000000
		Texture=Texture'BallisticBloodPro.DeRez.Wisp1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.6000000,Max=0.6000000)
		StartVelocityRange=(X=(Min=-25.0000000,Max=25.0000000),Y=(Min=-25.0000000,Max=25.0000000),Z=(Min=0.0000000,Max=25.0000000))
	end object
	Emitters[1]=SpriteEmitter13
	// Reference: SpriteEmitter'BWBP_SWC_Pro.A51GroundAcid.SpriteEmitter14'
	begin object name="SpriteEmitter14" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=255,B=0,A=255))
		ColorScale[1]=(RelativeTime=0.2214290,Color=(R=128,G=255,B=0,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=255,B=0,A=255))
		FadeOutStartTime=0.3540000
		FadeInEndTime=0.0240000
		MaxParticles=25
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-25.0000000,Max=25.0000000),Z=(Min=-25.0000000,Max=25.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.6000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1250000)
		SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=0.6000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
		StartSizeRange=(X=(Min=4.0000000,Max=10.0000000),Y=(Min=4.0000000,Max=10.0000000),Z=(Min=4.0000000,Max=10.0000000))
		InitialParticlesPerSecond=35.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.AquaBubbleA1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.7500000,Max=0.7500000)
		StartVelocityRange=(X=(Min=-55.0000000,Max=55.0000000),Y=(Min=-55.0000000,Max=55.0000000),Z=(Min=25.0000000,Max=95.0000000))
	end object
	Emitters[2]=SpriteEmitter14
	AutoDestroy=true
	bNetTemporary=true
	Physics=2
	RemoteRole=2
	LifeSpan=10.0000000
	CollisionRadius=2.0000000
	CollisionHeight=2.0000000
	bCollideWorld=true
	bUseCylinderCollision=true
	Mass=30.0000000
	bNotOnDedServer=false
	bDirectional=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_SWC_Pro.A51GroundAcid.SpriteEmitter12'
begin object name="SpriteEmitter12" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	UseSizeScale=true
	UseRegularSizeScale=false
	AutomaticInitialSpawning=false
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=-800.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=255,B=0,A=255))
	ColorScale[1]=(RelativeTime=0.5214290,Color=(R=128,G=255,B=0,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=170,G=255,B=0,A=255))
	ColorMultiplierRange=(X=(Min=0.8000000,Max=1.0000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.0000000,Max=0.0000000))
	FadeOutStartTime=0.3375000
	FadeInEndTime=0.0360000
	MaxParticles=75
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-30.0000000,Max=30.0000000),Z=(Min=-30.0000000,Max=30.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7000000)
	SizeScale[1]=(RelativeTime=0.3100000,RelativeSize=1.2500000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=2.5000000)
	StartSizeRange=(X=(Min=4.0000000,Max=6.0000000),Y=(Min=4.0000000,Max=15.0000000),Z=(Min=4.0000000,Max=6.0000000))
	InitialParticlesPerSecond=100.0000000
	Texture=Texture'BW_Core_WeaponTex.Reptile.AcidDrops01'
	TextureUSubdivisions=2
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.4500000,Max=0.4500000)
	StartVelocityRange=(X=(Min=-350.0000000,Max=350.0000000),Y=(Min=-350.0000000,Max=350.0000000),Z=(Min=250.0000000,Max=750.0000000))
	VelocityLossRange=(X=(Min=3.0000000,Max=3.0000000),Y=(Min=3.0000000,Max=3.0000000),Z=(Min=3.0000000,Max=3.0000000))
	AddVelocityFromOtherEmitter=0
	AddVelocityMultiplierRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.1000000,Max=0.1000000),Z=(Min=0.1000000,Max=0.1000000))
end object
// Reference: SpriteEmitter'BWBP_SWC_Pro.A51GroundAcid.SpriteEmitter13'
begin object name="SpriteEmitter13" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=255,B=0,A=255))
	ColorScale[1]=(RelativeTime=0.2214290,Color=(R=128,G=255,B=0,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=255,B=0,A=255))
	Opacity=0.7600000
	FadeOutStartTime=0.2460000
	FadeInEndTime=0.0300000
	MaxParticles=16
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-25.0000000,Max=25.0000000),Z=(Min=-25.0000000,Max=25.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.6000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.4000000)
	SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=18.0000000,Max=30.0000000),Y=(Min=18.0000000,Max=30.0000000),Z=(Min=18.0000000,Max=30.0000000))
	InitialParticlesPerSecond=25.0000000
	Texture=Texture'BallisticBloodPro.DeRez.Wisp1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.6000000,Max=0.6000000)
	StartVelocityRange=(X=(Min=-25.0000000,Max=25.0000000),Y=(Min=-25.0000000,Max=25.0000000),Z=(Min=0.0000000,Max=25.0000000))
end object
// Reference: SpriteEmitter'BWBP_SWC_Pro.A51GroundAcid.SpriteEmitter14'
begin object name="SpriteEmitter14" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=128,G=255,B=0,A=255))
	ColorScale[1]=(RelativeTime=0.2214290,Color=(R=128,G=255,B=0,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=128,G=128,B=128,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=0,G=255,B=0,A=255))
	FadeOutStartTime=0.3540000
	FadeInEndTime=0.0240000
	MaxParticles=25
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=-25.0000000,Max=25.0000000),Z=(Min=-25.0000000,Max=25.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.6000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.1250000)
	SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=0.6000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=5.0000000)
	StartSizeRange=(X=(Min=4.0000000,Max=10.0000000),Y=(Min=4.0000000,Max=10.0000000),Z=(Min=4.0000000,Max=10.0000000))
	InitialParticlesPerSecond=35.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.AquaBubbleA1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.7500000,Max=0.7500000)
	StartVelocityRange=(X=(Min=-55.0000000,Max=55.0000000),Y=(Min=-55.0000000,Max=55.0000000),Z=(Min=25.0000000,Max=95.0000000))
end object
