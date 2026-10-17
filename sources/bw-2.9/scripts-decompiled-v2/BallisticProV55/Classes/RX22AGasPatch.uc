class RX22AGasPatch extends BW_FuelPatch;

var RX22AFireControl GasControl;
var bool bPendingIgnite;
var Pawn Ignitioneer;
var Controller InstigatorController;

simulated function Ignite(Pawn EventInstigator)
{
	local RX22ASurfaceFire Temp;

	// End:0x12
	if(int(Role) != int(ROLE_Authority))
	{
		return;
	}
	bIgnited = true;
	bPendingIgnite = false;
	Temp = Spawn(Class'BallisticProV55.RX22ASurfaceFire', Instigator,, Location + (Vector(Rotation) * float(32)), Rotation);
	// End:0x87
	if((InstigatorController == none) && Instigator != none)
	{
		Temp.InstigatorController = Instigator.Controller;		
	}
	else
	{
		Temp.InstigatorController = InstigatorController;
	}
	Temp.Ignitioneer = Ignitioneer;
	Temp.PlayIgnite();
	Temp.SetFuel(Fuel);
	Temp.GasControl = GasControl;
	Temp.SetBase(Base);
	GasControl.PatchReplace(self, Temp);
	Destroy();
	//return;	
}

function TakeDamage(int Damage, Pawn EventInstigator, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	// End:0x2D
	if((Class<BallisticDamageType>(DamageType) != none) && !Class<BallisticDamageType>(DamageType).default.bIgniteFires)
	{
		return;
	}
	Ignitioneer = EventInstigator;
	SetTimer(0.1000000, false);
	bPendingIgnite = true;
	//return;	
}

simulated event PostBeginPlay()
{
	super.PostBeginPlay();
	Emitters[0].StartLocationOffset = Vector(Rotation) * float(10);
	// End:0x4C
	if((Instigator == none) && Owner != none)
	{
		Instigator = Pawn(Owner);
	}
	// End:0x6B
	if(Instigator != none)
	{
		InstigatorController = Instigator.Controller;
	}
	//return;	
}

singular simulated event BaseChange()
{
	// End:0x13
	if(Mover(Base) != none)
	{
		Destroy();
	}
	//return;	
}

event Timer()
{
	local int i;

	// End:0x0B
	if(bIgnited)
	{
		return;
	}
	// End:0x1B
	if(bPendingIgnite)
	{
		Ignite(none);
	}
	i = 0;
	J0x22:

	// End:0xA3 [Loop If]
	if(i < Touching.Length)
	{
		// End:0x5E
		if((Touching[i] == none) || Pawn(Touching[i]) == none)
		{
			// [Explicit Continue]
			goto J0x99;
		}
		// End:0x8D
		if(GasControl != none)
		{
			GasControl.SpraySoak(Touching[i], Instigator, 0.5000000);
		}
		Fuel -= 0.5000000;
		J0x99:

		i++;
		// [Loop Continue]
		goto J0x22;
	}
	super.Timer();
	//return;	
}

simulated function Destroyed()
{
	// End:0x28
	if(!bIgnited && GasControl != none)
	{
		GasControl.PatchRemove(self);
	}
	super(Actor).Destroyed();
	//return;	
}

defaultproperties
{
	Fuel=20.0000000
	// Reference: SpriteEmitter'BallisticProV55.RX22AGasPatch.SpriteEmitter20'
	begin object name="SpriteEmitter20" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		Acceleration=(X=0.0000000,Y=0.0000000,Z=10.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.6000000,Max=0.6000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.8000000,Max=0.8000000))
		Opacity=0.8000000
		FadeOutStartTime=0.9200000
		FadeInEndTime=0.7800000
		MaxParticles=2
		StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=40.0000000,Max=60.0000000),Y=(Min=40.0000000,Max=60.0000000),Z=(Min=40.0000000,Max=60.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=5
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke5'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.6000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
	end object
	Emitters[0]=SpriteEmitter20
	// Reference: SpriteEmitter'BallisticProV55.RX22AGasPatch.SpriteEmitter21'
	begin object name="SpriteEmitter21" class=Engine.SpriteEmitter
		UseDirectionAs=4
		ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.6000000,Max=0.6000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.8000000,Max=0.8000000))
		Opacity=0.4400000
		FadeOutStartTime=0.5000000
		CoordinateSystem=1
		MaxParticles=1
		StartLocationOffset=(X=4.0000000,Y=0.0000000,Z=0.0000000)
		StartSizeRange=(X=(Min=55.0000000,Max=55.0000000),Y=(Min=55.0000000,Max=55.0000000),Z=(Min=55.0000000,Max=55.0000000))
		InitialParticlesPerSecond=50000.0000000
		DrawStyle=5
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke5'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[1]=SpriteEmitter21
	bNetInitialRotation=true
	RemoteRole=2
	bCanBeDamaged=true
	CollisionRadius=72.0000000
	CollisionHeight=72.0000000
	bCollideActors=true
	bUseCylinderCollision=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.RX22AGasPatch.SpriteEmitter20'
begin object name="SpriteEmitter20" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	Acceleration=(X=0.0000000,Y=0.0000000,Z=10.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.6000000,Max=0.6000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.8000000,Max=0.8000000))
	Opacity=0.8000000
	FadeOutStartTime=0.9200000
	FadeInEndTime=0.7800000
	MaxParticles=2
	StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=40.0000000,Max=60.0000000),Y=(Min=40.0000000,Max=60.0000000),Z=(Min=40.0000000,Max=60.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=5
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke5'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.6000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RX22AGasPatch.SpriteEmitter21'
begin object name="SpriteEmitter21" class=Engine.SpriteEmitter
	UseDirectionAs=4
	ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.6000000,Max=0.6000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.8000000,Max=0.8000000))
	Opacity=0.4400000
	FadeOutStartTime=0.5000000
	CoordinateSystem=1
	MaxParticles=1
	StartLocationOffset=(X=4.0000000,Y=0.0000000,Z=0.0000000)
	StartSizeRange=(X=(Min=55.0000000,Max=55.0000000),Y=(Min=55.0000000,Max=55.0000000),Z=(Min=55.0000000,Max=55.0000000))
	InitialParticlesPerSecond=50000.0000000
	DrawStyle=5
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke5'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
