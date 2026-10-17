class G28GasCloud_Exp extends BW_FuelPatch;

var AvoidMarker Fear;
var G28CloudControl_Exp MyControl;
var float Density;
var() Sound IgniteSound;
var Pawn Ignitioneer;

simulated event PostNetReceive()
{
	super.PostNetReceive();
	// End:0x16
	if(bIgnited)
	{
		Ignite(none);
	}
	//return;	
}

simulated function Ignite(Pawn EventInstigator)
{
	local RX22ACloudBang Bang;

	bIgnited = true;
	// End:0x5E
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		Bang = Spawn(Class'BallisticProV55.RX22ACloudBang',,, Location);
		Bang.InitCloudBang(1.0000000);
		PlaySound(IgniteSound,, 0.8000000,, 112.0000000);
	}
	// End:0x98
	if(int(Role) == int(ROLE_Authority))
	{
		Ignitioneer = EventInstigator;
		HurtRadius(50.0000000, 224.0000000, Class'BWBP_SKC_Pro.DTG28CloudBomb', 10000.0000000, Location);
	}
	//return;	
}

simulated function HurtRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation)
{
	local Actor Victims;
	local float damageScale, dist;
	local Vector Dir;
	local Pawn instigatedBy;

	// End:0x0B
	if(bHurtEntry)
	{
		return;
	}
	bHurtEntry = true;
	// End:0x208
	foreach VisibleCollidingActors(Class'Engine.Actor', Victims, DamageRadius, HitLocation)
	{
		// End:0x207
		if(((Victims != self) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo'))
		{
			// End:0xA2
			if((Ignitioneer != none) && (Victims == Instigator) || Instigator == none)
			{
				instigatedBy = Ignitioneer;				
			}
			else
			{
				instigatedBy = Instigator;
			}
			Dir = Victims.Location - HitLocation;
			dist = FMax(1.0000000, VSize(Dir));
			Dir = Dir / dist;
			damageScale = 1.0000000 - FMax(0.0000000, (dist - Victims.CollisionRadius) / DamageRadius);
			Victims.TakeDamage(int(damageScale * DamageAmount), instigatedBy, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * Momentum) * Dir, DamageType);
			// End:0x207
			if(((Instigator != none) && Vehicle(Victims) != none) && Vehicle(Victims).Health > 0)
			{
				Vehicle(Victims).DriverRadiusDamage(DamageAmount, DamageRadius, Instigator.Controller, DamageType, Momentum, HitLocation);
			}
		}		
	}	
	bHurtEntry = false;
	//return;	
}

function TakeDamage(int Damage, Pawn EventInstigator, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x0B
	if(bIgnited)
	{
		return;
	}
	// End:0x38
	if((Class<BallisticDamageType>(DamageType) != none) && !Class<BallisticDamageType>(DamageType).default.bIgniteFires)
	{
		return;
	}
	bIgnited = true;
	SetTimer(0.2000000, false);
	Ignite(EventInstigator);
	//return;	
}

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	MyControl = G28CloudControl_Exp(Owner);
	// End:0x6E
	if(int(Level.NetMode) != int(NM_Client))
	{
		// End:0x6E
		if(int(Level.NetMode) == int(NM_DedicatedServer))
		{
			Emitters[0].Disabled = true;
			Emitters[1].Disabled = true;
		}
	}
	//return;	
}

function Reset()
{
	Destroy();
	//return;	
}

simulated function Terminate(float Delay)
{
	SetTimer(Delay, false);
	//return;	
}

simulated function Timer()
{
	// End:0x23
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		GotoState('DSDying');		
	}
	else
	{
		Kill();
	}
	//return;	
}

