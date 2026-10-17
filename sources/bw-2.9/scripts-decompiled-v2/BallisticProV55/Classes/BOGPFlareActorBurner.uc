class BOGPFlareActorBurner extends BallisticEmitter;

const TIMER_INTERVAL = 0.5f;

var Actor Victim;
var() Class<DamageType> DamageType;
var() int Damage;
var() int TicksRemaining;
var Controller InstigatorController;

function Reset()
{
	Destroy();
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
	SetTimer(0.5000000, true);
	// End:0x77
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		Emitters[0].Disabled = true;
		Emitters[1].Disabled = true;
		Emitters[2].Disabled = true;		
	}
	else
	{
		Emitters[0].SkeletalMeshActor = Victim;
		Emitters[1].SkeletalMeshActor = Victim;
		Emitters[2].SkeletalMeshActor = Victim;
	}
	SetLocation(Victim.Location - (vect(0.0000000, 0.0000000, 1.0000000) * Victim.CollisionHeight));
	SetRotation(Victim.Rotation + rot(0, -16384, 0));
	SetBase(Victim);
	//return;	
}

simulated event Timer()
{
	// End:0x41
	if((TicksRemaining == 0) || Victim.PhysicsVolume.bWaterVolume)
	{
		Kill();
		bDynamicLight = false;
		SetTimer(0.0000000, false);
		return;
	}
	// End:0xDC
	if((Victim != none) && int(Level.NetMode) != int(NM_Client))
	{
		// End:0x9C
		if((Instigator == none) || Instigator.Controller == none)
		{
			Victim.SetDelayedDamageInstigatorController(InstigatorController);
		}
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victim, float(Damage), Instigator, Victim.Location, vect(0.0000000, 0.0000000, 0.0000000), DamageType);
	}
	TicksRemaining--;
	//return;	
}

