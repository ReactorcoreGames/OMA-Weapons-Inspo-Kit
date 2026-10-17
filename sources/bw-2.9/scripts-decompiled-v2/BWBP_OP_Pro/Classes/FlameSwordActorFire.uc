class FlameSwordActorFire extends BallisticEmitter;

var Actor Victim;
var float Fuel;
var float MaxFuel;
var float Damage;
var Controller InstigatorController;
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
	// End:0xAC
	if(int(Level.NetMode) == int(NM_DedicatedServer))
	{
		Emitters[0].Disabled = true;
		Emitters[1].Disabled = true;
		Emitters[2].Disabled = true;
		Emitters[3].Disabled = true;
		Emitters[4].Disabled = true;
	}
	SetBase(Victim);
	//return;	
}

function AddFuel(float Amount)
{
	// End:0x13
	if(Fuel == float(-1))
	{
		return;
	}
	Fuel = FMin(Fuel + Amount, MaxFuel);
	//return;	
}

event Tick(float dt)
{
	// End:0x13
	if(Fuel == float(-1))
	{
		return;
	}
	Fuel -= dt;
	// End:0xD5
	if((((Victim == none) || Fuel <= float(0)) || Victim.PhysicsVolume.bWaterVolume) || (Pawn(Victim) != none) && Pawn(Victim).Health < 1)
	{
		Fuel = -1.0000000;
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

event Timer()
{
	// End:0x0C
	if(bTearOff)
	{
		Destroy();
	}
	// End:0x1F
	if(Fuel == float(-1))
	{
		return;
	}
	// End:0xB5
	if(((Victim != none) && int(Role) == int(ROLE_Authority)) && Fuel > float(0))
	{
		// End:0x80
		if((Instigator == none) || Instigator.Controller == none)
		{
			Victim.SetDelayedDamageInstigatorController(InstigatorController);
		}
		Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victim, Damage, Instigator, Location, vect(0.0000000, 0.0000000, 0.0000000), DamageType);
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
	Fuel=2.0000000
	MaxFuel=10.0000000
	Damage=12.0000000
	DamageType=Class'BWBP_OP_Pro.DT_FlameSwordImmolation'
	// Reference: SpriteEmitter'BWBP_OP_Pro.FlameSwordActorFire.SpriteEmitter11'
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
	// Reference: SpriteEmitter'BWBP_OP_Pro.FlameSwordActorFire.SpriteEmitter0'
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
	// Reference: SpriteEmitter'BWBP_OP_Pro.FlameSwordActorFire.SpriteEmitter1'
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
	// Reference: SpriteEmitter'BWBP_OP_Pro.FlameSwordActorFire.SpriteEmitter6'
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
	// Reference: SpriteEmitter'BWBP_OP_Pro.FlameSwordActorFire.SpriteEmitter3'
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
	Physics=10
	RemoteRole=2
	AmbientSound=Sound'BW_Core_WeaponSound.FP7.FP7FireLoop'
	bFullVolume=true
	SoundVolume=255
	SoundRadius=128.0000000
	bNotOnDedServer=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_OP_Pro.FlameSwordActorFire.SpriteEmitter11'
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
// Reference: SpriteEmitter'BWBP_OP_Pro.FlameSwordActorFire.SpriteEmitter0'
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
// Reference: SpriteEmitter'BWBP_OP_Pro.FlameSwordActorFire.SpriteEmitter1'
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
// Reference: SpriteEmitter'BWBP_OP_Pro.FlameSwordActorFire.SpriteEmitter6'
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
// Reference: SpriteEmitter'BWBP_OP_Pro.FlameSwordActorFire.SpriteEmitter3'
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
