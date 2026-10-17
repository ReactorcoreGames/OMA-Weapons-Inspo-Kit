class RX22AActorFire extends BW_FuelPatch;

var Actor Victim;
var() Class<DamageType> DamageType;
var() int Damage;
var Controller InstigatorController;
var bool DeadMode;
var RX22AFireControl GasControl;
var Pawn Ignitioneer;
var Actor MyAmbientSoundActor;

replication
{
	// Pos:0x000
	reliable if(int(Role) == int(ROLE_Authority))
		Victim;
}

simulated event PostNetBeginPlay()
{
	super(Actor).PostNetBeginPlay();
	// End:0x2E
	if((int(Role) < int(ROLE_Authority)) && Victim != none)
	{
		Initialize(Victim);
	}
	//return;	
}

function PreBeginPlay()
{
	super(Actor).PreBeginPlay();
	Instigator = Pawn(Owner);
	// End:0x35
	if(Instigator != none)
	{
		InstigatorController = Instigator.Controller;
	}
	//return;	
}

simulated event Destroyed()
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

simulated function Initialize(Actor V)
{
	// End:0x0D
	if(V == none)
	{
		return;
	}
	Victim = V;
	SetTimer(0.5000000, true);
	Emitters[0].SkeletalMeshActor = Victim;
	Emitters[1].SkeletalMeshActor = Victim;
	SetLocation(Victim.Location - (vect(0.0000000, 0.0000000, 1.0000000) * Victim.CollisionHeight));
	SetRotation(Victim.Rotation + rot(0, -16384, 0));
	SetBase(Victim);
	// End:0xE5
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		MyAmbientSoundActor = Spawn(Class'BallisticProV55.RX22ABurnerSound',,, Location);
		MyAmbientSoundActor.SetBase(Victim);
	}
	//return;	
}

simulated function FuelOut()
{
	super.FuelOut();
	bDynamicLight = false;
	//return;	
}

simulated event Timer()
{
	// End:0x2E
	if((Victim != none) && Victim.PhysicsVolume.bWaterVolume)
	{
		FuelOut();
	}
	// End:0xD0
	if((int(Level.NetMode) != int(NM_Client)) && Fuel > float(0))
	{
		// End:0xAF
		if((Victim != none) && !DeadMode)
		{
			BurnRadius(4.0000000 + ((Fuel / float(30)) * float(Damage)), 80.0000000, DamageType, 0.0000000, Victim.Location);			
		}
		else
		{
			BurnRadius(float(Damage), 80.0000000, DamageType, 0.0000000, Location);
		}
	}
	super.Timer();
	//return;	
}

simulated function BurnRadius(float DamageAmount, float DamageRadius, Class<DamageType> DamageType, float Momentum, Vector HitLocation)
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
	// End:0x1C0
	foreach VisibleCollidingActors(Class'Engine.Actor', Victims, DamageRadius, HitLocation)
	{
		// End:0x1BF
		if(((Victims != self) && int(Victims.Role) == int(ROLE_Authority)) && !Victims.IsA('FluidSurfaceInfo'))
		{
			// End:0x95
			if((Ignitioneer != none) && Victims == Instigator)
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
			// End:0x146
			if((Instigator == none) || Instigator.Controller == none)
			{
				Victims.SetDelayedDamageInstigatorController(InstigatorController);
			}
			Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victims, damageScale * DamageAmount, instigatedBy, Victims.Location - ((0.5000000 * (Victims.CollisionHeight + Victims.CollisionRadius)) * Dir), (damageScale * Momentum) * Dir, DamageType);
		}		
	}	
	bHurtEntry = false;
	//return;	
}

