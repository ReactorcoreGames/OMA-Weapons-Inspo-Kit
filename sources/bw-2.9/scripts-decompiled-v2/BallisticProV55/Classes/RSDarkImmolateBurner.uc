class RSDarkImmolateBurner extends BallisticEmitter;

var Actor Victim;
var float Power;
var Controller InstigatorController;

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
	// End:0x84
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		Emitters[0].Disabled = true;
		Emitters[1].Disabled = true;
		Emitters[2].Disabled = true;
	}
	SetBase(Victim);
	// End:0xCC
	if((int(Role) == int(ROLE_Authority)) && BallisticPawn(Victim) != none)
	{
		BallisticPawn(Victim).HealBlock(Instigator, Class'BallisticProV55.RSDarkHealBlockMessage');
	}
	//return;	
}

function AddPower(float Amount)
{
	// End:0x13
	if(Power == float(-1))
	{
		return;
	}
	Power = FMin(Power + Amount, 10.0000000);
	//return;	
}

event Tick(float dt)
{
	// End:0x13
	if(Power == float(-1))
	{
		return;
	}
	Power -= dt;
	// End:0xD5
	if((((Victim == none) || Power <= float(0)) || Victim.PhysicsVolume.bWaterVolume) || (Pawn(Victim) != none) && Pawn(Victim).Health < 1)
	{
		Power = -1.0000000;
		// End:0xCD
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

simulated function Destroyed()
{
	// End:0x36
	if((int(Role) == int(ROLE_Authority)) && BallisticPawn(Victim) != none)
	{
		BallisticPawn(Victim).ReleaseHealBlock();
	}
	super(Actor).Destroyed();
	//return;	
}

event Timer()
{
	// End:0x0C
	if(bTearOff)
	{
		Destroy();
	}
	// End:0x1F
	if(Power == float(-1))
	{
		return;
	}
	// End:0xB5
	if(((Victim != none) && int(Role) == int(ROLE_Authority)) && Power > float(0))
	{
		// End:0x80
		if((Instigator == none) || Instigator.Controller == none)
		{
			Victim.SetDelayedDamageInstigatorController(InstigatorController);
		}
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victim, 10.0000000, Instigator, Location, vect(0.0000000, 0.0000000, 0.0000000), Class'BallisticProV55.DT_RSDarkImmolate');
	}
	//return;	
}

function PhysicsVolumeChange(PhysicsVolume NewVolume)
{
	// End:0x57
	if(NewVolume.bWaterVolume)
	{
		// End:0x51
		if((int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
		{
			bTearOff = true;			
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
	Power=5.0000000
	// Reference: SpriteEmitter'BallisticProV55.RSDarkImmolateBurner.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UseRandomSubdivision=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=64,B=32,A=255))
		ColorScale[1]=(RelativeTime=0.4714290,Color=(R=255,G=255,B=192,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.7000000,Max=0.7000000))
		FadeOutStartTime=0.5000000
		FadeInEndTime=0.3300000
		CoordinateSystem=1
		MaxParticles=6
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=25.0000000)
		StartLocationRange=(X=(Min=-8.0000000,Max=8.0000000),Y=(Min=-8.0000000,Max=8.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartLocationShape=1
		SphereRadiusRange=(Min=11.0000000,Max=11.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
		SizeScale[1]=(RelativeTime=0.6200000,RelativeSize=1.0000000)
		SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.9000000)
		StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=60.0000000,Max=60.0000000),Z=(Min=60.0000000,Max=60.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.BlazingSubdivide'
		TextureUSubdivisions=4
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=50.0000000,Max=50.0000000))
		StartVelocityRadialRange=(Min=-10.0000000,Max=-10.0000000)
		GetVelocityDirectionFrom=3
	end object
	Emitters[0]=SpriteEmitter0
	// Reference: SpriteEmitter'BallisticProV55.RSDarkImmolateBurner.SpriteEmitter5'
	begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=160,G=0,B=128,A=255))
		ColorScale[1]=(RelativeTime=0.6464290,Color=(R=0,G=0,B=0,A=255))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=255))
		Opacity=0.4500000
		FadeOutStartTime=1.1200000
		FadeInEndTime=0.5000000
		MaxParticles=30
		DetailMode=2
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=64.0000000)
		SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2500000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
		StartSizeRange=(X=(Min=25.0000000,Max=25.0000000),Y=(Min=25.0000000,Max=25.0000000),Z=(Min=25.0000000,Max=25.0000000))
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.NewSmoke1f'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=2.0000000,Max=2.0000000)
		StartVelocityRange=(X=(Min=-25.0000000,Max=25.0000000),Y=(Min=-25.0000000,Max=25.0000000),Z=(Min=75.0000000,Max=150.0000000))
	end object
	Emitters[1]=SpriteEmitter5
	// Reference: SpriteEmitter'BallisticProV55.RSDarkImmolateBurner.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.7000000,Max=0.7000000))
		FadeOutStartTime=0.5000000
		FadeInEndTime=0.3400000
		CoordinateSystem=1
		MaxParticles=2
		StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=20.0000000)
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=35.0000000,Max=50.0000000),Y=(Min=35.0000000,Max=50.0000000),Z=(Min=35.0000000,Max=50.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=1.0000000,Max=1.0000000)
	end object
	Emitters[2]=SpriteEmitter1
	AutoDestroy=true
	Physics=10
	RemoteRole=2
	AmbientSound=Sound'BW_Core_WeaponSound.FP7.FP7FireLoop'
	bFullVolume=true
	SoundVolume=255
	SoundRadius=128.0000000
	bNotOnDedServer=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BallisticProV55.RSDarkImmolateBurner.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UseRandomSubdivision=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=64,B=32,A=255))
	ColorScale[1]=(RelativeTime=0.4714290,Color=(R=255,G=255,B=192,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.7000000,Max=0.7000000))
	FadeOutStartTime=0.5000000
	FadeInEndTime=0.3300000
	CoordinateSystem=1
	MaxParticles=6
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=25.0000000)
	StartLocationRange=(X=(Min=-8.0000000,Max=8.0000000),Y=(Min=-8.0000000,Max=8.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartLocationShape=1
	SphereRadiusRange=(Min=11.0000000,Max=11.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.5000000)
	SizeScale[1]=(RelativeTime=0.6200000,RelativeSize=1.0000000)
	SizeScale[2]=(RelativeTime=1.0000000,RelativeSize=0.9000000)
	StartSizeRange=(X=(Min=20.0000000,Max=20.0000000),Y=(Min=60.0000000,Max=60.0000000),Z=(Min=60.0000000,Max=60.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.BlazingSubdivide'
	TextureUSubdivisions=4
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=50.0000000,Max=50.0000000))
	StartVelocityRadialRange=(Min=-10.0000000,Max=-10.0000000)
	GetVelocityDirectionFrom=3
end object
// Reference: SpriteEmitter'BallisticProV55.RSDarkImmolateBurner.SpriteEmitter5'
begin object name="SpriteEmitter5" class=Engine.SpriteEmitter
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=160,G=0,B=128,A=255))
	ColorScale[1]=(RelativeTime=0.6464290,Color=(R=0,G=0,B=0,A=255))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=0,G=0,B=0,A=255))
	Opacity=0.4500000
	FadeOutStartTime=1.1200000
	FadeInEndTime=0.5000000
	MaxParticles=30
	DetailMode=2
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=64.0000000)
	SpinsPerSecondRange=(X=(Min=0.0000000,Max=0.1000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2500000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=3.0000000)
	StartSizeRange=(X=(Min=25.0000000,Max=25.0000000),Y=(Min=25.0000000,Max=25.0000000),Z=(Min=25.0000000,Max=25.0000000))
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.NewSmoke1f'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=2.0000000,Max=2.0000000)
	StartVelocityRange=(X=(Min=-25.0000000,Max=25.0000000),Y=(Min=-25.0000000,Max=25.0000000),Z=(Min=75.0000000,Max=150.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RSDarkImmolateBurner.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.9000000,Max=0.9000000),Z=(Min=0.7000000,Max=0.7000000))
	FadeOutStartTime=0.5000000
	FadeInEndTime=0.3400000
	CoordinateSystem=1
	MaxParticles=2
	StartLocationOffset=(X=0.0000000,Y=0.0000000,Z=20.0000000)
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=35.0000000,Max=50.0000000),Y=(Min=35.0000000,Max=50.0000000),Z=(Min=35.0000000,Max=50.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB2'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=1.0000000,Max=1.0000000)
end object
