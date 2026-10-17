class RX22AGasSoak extends BW_FuelPatch;

var RX22AFireControl GasControl;

function PreBeginPlay()
{
	super(Actor).PreBeginPlay();
	Instigator = Pawn(Owner);
	//return;	
}

function Ignite(Pawn EventInstigator)
{
	local RX22AActorFire PF;

	PF = Spawn(Class'BallisticProV55.RX22AActorFire', Instigator,, Location, Rotation);
	PF.SetFuel(Fuel);
	PF.Ignitioneer = EventInstigator;
	PF.Initialize(Base);
	GasControl.PatchReplace(self, PF);
	PF.GasControl = GasControl;
	Destroy();
	//return;	
}

function TakeDamage(int Damage, Pawn EventInstigator, Vector HitLocation, Vector Momentum, Class<DamageType> DamageType)
{
	Ignite(EventInstigator);
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
	Fuel=5.0000000
	// Reference: SpriteEmitter'BallisticProV55.RX22AGasSoak.SpriteEmitter6'
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
		Opacity=0.5200000
		FadeOutStartTime=1.2200000
		FadeInEndTime=0.7800000
		CoordinateSystem=1
		MaxParticles=4
		StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-30.0000000,Max=30.0000000))
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=40.0000000,Max=40.0000000),Z=(Min=40.0000000,Max=40.0000000))
		DrawStyle=5
		Texture=Texture'BW_Core_WeaponTex.Particles.Smoke3'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
	end object
	Emitters[0]=SpriteEmitter6
	// Reference: SpriteEmitter'BallisticProV55.RX22AGasSoak.SpriteEmitter7'
	begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
		ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		Acceleration=(X=0.0000000,Y=0.0000000,Z=10.0000000)
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.2000000,Max=0.2000000))
		Opacity=0.4100000
		FadeOutStartTime=0.5400000
		FadeInEndTime=0.5400000
		CoordinateSystem=1
		MaxParticles=4
		StartLocationOffset=(X=4.0000000,Y=0.0000000,Z=0.0000000)
		StartLocationRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-20.0000000,Max=15.0000000))
		SphereRadiusRange=(Min=40.0000000,Max=40.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=30.0000000,Max=40.0000000),Y=(Min=30.0000000,Max=40.0000000),Z=(Min=30.0000000,Max=40.0000000))
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.DirtSprayAlpha'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.5000000,Max=1.5000000)
		StartVelocityRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=-1.0000000,Max=1.0000000),Z=(Min=-20.0000000,Max=-20.0000000))
		StartVelocityRadialRange=(Min=15.0000000,Max=15.0000000)
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
// Reference: SpriteEmitter'BallisticProV55.RX22AGasSoak.SpriteEmitter6'
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
	Opacity=0.5200000
	FadeOutStartTime=1.2200000
	FadeInEndTime=0.7800000
	CoordinateSystem=1
	MaxParticles=4
	StartLocationOffset=(X=10.0000000,Y=0.0000000,Z=0.0000000)
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-30.0000000,Max=30.0000000))
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.0500000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.7000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=40.0000000,Max=40.0000000),Y=(Min=40.0000000,Max=40.0000000),Z=(Min=40.0000000,Max=40.0000000))
	DrawStyle=5
	Texture=Texture'BW_Core_WeaponTex.Particles.Smoke3'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=-5.0000000,Max=5.0000000),Y=(Min=-5.0000000,Max=5.0000000),Z=(Min=-5.0000000,Max=5.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RX22AGasSoak.SpriteEmitter7'
begin object name="SpriteEmitter7" class=Engine.SpriteEmitter
	ProjectionNormal=(X=1.0000000,Y=0.0000000,Z=0.0000000)
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	Acceleration=(X=0.0000000,Y=0.0000000,Z=10.0000000)
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=0.4000000,Max=0.4000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.2000000,Max=0.2000000))
	Opacity=0.4100000
	FadeOutStartTime=0.5400000
	FadeInEndTime=0.5400000
	CoordinateSystem=1
	MaxParticles=4
	StartLocationOffset=(X=4.0000000,Y=0.0000000,Z=0.0000000)
	StartLocationRange=(X=(Min=-10.0000000,Max=10.0000000),Y=(Min=-20.0000000,Max=20.0000000),Z=(Min=-20.0000000,Max=15.0000000))
	SphereRadiusRange=(Min=40.0000000,Max=40.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=1.0000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=30.0000000,Max=40.0000000),Y=(Min=30.0000000,Max=40.0000000),Z=(Min=30.0000000,Max=40.0000000))
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.DirtSprayAlpha'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.5000000,Max=1.5000000)
	StartVelocityRange=(X=(Min=-1.0000000,Max=1.0000000),Y=(Min=-1.0000000,Max=1.0000000),Z=(Min=-20.0000000,Max=-20.0000000))
	StartVelocityRadialRange=(Min=15.0000000,Max=15.0000000)
end object