simulated event Tick(float dt)
{
	super(Actor).Tick(dt);
	// End:0xBA
	if((Victim == none) || Victim.bDeleteMe)
	{
		Emitters[0].SkeletalMeshActor = none;
		Emitters[0].UseSkeletalLocationAs = 0;
		Emitters[1].SkeletalMeshActor = none;
		Emitters[1].UseSkeletalLocationAs = 0;
		// End:0x8A
		if(int(Role) == int(ROLE_Authority))
		{
			Destroy();			
		}
		else
		{
			Emitters[0].Disabled = true;
			Emitters[1].Disabled = true;
			bHidden = true;
		}
		return;
	}
	// End:0xF1
	if(bHidden)
	{
		Emitters[0].Disabled = false;
		Emitters[1].Disabled = false;
		bHidden = false;
	}
	// End:0x100
	if(Fuel < float(1))
	{
		return;
	}
	// End:0x2F8
	if(int(Victim.Physics) == int(14))
	{
		// End:0x2B4
		if(!DeadMode)
		{
			SetBase(none);
			DeadMode = true;
			Emitters[0].SkeletalMeshActor = none;
			Emitters[0].UseSkeletalLocationAs = 0;
			Emitters[1].SkeletalMeshActor = none;
			Emitters[1].UseSkeletalLocationAs = 0;
			Emitters[0].StartLocationRange.X.Min = -30.0000000;
			Emitters[0].StartLocationRange.X.Max = 30.0000000;
			Emitters[0].StartLocationRange.Y = Emitters[0].StartLocationRange.X;
			Emitters[0].StartLocationRange.Z.Max = 16.0000000;
			Emitters[1].StartLocationRange.X = Emitters[0].StartLocationRange.X;
			Emitters[1].StartLocationRange.Y = Emitters[1].StartLocationRange.X;
			Emitters[2].StartLocationRange.Z.Max = 10.0000000;
			Emitters[2].StartLocationOffset.Z = 0.0000000;
			Emitters[4].StartLocationOffset.Z = 16.0000000;
		}
		SetLocation(Victim.GetBoneCoords('spine').Origin);
		SetRotation(rot(0, 1, 0) * float(Victim.Rotation.Yaw));
	}
	// End:0x35A
	if((xPawn(Victim) != none) && xPawn(Victim).bDeRes)
	{
		Emitters[0].SkeletalMeshActor = none;
		Emitters[1].SkeletalMeshActor = none;
		SetBase(none);
		Fuel = 0.0000000;
		Kill();
	}
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
	DamageType=Class'BallisticProV55.DTRX22AImmolation'
	Damage=3
	Fuel=4.0000000
	MaxFuel=4.0000000
	bCanIgnite=false
	// Reference: SpriteEmitter'BallisticProV55.RX22AActorFire.SpriteEmitter11'
	begin object name="SpriteEmitter11" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UniformSize=true
		BlendBetweenSubdivisions=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=30.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=64,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.4142860,Color=(R=255,G=255,B=255,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=192,B=128,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.7000000,Max=0.7000000))
		FadeOutStartTime=0.5040000
		FadeInEndTime=0.2160000
		CoordinateSystem=1
		MaxParticles=30
		StartLocationRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=0.0000000,Max=30.0000000))
		StartSpinRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=15.0000000,Max=15.0000000),Y=(Min=15.0000000,Max=15.0000000),Z=(Min=15.0000000,Max=15.0000000))
		UseSkeletalLocationAs=2
		SkeletalScale=(X=0.3800000,Y=0.3800000,Z=0.3800000)
		RelativeBoneIndexRange=(Min=0.7000000,Max=1.0000000)
		Texture=Texture'BW_Core_WeaponTex.Particles.BlazingSubdivide'
		TextureUSubdivisions=4
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.8000000,Max=0.8000000)
	end object
	Emitters[0]=SpriteEmitter11
	// Reference: SpriteEmitter'BallisticProV55.RX22AActorFire.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UniformSize=true
		BlendBetweenSubdivisions=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=40.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=64,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.4285710,Color=(R=255,G=255,B=255,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=192,B=128,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.7000000,Max=0.7000000))
		FadeOutStartTime=0.5040000
		FadeInEndTime=0.2080000
		CoordinateSystem=1
		MaxParticles=40
		StartLocationRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=15.0000000,Max=15.0000000),Y=(Min=15.0000000,Max=15.0000000),Z=(Min=15.0000000,Max=15.0000000))
		UseSkeletalLocationAs=2
		SkeletalScale=(X=0.3800000,Y=0.3800000,Z=0.3800000)
		RelativeBoneIndexRange=(Min=0.0000000,Max=0.7000000)
		Texture=Texture'BW_Core_WeaponTex.Particles.BlazingSubdivide'
		TextureUSubdivisions=4
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.8000000,Max=0.8000000)
	end object
	Emitters[1]=SpriteEmitter0
	// Reference: SpriteEmitter'BallisticProV55.RX22AActorFire.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		Disabled=true
		SpinParticles=true
		UniformSize=true
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=80.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=64,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.4000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=64,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.6000000,Max=0.6000000))
		FadeOutStartTime=0.5040000
		FadeInEndTime=0.1890000
		CoordinateSystem=1
		MaxParticles=50
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=20.0000000)
		StartLocationRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=0.0000000,Max=40.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=1.0000000,Max=15.0000000),Y=(Min=1.0000000,Max=15.0000000),Z=(Min=1.0000000,Max=15.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlameParts'
		TextureUSubdivisions=4
		TextureVSubdivisions=4
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.7000000,Max=0.7000000)
		StartVelocityRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=0.0000000,Max=40.0000000))
	end object
	Emitters[2]=SpriteEmitter1
	// Reference: SpriteEmitter'BallisticProV55.RX22AActorFire.SpriteEmitter6'
	begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		Acceleration=(X=-20.0000000,Y=0.0000000,Z=0.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.1000000,Max=0.1000000),Z=(Min=0.1000000,Max=0.1000000))
		Opacity=0.6300000
		FadeOutStartTime=1.5300000
		FadeInEndTime=0.3000000
		MaxParticles=40
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=110.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=1.2000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
		StartSizeRange=(X=(Min=30.0000000,Max=30.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=30.0000000,Max=30.0000000))
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke4'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=3.0000000,Max=3.0000000)
		StartVelocityRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=140.0000000,Max=180.0000000))
		VelocityLossRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.7000000,Max=0.7000000))
	end object
	Emitters[3]=SpriteEmitter6
	// Reference: SpriteEmitter'BallisticProV55.RX22AActorFire.SpriteEmitter3'
	begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		UniformSize=true
		UseRandomSubdivision=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=60.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.5000000,Max=0.5000000))
		Opacity=0.7400000
		FadeOutStartTime=0.1400000
		FadeInEndTime=0.1400000
		CoordinateSystem=1
		MaxParticles=2
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=50.0000000)
		StartLocationRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-20.0000000,Max=20.0000000))
		StartSizeRange=(X=(Min=80.0000000,Max=110.0000000),Y=(Min=80.0000000,Max=110.0000000),Z=(Min=80.0000000,Max=110.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.2500000,Max=0.5000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=20.0000000))
	end object
	Emitters[4]=SpriteEmitter3
	AutoDestroy=true
	LightType=4
	LightEffect=21
	LightHue=25
	LightSaturation=100
	LightBrightness=200.0000000
	LightRadius=15.0000000
	bDynamicLight=true
	RemoteRole=2
	bHardAttach=true
	bNotOnDedServer=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.RX22AActorFire.SpriteEmitter11'
