class RX22AGasCloud extends BW_FuelPatch;

var RX22AFireControl GasControl;
var() Sound IgniteSound;
var Pawn Ignitioneer;

simulated function FuelChanged()
{
	Emitters[0].Opacity = FClamp(Fuel / MaxFuel, 0.1500000, 0.7500000) * 1.3330000;
	Emitters[1].Opacity = FClamp(Fuel / MaxFuel, 0.1500000, 0.7500000) * 1.3330000;
	//return;	
}

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
	// End:0x65
	if(int(Level.NetMode) != int(NM_DedicatedServer))
	{
		Bang = Spawn(Class'BallisticProV55.RX22ACloudBang',,, Location);
		Bang.InitCloudBang(Fuel / MaxFuel);
		PlaySound(IgniteSound,, 0.8000000,, 112.0000000);
	}
	// End:0xB9
	if(int(Role) == int(ROLE_Authority))
	{
		Ignitioneer = EventInstigator;
		HurtRadius(25.0000000 + (Fuel * float(5)), 128.0000000 + (Fuel * float(3)), Class'BallisticProV55.DTRX22ACloudBomb', 10000.0000000, Location);
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

simulated event PostBeginPlay()
{
	SetTimer(0.5000000, true);
	super.PostBeginPlay();
	// End:0x37
	if((Instigator == none) && Owner != none)
	{
		Instigator = Pawn(Owner);
	}
	//return;	
}

simulated event Timer()
{
	local int i;

	// End:0x0E
	if(bIgnited)
	{
		Destroy();
		return;
	}
	i = 0;
	J0x15:

	// End:0x8F [Loop If]
	if(i < Touching.Length)
	{
		// End:0x51
		if((Touching[i] == none) || Pawn(Touching[i]) == none)
		{
			// [Explicit Continue]
			goto J0x85;
		}
		// End:0x7B
		if(GasControl != none)
		{
			GasControl.SpraySoak(Touching[i], Instigator);
		}
		Fuel -= float(1);
		J0x85:

		i++;
		// [Loop Continue]
		goto J0x15;
	}
	super.Timer();
	//return;	
}

simulated function Destroyed()
{
	// End:0x1B
	if(GasControl != none)
	{
		GasControl.PatchRemove(self);
	}
	super(Actor).Destroyed();
	//return;	
}

defaultproperties
{
	IgniteSound=Sound'BW_Core_WeaponSound.RX22A.RX22A-IgniteFire'
	Extent=128
	// Reference: SpriteEmitter'BallisticProV55.RX22AGasCloud.SpriteEmitter6'
	begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=5.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.6000000,Max=0.6000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.8000000,Max=0.8000000))
		Opacity=0.6200000
		FadeOutStartTime=1.2200000
		FadeInEndTime=0.5800000
		MaxParticles=2
		StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		DrawStyle=5
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
	end object
	Emitters[0]=SpriteEmitter6
	// Reference: SpriteEmitter'BallisticProV55.RX22AGasCloud.SpriteEmitter7'
	begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
		ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=5.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.6000000,Max=0.6000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.8000000,Max=0.8000000))
		Opacity=0.5600000
		FadeOutStartTime=1.7400000
		FadeInEndTime=1.0800000
		CoordinateSystem=1
		MaxParticles=4
		StartLocationOffset=(X=4.0000000,Y=0.0000000,Z=0.0000000)
		StartLocationShape=1
		SphereRadiusRange=(Min=40.0000000,Max=40.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=70.0000000,Max=90.0000000),Y=(Min=70.0000000,Max=90.0000000),Z=(Min=70.0000000,Max=90.0000000))
		DrawStyle=5
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke5'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=3.0000000,Max=3.0000000)
		StartVelocityRadialRange=(Min=15.0000000,Max=15.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[1]=SpriteEmitter7
	RemoteRole=2
	bCanBeDamaged=true
	CollisionRadius=128.0000000
	CollisionHeight=128.0000000
	bCollideActors=true
	bUseCylinderCollision=true
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.RX22AGasCloud.SpriteEmitter6'
begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=5.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.6000000,Max=0.6000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.8000000,Max=0.8000000))
	Opacity=0.6200000
	FadeOutStartTime=1.2200000
	FadeInEndTime=0.5800000
	MaxParticles=2
	StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	DrawStyle=5
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-10.0000000,Max=10.0000000),Z=(Min=-10.0000000,Max=10.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RX22AGasCloud.SpriteEmitter7'
begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
	ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=5.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.6000000,Max=0.6000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.8000000,Max=0.8000000))
	Opacity=0.5600000
	FadeOutStartTime=1.7400000
	FadeInEndTime=1.0800000
	CoordinateSystem=1
	MaxParticles=4
	StartLocationOffset=(X=4.0000000,Y=0.0000000,Z=0.0000000)
	StartLocationShape=1
	SphereRadiusRange=(Min=40.0000000,Max=40.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=70.0000000,Max=90.0000000),Y=(Min=70.0000000,Max=90.0000000),Z=(Min=70.0000000,Max=90.0000000))
	DrawStyle=5
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke5'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=3.0000000,Max=3.0000000)
	StartVelocityRadialRange=(Min=15.0000000,Max=15.0000000)
	GetVelocityDirectionFrom=3
end object
