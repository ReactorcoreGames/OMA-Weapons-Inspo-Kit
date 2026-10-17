class RaygunPlagueEffect extends BallisticEmitter;

var Actor Victim;
var float Duration;
var float MaxDuration;
var float Damage;
var Controller InstigatorController;
var RaygunPlagueTrigger PlagueTrigger;
var Class<DamageType> DamageType;

function Reset()
{
	Destroy();
	//return;	
}

simulated event TornOff()
{
	Kill();
	//return;	
}

simulated function Initialize(Actor V)
{
	// End:0x0D
	if(V == none)
	{
		return;
	}
	Victim = V;
	// End:0x31
	if(int(Role) == int(ROLE_Authority))
	{
		SetTimer(0.5000000, true);
	}
	// End:0x87
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		Emitters[0].Disabled = true;
		Emitters[1].Disabled = true;
		Emitters[2].Disabled = true;		
	}
	else
	{
		// End:0xD7
		if((xPawn(Victim) != none) && xPawn(Victim).IsLocallyControlled())
		{
			Emitters[1].Disabled = true;
			Emitters[2].Disabled = true;
		}
	}
	SetBase(Victim);
	PlagueTrigger = Spawn(Class'BWBP_OP_Pro.RaygunPlagueTrigger', Victim,, Victim.Location);
	PlagueTrigger.Instigator = Instigator;
	PlagueTrigger.InstigatorController = InstigatorController;
	PlagueTrigger.PlagueEffect = self;
	// End:0x15F
	if(BallisticPawn(Victim) != none)
	{
		BallisticPawn(Victim).bPreventHealing = true;
	}
	//return;	
}

function ExtendDuration(float Amount)
{
	// End:0x0B
	if(bTearOff)
	{
		return;
	}
	Duration = FMin(Duration + Amount, MaxDuration);
	//return;	
}

