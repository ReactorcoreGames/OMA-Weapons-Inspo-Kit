class RSDarkPlasmaBurner extends BallisticEmitter;

var Actor Victim;
var float Power;
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
	SetTimer(1.0000000, true);
	// End:0x60
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		Emitters[0].Disabled = true;
		Emitters[1].Disabled = true;
	}
	SetBase(Victim);
	// End:0xA8
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
	// End:0x96
	if((((Victim == none) || Power <= float(0)) || Victim.PhysicsVolume.bWaterVolume) || (Pawn(Victim) != none) && Pawn(Victim).Health < 1)
	{
		Power = -1.0000000;
		Kill();
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

simulated event Timer()
{
	// End:0x13
	if(Power == float(-1))
	{
		return;
	}
	// End:0xA9
	if(((Victim != none) && int(Role) == int(ROLE_Authority)) && Power > float(0))
	{
		// End:0x74
		if((Instigator == none) || Instigator.Controller == none)
		{
			Victim.SetDelayedDamageInstigatorController(InstigatorController);
		}
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victim, 3.0000000, Instigator, Location, vect(0.0000000, 0.0000000, 0.0000000), Class'BallisticProV55.DT_RSDarkImmolate');
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
	Power=2.0000000
	// Reference: SpriteEmitter'BallisticProV55.RSDarkPlasmaBurner.SpriteEmitter4'
	begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
		UseDirectionAs=1
		UseColorScale=true
		FadeOut=true
		FadeIn=true
		UseSizeScale=true
		UseRegularSizeScale=false
		BlendBetweenSubdivisions=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=0.3000000,Color=(R=128,G=0,B=128,A=255))
		ColorScale[2]=(RelativeTime=0.5500000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=128,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=1.0000000),Z=(Min=0.8000000,Max=1.0000000))
		Opacity=0.6500000
		FadeOutStartTime=0.3975000
		FadeInEndTime=0.1350000
		CoordinateSystem=1
		MaxParticles=15
		StartLocationOffset=(X=-3.0000000,Y=0.0000000,Z=16.0000000)
		StartLocationShape=1
		SphereRadiusRange=(Min=-16.0000000,Max=16.0000000)
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.8000000)
		SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
		StartSizeRange=(X=(Min=15.0000000,Max=15.0000000),Y=(Min=35.0000000,Max=65.0000000),Z=(Min=50.0000000,Max=50.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.BlazingSubdivide'
		TextureUSubdivisions=4
		TextureVSubdivisions=2
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.7500000,Max=0.7500000)
		StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=75.0000000))
	end object
	Emitters[0]=SpriteEmitter4
	// Reference: SpriteEmitter'BallisticProV55.RSDarkPlasmaBurner.SpriteEmitter5'
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
	// Reference: SpriteEmitter'BallisticProV55.RSDarkPlasmaBurner.SpriteEmitter6'
	begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
		FadeOut=true
		FadeIn=true
		SpinParticles=true
		UniformSize=true
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.7500000),Z=(Min=0.7500000,Max=1.0000000))
		FadeOutStartTime=0.1350000
		FadeInEndTime=0.0500000
		CoordinateSystem=1
		MaxParticles=3
		StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-25.0000000,Max=40.0000000))
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		StartSizeRange=(X=(Min=25.0000000,Max=55.0000000),Y=(Min=25.0000000,Max=55.0000000),Z=(Min=25.0000000,Max=55.0000000))
		Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
		SecondsBeforeInactive=0.0000000
		LifetimeRange=(Min=0.5000000,Max=0.5000000)
	end object
	Emitters[2]=SpriteEmitter6
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
// Reference: SpriteEmitter'BallisticProV55.RSDarkPlasmaBurner.SpriteEmitter4'
begin object name="SpriteEmitter4" class=Engine.SpriteEmitter
	UseDirectionAs=1
	UseColorScale=true
	FadeOut=true
	FadeIn=true
	UseSizeScale=true
	UseRegularSizeScale=false
	BlendBetweenSubdivisions=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=0.3000000,Color=(R=128,G=0,B=128,A=255))
	ColorScale[2]=(RelativeTime=0.5500000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[3]=(RelativeTime=1.0000000,Color=(R=255,G=0,B=128,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.5000000,Max=1.0000000),Z=(Min=0.8000000,Max=1.0000000))
	Opacity=0.6500000
	FadeOutStartTime=0.3975000
	FadeInEndTime=0.1350000
	CoordinateSystem=1
	MaxParticles=15
	StartLocationOffset=(X=-3.0000000,Y=0.0000000,Z=16.0000000)
	StartLocationShape=1
	SphereRadiusRange=(Min=-16.0000000,Max=16.0000000)
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.8000000)
	SizeScale[1]=(RelativeTime=1.0000000,RelativeSize=1.5000000)
	StartSizeRange=(X=(Min=15.0000000,Max=15.0000000),Y=(Min=35.0000000,Max=65.0000000),Z=(Min=50.0000000,Max=50.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.BlazingSubdivide'
	TextureUSubdivisions=4
	TextureVSubdivisions=2
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.7500000,Max=0.7500000)
	StartVelocityRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=75.0000000))
end object
// Reference: SpriteEmitter'BallisticProV55.RSDarkPlasmaBurner.SpriteEmitter5'
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
// Reference: SpriteEmitter'BallisticProV55.RSDarkPlasmaBurner.SpriteEmitter6'
begin object name="SpriteEmitter6" class=Engine.SpriteEmitter
	FadeOut=true
	FadeIn=true
	SpinParticles=true
	UniformSize=true
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.7500000),Z=(Min=0.7500000,Max=1.0000000))
	FadeOutStartTime=0.1350000
	FadeInEndTime=0.0500000
	CoordinateSystem=1
	MaxParticles=3
	StartLocationRange=(X=(Min=0.0000000,Max=0.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=-25.0000000,Max=40.0000000))
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	StartSizeRange=(X=(Min=25.0000000,Max=55.0000000),Y=(Min=25.0000000,Max=55.0000000),Z=(Min=25.0000000,Max=55.0000000))
	Texture=Texture'BW_Core_WeaponTex.Particles.FlareB1'
	SecondsBeforeInactive=0.0000000
	LifetimeRange=(Min=0.5000000,Max=0.5000000)
end object