simulated event Tick(float dt)
{
	super(Actor).Tick(dt);
	// End:0x2D
	if((Victim == none) || Victim.bDeleteMe)
	{
		Destroy();
	}
	// End:0x56
	if((int(Level.NetMode) == int(NM_DedicatedServer)) && TicksRemaining == 0)
	{
		Destroy();
	}
	// End:0x66
	if(TicksRemaining == 0)
	{
		return;		
	}
	else
	{
		// End:0xD7
		if((xPawn(Victim) != none) && xPawn(Victim).bDeRes)
		{
			Emitters[0].SkeletalMeshActor = none;
			Emitters[1].SkeletalMeshActor = none;
			Emitters[2].SkeletalMeshActor = none;
			SetBase(none);
			Kill();
			TicksRemaining = 0;
		}
	}
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
	DamageType=Class'BallisticProV55.DTBOGPFlareBurn'
	Damage=25
	TicksRemaining=5
	// Reference: SpriteEmitter'BallisticProV55.BOGPFlareActorBurner.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=192,G=128,B=0,A=0))
		FadeOutStartTime=0.5000000
		FadeInEndTime=0.4000000
		CoordinateSystem=1
		StartSizeRange=(X=(Min=10.0000000,Max=20.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		UseSkeletalLocationAs=2
		SkeletalScale=(X=0.3800000,Y=0.3800000,Z=0.3800000)
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.6000000,Max=2.0000000)
	end object
	Emitters[0]=SpriteEmitter0
	// Reference: SpriteEmitter'BallisticProV55.BOGPFlareActorBurner.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		Opacity=0.5800000
		FadeOutStartTime=1.0000000
		FadeInEndTime=0.9200000
		MaxParticles=50
		DetailMode=2
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=80.0000000)
		StartLocationRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=20.0000000,Max=20.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
		StartSizeRange=(X=(Min=8.0000000,Max=20.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
		UseSkeletalLocationAs=1
		SkeletalScale=(X=0.3800000,Y=0.3800000,Z=0.3800000)
		DrawStyle=5
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke4'
		SecondsBeforeInactive=0.0000000
		StartVelocityRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=140.0000000,Max=160.0000000))
		VelocityLossRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.5000000,Max=0.5000000))
	end object
	Emitters[1]=SpriteEmitter1
	// Reference: SpriteEmitter'BallisticProV55.BOGPFlareActorBurner.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		BlendBetweenSubdivisions=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.9000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.9000000),Z=(Min=0.5000000,Max=0.6000000))
		FadeOutStartTime=0.5300000
		FadeInEndTime=0.2800000
		CoordinateSystem=1
		MaxParticles=30
		StartLocationOffset=(X=0.0000000,Y=8.0000000,Z=0.0000000)
		StartLocationRange=(X=(Min=-15.0000000,Max=15.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=20.0000000,Max=70.0000000))
		StartSpinRange=(X=(Min=0.4500000,Max=0.5500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=15.0000000,Max=20.0000000),Y=(Min=15.0000000,Max=20.0000000),Z=(Min=15.0000000,Max=20.0000000))
		SkeletalScale=(X=0.3800000,Y=0.3800000,Z=0.3800000)
		Texture=Texture'BW_Core_WeaponTex.Particles.BlazingSubdivide'
		TextureUSubdivisions=4
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=0.0000000,Max=80.0000000))
		VelocityLossRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=1.0000000,Max=1.0000000))
	end object
	Emitters[2]=SpriteEmitter2
	AutoDestroy=true
	LightType=7
	LightEffect=21
	LightHue=25
	LightSaturation=100
	LightBrightness=200.0000000
	LightRadius=15.0000000
	bDynamicLight=true
	AmbientSound=Sound'BW_Core_WeaponSound.FP7.FP7FireLoop'
	bFullVolume=true
	bHardAttach=true
	SoundVolume=255
	SoundRadius=128.0000000
	bNotOnDedServer=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.BOGPFlareActorBurner.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=0))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=192,G=128,B=0,A=0))
	FadeOutStartTime=0.5000000
	FadeInEndTime=0.4000000
	CoordinateSystem=1
	StartSizeRange=(X=(Min=10.0000000,Max=20.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	UseSkeletalLocationAs=2
	SkeletalScale=(X=0.3800000,Y=0.3800000,Z=0.3800000)
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.6000000,Max=2.0000000)
end object
// Reference: SpriteEmitter'BallisticProV55.BOGPFlareActorBurner.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	Opacity=0.5800000
	FadeOutStartTime=1.0000000
	FadeInEndTime=0.9200000
	MaxParticles=50
	DetailMode=2
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=80.0000000)
	StartLocationRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=20.0000000,Max=20.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.3000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=2.0000000)
	StartSizeRange=(X=(Min=8.0000000,Max=20.0000000),Y=(Min=100.0000000,Max=100.0000000),Z=(Min=100.0000000,Max=100.0000000))
	UseSkeletalLocationAs=1
	SkeletalScale=(X=0.3800000,Y=0.3800000,Z=0.3800000)
	DrawStyle=5
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke4'
	SecondsBeforeInactive=0.0000000
	StartVelocityRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=140.0000000,Max=160.0000000))
	VelocityLossRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.5000000,Max=0.5000000))
end object
// Reference: SpriteEmitter'BallisticProV55.BOGPFlareActorBurner.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	BlendBetweenSubdivisions=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.9000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.9000000),Z=(Min=0.5000000,Max=0.6000000))
	FadeOutStartTime=0.5300000
	FadeInEndTime=0.2800000
	CoordinateSystem=1
	MaxParticles=30
	StartLocationOffset=(X=0.0000000,Y=8.0000000,Z=0.0000000)
	StartLocationRange=(X=(Min=-15.0000000,Max=15.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=20.0000000,Max=70.0000000))
	StartSpinRange=(X=(Min=0.4500000,Max=0.5500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=15.0000000,Max=20.0000000),Y=(Min=15.0000000,Max=20.0000000),Z=(Min=15.0000000,Max=20.0000000))
	SkeletalScale=(X=0.3800000,Y=0.3800000,Z=0.3800000)
	Texture=Texture'BW_Core_WeaponTex.Particles.BlazingSubdivide'
	TextureUSubdivisions=4
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=0.0000000,Max=80.0000000))
	VelocityLossRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=1.0000000,Max=1.0000000))
end object