begin object name="SpriteEmitter11" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UniformSize=true
	BlendBetweenSubdivisions=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=30.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=64,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.4142860,Color=(R=255,G=255,B=255,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=192,B=128,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.7000000,Max=0.7000000))
	FadeOutStartTime=0.5040000
	FadeInEndTime=0.2160000
	CoordinateSystem=1
	MaxParticles=30
	StartLocationRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=0.0000000,Max=30.0000000))
	StartSpinRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=15.0000000,Max=15.0000000),Y=(Min=15.0000000,Max=15.0000000),Z=(Min=15.0000000,Max=15.0000000))
	UseSkeletalLocationAs=2
	SkeletalScale=(X=0.3800000,Y=0.3800000,Z=0.3800000)
	RelativeBoneIndexRange=(Min=0.7000000,Max=1.0000000)
	Texture=Texture'BW_Core_WeaponTex.Particles.BlazingSubdivide'
	TextureUSubdivisions=4
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.8000000,Max=0.8000000)
end object
// Reference: SpriteEmitter'BallisticProV55.RX22AActorFire.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UniformSize=true
	BlendBetweenSubdivisions=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=40.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=64,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.4285710,Color=(R=255,G=255,B=255,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=192,B=128,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.7000000,Max=0.7000000))
	FadeOutStartTime=0.5040000
	FadeInEndTime=0.2080000
	CoordinateSystem=1
	MaxParticles=40
	StartLocationRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=15.0000000,Max=15.0000000),Y=(Min=15.0000000,Max=15.0000000),Z=(Min=15.0000000,Max=15.0000000))
	UseSkeletalLocationAs=2
	SkeletalScale=(X=0.3800000,Y=0.3800000,Z=0.3800000)
	RelativeBoneIndexRange=(Min=0.0000000,Max=0.7000000)
	Texture=Texture'BW_Core_WeaponTex.Particles.BlazingSubdivide'
	TextureUSubdivisions=4
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.8000000,Max=0.8000000)
end object
// Reference: SpriteEmitter'BallisticProV55.RX22AActorFire.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	Disabled=true
	SpinParticles=true
	UniformSize=true
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=80.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=0,G=64,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.4000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=128,B=64,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.6000000,Max=0.6000000))
	FadeOutStartTime=0.5040000
	FadeInEndTime=0.1890000
	CoordinateSystem=1
	MaxParticles=50
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=20.0000000)
	StartLocationRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=0.0000000,Max=40.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.2000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=1.0000000,Max=15.0000000),Y=(Min=1.0000000,Max=15.0000000),Z=(Min=1.0000000,Max=15.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlameParts'
	TextureUSubdivisions=4
	TextureVSubdivisions=4
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.7000000,Max=0.7000000)
	StartVelocityRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=0.0000000,Max=40.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RX22AActorFire.SpriteEmitter6'
begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	Acceleration=(X=-20.0000000,Y=0.0000000,Z=0.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.1000000,Max=0.1000000),Y=(Min=0.1000000,Max=0.1000000),Z=(Min=0.1000000,Max=0.1000000))
	Opacity=0.6300000
	FadeOutStartTime=1.5300000
	FadeInEndTime=0.3000000
	MaxParticles=40
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=110.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=0.3700000,RelativeSize=1.2000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
	StartSizeRange=(X=(Min=30.0000000,Max=30.0000000),Y=(Min=30.0000000,Max=30.0000000),Z=(Min=30.0000000,Max=30.0000000))
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke4'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=3.0000000,Max=3.0000000)
	StartVelocityRange=(X=(Min=-20.0000000,Max=20.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=140.0000000,Max=180.0000000))
	VelocityLossRange=(X=(Min=0.2000000,Max=0.2000000),Y=(Min=0.2000000,Max=0.2000000),Z=(Min=0.7000000,Max=0.7000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RX22AActorFire.SpriteEmitter3'
begin object name="SpriteEmitter3" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	UniformSize=true
	UseRandomSubdivision=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=60.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.8000000,Max=0.8000000),Z=(Min=0.5000000,Max=0.5000000))
	Opacity=0.7400000
	FadeOutStartTime=0.1400000
	FadeInEndTime=0.1400000
	CoordinateSystem=1
	MaxParticles=2
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=50.0000000)
	StartLocationRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-20.0000000,Max=20.0000000))
	StartSizeRange=(X=(Min=80.0000000,Max=110.0000000),Y=(Min=80.0000000,Max=110.0000000),Z=(Min=80.0000000,Max=110.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.2500000,Max=0.5000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=20.0000000))
end object
