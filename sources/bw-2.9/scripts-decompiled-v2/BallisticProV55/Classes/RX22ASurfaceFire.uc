class RX22ASurfaceFire extends BW_FuelPatch;

var() float Damage;
var() Class<DamageType> DamageType;
var Controller InstigatorController;
var float LastTriggerTime;
var() Sound IgniteSound;
var RX22AFireControl GasControl;
var Pawn Ignitioneer;
var bool bPlayIgnite;
var Actor MyAmbientSoundActor;
var float RepulsionForceMag;

replication
{
	// Pos:0x000
	reliable if((int(Role) == int(ROLE_Authority)) && bNetInitial)
		bPlayIgnite;
}

simulated event PostNetBeginPlay()
{
	super(Actor).PostNetBeginPlay();
	// End:0x27
	if(bPlayIgnite && int(Role) < int(ROLE_Authority))
	{
		PlayIgnite();
	}
	//return;	
}

simulated function PlayIgnite()
{
	// End:0x28
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		Spawn(Class'BallisticProV55.RX22ATrailIgnite',,, Location);
	}
	// End:0x40
	if(int(Role) == int(ROLE_Authority))
	{
		bPlayIgnite = true;
	}
	//return;	
}

simulated function RangeVector MultiplyRV(RangeVector RV, float Scale)
{
	RV.X.Max *= Scale;
	RV.Y.Max *= Scale;
	RV.Z.Max *= Scale;
	RV.X.Min *= Scale;
	RV.Y.Min *= Scale;
	RV.Z.Min *= Scale;
	return RV;
	//return;	
}

simulated function FuelChanged()
{
	// End:0x1B
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		return;
	}
	Emitters[0].StartSizeRange = MultiplyRV(default.Emitters[0].StartSizeRange, Lerp(Fuel / MaxFuel, 1.0000000, 2.5000000));
	Emitters[1].StartSizeRange = MultiplyRV(default.Emitters[1].StartSizeRange, Lerp(Fuel / MaxFuel, 1.0000000, 2.2500000));
	// End:0x113
	if((Fuel / MaxFuel) > 0.4000000)
	{
		Emitters[2].Disabled = false;
		Emitters[2].StartSizeRange = MultiplyRV(default.Emitters[2].StartSizeRange, Lerp((Fuel - float(40)) / (MaxFuel - float(40)), 1.0000000, 1.5000000));		
	}
	else
	{
		Emitters[2].Disabled = true;
	}
	//return;	
}

function Timer()
{
	// End:0x14
	if(PhysicsVolume.bWaterVolume)
	{
		return;
	}
	super.Timer();
	//return;	
}

function Toast(Actor A)
{
	local Vector XYVel;
	local int Health;

	// End:0x42
	if(((Instigator == none) || Instigator.Controller == none) && InstigatorController != none)
	{
		A.SetDelayedDamageInstigatorController(InstigatorController);
	}
	// End:0x6B
	if(Pawn(A) != none)
	{
		Health = Pawn(A).Health;
	}
	// End:0xF4
	if(((Ignitioneer != none) && (A == Instigator) || BW_FuelPatch(A) != none) || (Instigator == none) && InstigatorController == none)
	{
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(A, Damage, Ignitioneer, A.Location, vect(0.0000000, 0.0000000, 0.0000000), DamageType);		
	}
	else
	{
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(A, Damage, Instigator, A.Location, vect(0.0000000, 0.0000000, 0.0000000), DamageType);
	}
	// End:0x1CF
	if((Pawn(A) != none) && Pawn(A).Health < Health)
	{
		XYVel = -A.Velocity;
		XYVel.Z = 0.0000000;
		Pawn(A).AddVelocity((XYVel + (RepulsionForceMag * Normal(A.Location - Location))) + vect(0.0000000, 0.0000000, 20.0000000));
	}
	//return;	
}

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	// End:0x5D
	if(int(Role) == int(ROLE_Authority))
	{
		// End:0x31
		if(Instigator == none)
		{
			Instigator = Pawn(Owner);
		}
		// End:0x5D
		if((InstigatorController == none) && Instigator != none)
		{
			InstigatorController = Instigator.Controller;
		}
	}
	// End:0x74
	if(PhysicsVolume.bWaterVolume)
	{
		Destroy();
		return;
	}
	AddFuel(0.0000000);
	// End:0xC1
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		PlaySound(IgniteSound,, 0.4000000,, 96.0000000);
		MyAmbientSoundActor = Spawn(Class'BallisticProV55.RX22AFlameSound',,, Location);
	}
	//return;	
}

simulated function Destroyed()
{
	// End:0x17
	if(MyAmbientSoundActor != none)
	{
		MyAmbientSoundActor.Destroy();
	}
	// End:0x32
	if(GasControl != none)
	{
		GasControl.PatchRemove(self);
	}
	super(Actor).Destroyed();
	//return;	
}