event Tick(float dt)
{
	// End:0x0B
	if(bTearOff)
	{
		return;
	}
	Duration -= dt;
	// End:0x78
	if((Victim == none) || Duration <= float(0))
	{
		// End:0x70
		if((int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
		{
			bTearOff = true;			
		}
		else
		{
			Kill();
		}
		return;
	}
	//return;	
}

event Timer()
{
	// End:0x0C
	if(bTearOff)
	{
		Destroy();
	}
	// End:0xA2
	if(((Victim != none) && int(Role) == int(ROLE_Authority)) && Duration > float(0))
	{
		// End:0x6D
		if((Instigator == none) || Instigator.Controller == none)
		{
			Victim.SetDelayedDamageInstigatorController(InstigatorController);
		}
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victim, Damage, Instigator, Location, vect(0.0000000, 0.0000000, 0.0000000), DamageType);
	}
	//return;	
}

simulated function Destroyed()
{
	// End:0x26
	if(BallisticPawn(Victim) != none)
	{
		BallisticPawn(Victim).bPreventHealing = false;
	}
	super(Actor).Destroyed();
	PlagueTrigger.Destroy();
	//return;	
}

defaultproperties
{
	Duration=8.0000000
	MaxDuration=16.0000000
	Damage=4.0000000
	DamageType=Class'BWBP_OP_Pro.DTRaygunPlague'
	// Reference: SpriteEmitter'BWBP_OP_Pro.RaygunPlagueEffect.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		SpinParticles=true
		UniformSize=true
		AutomaticInitialSpawning=false
		BlendBetweenSubdivisions=true
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=248,G=54,B=5,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=139,G=52,B=52,A=255))
		FadeOutStartTime=0.7500000
		MaxParticles=60
		StartLocationShape=1
		SphereRadiusRange=(Min=1.0000000,Max=5.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=25.0000000,Max=25.0000000),Y=(Min=25.0000000,Max=25.0000000),Z=(Min=25.0000000,Max=25.0000000))
		ParticlesPerSecond=60.0000000
		InitialParticlesPerSecond=500.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.SmokeWisp-Alpha'
		TextureUSubdivisions=4
		TextureVSubdivisions=2
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRadialRange=(Min=20.0000000,Max=250.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[0]=SpriteEmitter0
	// Reference: SpriteEmitter'BWBP_OP_Pro.RaygunPlagueEffect.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=128,B=0,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=0,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.3500000,Max=0.2500000),Z=(Min=0.0000000,Max=0.0000000))
		Opacity=0.6300000
		FadeOutStartTime=0.0775000
		FadeInEndTime=0.0275000
		MaxParticles=5
		StartLocationShape=1
		SphereRadiusRange=(Min=1.0000000,Max=5.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=7.0000000)
		StartSizeRange=(X=(Min=15.0000000,Max=15.0000000),Y=(Min=15.0000000,Max=15.0000000),Z=(Min=15.0000000,Max=15.0000000))
		InitialParticlesPerSecond=5.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.NewSmoke1f'
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
		StartVelocityRadialRange=(Min=20.0000000,Max=250.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[1]=SpriteEmitter1
	// Reference: SpriteEmitter'BWBP_OP_Pro.RaygunPlagueEffect.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=248,G=235,B=146,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=183,G=119,B=49,A=255))
		FadeOutStartTime=0.5100000
		FadeInEndTime=0.0900000
		CoordinateSystem=1
		MaxParticles=2
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
		InitialParticlesPerSecond=2.0000000
		Texture=Texture'AW-2004Particles.Weapons.PlasmaStar'
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[2]=SpriteEmitter2
	AutoDestroy=true
	Physics=10
	RemoteRole=2
	AmbientSound=Sound'BW_Core_WeaponSound.RX22A.RX22A-PackBurn'
	bFullVolume=true
	SoundVolume=64
	SoundRadius=128.0000000
	bNotOnDedServer=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_OP_Pro.RaygunPlagueEffect.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	SpinParticles=true
	UniformSize=true
	AutomaticInitialSpawning=false
	BlendBetweenSubdivisions=true
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=248,G=54,B=5,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=139,G=52,B=52,A=255))
	FadeOutStartTime=0.7500000
	MaxParticles=60
	StartLocationShape=1
	SphereRadiusRange=(Min=1.0000000,Max=5.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=25.0000000,Max=25.0000000),Y=(Min=25.0000000,Max=25.0000000),Z=(Min=25.0000000,Max=25.0000000))
	ParticlesPerSecond=60.0000000
	InitialParticlesPerSecond=500.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.SmokeWisp-Alpha'
	TextureUSubdivisions=4
	TextureVSubdivisions=2
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRadialRange=(Min=20.0000000,Max=250.0000000)
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'BWBP_OP_Pro.RaygunPlagueEffect.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=128,B=0,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=0,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.3500000,Max=0.2500000),Z=(Min=0.0000000,Max=0.0000000))
	Opacity=0.6300000
	FadeOutStartTime=0.0775000
	FadeInEndTime=0.0275000
	MaxParticles=5
	StartLocationShape=1
	SphereRadiusRange=(Min=1.0000000,Max=5.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=7.0000000)
	StartSizeRange=(X=(Min=15.0000000,Max=15.0000000),Y=(Min=15.0000000,Max=15.0000000),Z=(Min=15.0000000,Max=15.0000000))
	InitialParticlesPerSecond=5.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.NewSmoke1f'
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
	StartVelocityRadialRange=(Min=20.0000000,Max=250.0000000)
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'BWBP_OP_Pro.RaygunPlagueEffect.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=248,G=235,B=146,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=183,G=119,B=49,A=255))
	FadeOutStartTime=0.5100000
	FadeInEndTime=0.0900000
	CoordinateSystem=1
	MaxParticles=2
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
	InitialParticlesPerSecond=2.0000000
	Texture=Texture'AW-2004Particles.Weapons.PlasmaStar'
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