simulated function Destroyed()
{
	// End:0x1B
	if(MyControl != none)
	{
		MyControl.CloudDie(self);
	}
	// End:0x32
	if(Fear != none)
	{
		Fear.Destroy();
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

state DSDying
{Begin:

	Sleep(3.0000000);
	Destroy();
	stop;					
}

defaultproperties
{
	Density=1.0000000
	IgniteSound=Sound'BW_Core_WeaponSound.RX22A.RX22A-IgniteFire'
	Fuel=100.0000000
	// Reference: SpriteEmitter'BWBP_SKC_Pro.G28GasCloud_Exp.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=20.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=150,G=150,B=255,A=200))
		ColorScale[1]=(RelativeTime=0.4000000,Color=(R=150,G=150,B=255,A=200))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=58,G=58,B=64,A=64))
		ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.9000000,Max=0.9000000))
		Opacity=0.4900000
		FadeOutStartTime=1.0500000
		FadeInEndTime=1.0500000
		CoordinateSystem=1
		MaxParticles=200
		StartLocationRange=(X=(Min=-96.0000000,Max=96.0000000),Y=(Min=-32.0000000,Max=32.0000000),Z=(Min=-32.0000000,Max=32.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0100000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.3000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=150.0000000,Max=200.0000000),Y=(Min=150.0000000,Max=200.0000000),Z=(Min=150.0000000,Max=200.0000000))
		InitialParticlesPerSecond=0.7000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Effects.Smoke7'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=3.0000000,Max=3.0000000)
		StartVelocityRange=(X=(Min=-15.0000000,Max=15.0000000),Y=(Min=-15.0000000,Max=15.0000000),Z=(Min=-10.0000000,Max=0.0000000))
	end object
	Emitters[0]=SpriteEmitter1
	// Reference: SpriteEmitter'BWBP_SKC_Pro.G28GasCloud_Exp.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		RespawnDeadParticles=false
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=150,G=150,B=255,A=200))
		ColorScale[1]=(RelativeTime=0.4000000,Color=(R=150,G=150,B=255,A=200))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=58,G=58,B=64,A=64))
		ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.9000000,Max=0.9000000))
		Opacity=0.5800000
		FadeOutStartTime=1.4500000
		FadeInEndTime=0.6750000
		CoordinateSystem=1
		MaxParticles=20
		StartLocationRange=(X=(Min=-64.0000000,Max=64.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0300000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		InitialParticlesPerSecond=0.7500000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.5000000,Max=2.5000000)
	end object
	Emitters[1]=SpriteEmitter0
	AutoDestroy=true
	RemoteRole=2
	bCanBeDamaged=true
	CollisionRadius=192.0000000
	CollisionHeight=192.0000000
	bCollideActors=true
	bUseCylinderCollision=true
	bNotOnDedServer=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_SKC_Pro.G28GasCloud_Exp.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=20.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=150,G=150,B=255,A=200))
	ColorScale[1]=(RelativeTime=0.4000000,Color=(R=150,G=150,B=255,A=200))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=58,G=58,B=64,A=64))
	ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.9000000,Max=0.9000000))
	Opacity=0.4900000
	FadeOutStartTime=1.0500000
	FadeInEndTime=1.0500000
	CoordinateSystem=1
	MaxParticles=200
	StartLocationRange=(X=(Min=-96.0000000,Max=96.0000000),Y=(Min=-32.0000000,Max=32.0000000),Z=(Min=-32.0000000,Max=32.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0100000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.3000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=150.0000000,Max=200.0000000),Y=(Min=150.0000000,Max=200.0000000),Z=(Min=150.0000000,Max=200.0000000))
	InitialParticlesPerSecond=0.7000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Effects.Smoke7'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=3.0000000,Max=3.0000000)
	StartVelocityRange=(X=(Min=-15.0000000,Max=15.0000000),Y=(Min=-15.0000000,Max=15.0000000),Z=(Min=-10.0000000,Max=0.0000000))
end object
// Reference: SpriteEmitter'BWBP_SKC_Pro.G28GasCloud_Exp.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	RespawnDeadParticles=false
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=150,G=150,B=255,A=200))
	ColorScale[1]=(RelativeTime=0.4000000,Color=(R=150,G=150,B=255,A=200))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=58,G=58,B=64,A=64))
	ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.9000000,Max=0.9000000))
	Opacity=0.5800000
	FadeOutStartTime=1.4500000
	FadeInEndTime=0.6750000
	CoordinateSystem=1
	MaxParticles=20
	StartLocationRange=(X=(Min=-64.0000000,Max=64.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0300000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	InitialParticlesPerSecond=0.7500000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke6'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.5000000,Max=2.5000000)
end object