simulated function PhysicsVolumeChange(PhysicsVolume NewVolume)
{
	// End:0x18
	if(NewVolume.bWaterVolume)
	{
		Kill();
	}
	//return;	
}

defaultproperties
{
	Damage=25.0000000
	DamageType=Class'BallisticProV55.DTRX22AFireTrap'
	IgniteSound=Sound'BW_Core_WeaponSound.RX22A.RX22A-IgniteFire'
	RepulsionForceMag=275.0000000
	Fuel=20.0000000
	MaxFuel=150.0000000
	Extent=64
	bCanIgnite=false
	// Reference: SpriteEmitter'BallisticProV55.RX22ASurfaceFire.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		BlendBetweenSubdivisions=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=80.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.6000000,Max=0.6000000))
		FadeOutStartTime=0.4900000
		FadeInEndTime=0.4900000
		MaxParticles=2
		StartLocationRange=(X=(Min=-15.0000000,Max=15.0000000),Y=(Min=-15.0000000,Max=15.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.4500000,Max=0.5500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=50.0000000,Max=60.0000000),Y=(Min=40.0000000,Max=50.0000000),Z=(Min=40.0000000,Max=50.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.BlazingSubdivide'
		TextureUSubdivisions=4
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[0]=SpriteEmitter0
	// Reference: SpriteEmitter'BallisticProV55.RX22ASurfaceFire.SpriteEmitter2'
	begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
		UseDirectionAs=4
		ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.5000000,Max=0.5000000))
		FadeOutStartTime=0.5000000
		FadeInEndTime=0.5000000
		CoordinateSystem=1
		MaxParticles=2
		DetailMode=2
		StartLocationOffset=(X=-31.0000000,Y=0.0000000,Z=0.0000000)
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=40.0000000,Max=60.0000000),Y=(Min=40.0000000,Max=60.0000000),Z=(Min=40.0000000,Max=60.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.Explode2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[1]=SpriteEmitter2
	// Reference: SpriteEmitter'BallisticProV55.RX22ASurfaceFire.SpriteEmitter5'
	begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		Disabled=true
		Backup_Disabled=true
		UniformSize=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=80.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=64,B=32,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.5000000,Max=0.5000000))
		FadeOutStartTime=0.3920000
		FadeInEndTime=0.3920000
		MaxParticles=2
		StartLocationRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
		StartSizeRange=(X=(Min=100.0000000,Max=140.0000000),Y=(Min=100.0000000,Max=140.0000000),Z=(Min=100.0000000,Max=140.0000000))
		InitialParticlesPerSecond=5000.0000000
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.8000000,Max=0.8000000)
	end object
	Emitters[2]=SpriteEmitter5
	AutoDestroy=true
	bNetInitialRotation=true
	RemoteRole=2
	CollisionRadius=72.0000000
	CollisionHeight=70.0000000
	bCollideActors=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.RX22ASurfaceFire.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	BlendBetweenSubdivisions=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=80.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.6000000,Max=0.6000000))
	FadeOutStartTime=0.4900000
	FadeInEndTime=0.4900000
	MaxParticles=2
	StartLocationRange=(X=(Min=-15.0000000,Max=15.0000000),Y=(Min=-15.0000000,Max=15.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.4500000,Max=0.5500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=50.0000000,Max=60.0000000),Y=(Min=40.0000000,Max=50.0000000),Z=(Min=40.0000000,Max=50.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.BlazingSubdivide'
	TextureUSubdivisions=4
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
// Reference: SpriteEmitter'BallisticProV55.RX22ASurfaceFire.SpriteEmitter2'
begin object name="SpriteEmitter2" class=Engine.SpriteEmitter
	UseDirectionAs=4
	ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.5000000,Max=0.5000000))
	FadeOutStartTime=0.5000000
	FadeInEndTime=0.5000000
	CoordinateSystem=1
	MaxParticles=2
	DetailMode=2
	StartLocationOffset=(X=-31.0000000,Y=0.0000000,Z=0.0000000)
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=40.0000000,Max=60.0000000),Y=(Min=40.0000000,Max=60.0000000),Z=(Min=40.0000000,Max=60.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.Explode2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
// Reference: SpriteEmitter'BallisticProV55.RX22ASurfaceFire.SpriteEmitter5'
begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	Disabled=true
	Backup_Disabled=true
	UniformSize=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=80.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=64,B=32,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.5000000,Max=0.5000000))
	FadeOutStartTime=0.3920000
	FadeInEndTime=0.3920000
	MaxParticles=2
	StartLocationRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=10.0000000,Max=10.0000000))
	StartSizeRange=(X=(Min=100.0000000,Max=140.0000000),Y=(Min=100.0000000,Max=140.0000000),Z=(Min=100.0000000,Max=140.0000000))
	InitialParticlesPerSecond=5000.0000000
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.8000000,Max=0.8000000)
end object
