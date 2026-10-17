class PD97HealControl extends PD97DartControl;

simulated function Initialize(Pawn V, PD97Bloodhound Gun)
{
	// End:0x0D
	if(V == none)
	{
		return;
	}
	Victim = V;
	// End:0x3C
	if(int(Role) == int(ROLE_Authority))
	{
		SetTimer(1.0000000, true);
		Master = Gun;
	}
	DartDurations[0] = BaseDuration;
	SetBase(Victim);
	//return;	
}

event Timer()
{
	local int i;

	// End:0x0E
	if(bTearOff)
	{
		Destroy();
		return;
	}
	// End:0x85
	if(((Victim == none) || Victim.Health < 1) || DartDurations.Length == 0)
	{
		// End:0x7C
		if((int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
		{
			bTearOff = true;			
		}
		else
		{
			Kill();
		}		
	}
	else
	{
		// End:0x12A
		if(Instigator != none)
		{
			// End:0x12A
			if((Victim.bProjTarget && InstigatorController != none) && Victim.Controller != none)
			{
				// End:0x112
				if(BallisticPawn(Victim) != none)
				{
					BallisticPawn(Victim).GiveAttributedHealth(int(Damage * float(DartDurations.Length)), int(Victim.HealthMax), Instigator);					
				}
				else
				{
					Victim.GiveHealth(int(Damage), 100);
				}
			}
		}
		i = 0;
		J0x131:

		// End:0x184 [Loop If]
		if(i < DartDurations.Length)
		{
			// End:0x16A
			if(DartDurations[i] <= float(1))
			{
				DartDurations.Remove(i, 1);
				i--;
				// [Explicit Continue]
				goto J0x17A;
			}
			DartDurations[i] -= float(1);
			J0x17A:

			i++;
			// [Loop Continue]
			goto J0x131;
		}
	}
	//return;	
}

defaultproperties
{
	Damage=1.0000000
	// Reference: SpriteEmitter'BWBP_OP_Pro.PD97HealControl.SpriteEmitter1'
	begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
		FadeOut=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=150,G=150,B=255,A=200))
		ColorScale[1]=(RelativeTime=0.4000000,Color=(R=150,G=150,B=255,A=200))
		ColorScale[2]=(RelativeTime=1.0000000,Color=(R=58,G=58,B=64,A=64))
		ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.9000000,Max=0.9000000))
		Opacity=0.2500000
		FadeOutStartTime=0.0500000
		MaxParticles=12
		StartLocationRange=(X=(Min=-4.0000000,Max=4.0000000),Y=(Min=-4.0000000,Max=4.0000000),Z=(Min=-4.0000000,Max=4.0000000))
		SpinCCWorCW=(X=0.4900000,Y=0.5000000,Z=0.5000000)
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=-75.0000000,Max=75.0000000),Y=(Min=-75.0000000,Max=75.0000000),Z=(Min=-75.0000000,Max=75.0000000))
		ParticlesPerSecond=4.0000000
		InitialParticlesPerSecond=20.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.NewSmoke1g'
		TextureUSubdivisions=1
		TextureVSubdivisions=1
		LifetimeRange=(Min=0.5000000,Max=0.7500000)
		StartVelocityRange=(X=(Min=-45.0000000,Max=45.0000000),Y=(Min=-45.0000000,Max=45.0000000),Z=(Min=-45.0000000,Max=45.0000000))
	end object
	Emitters[0]=SpriteEmitter1
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_OP_Pro.PD97HealControl.SpriteEmitter1'
begin object name="SpriteEmitter1" class=Engine.SpriteEmitter
	FadeOut=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=150,G=150,B=255,A=200))
	ColorScale[1]=(RelativeTime=0.4000000,Color=(R=150,G=150,B=255,A=200))
	ColorScale[2]=(RelativeTime=1.0000000,Color=(R=58,G=58,B=64,A=64))
	ColorMultiplierRange=(X=(Min=0.5000000,Max=0.5000000),Y=(Min=1.0000000,Max=1.0000000),Z=(Min=0.9000000,Max=0.9000000))
	Opacity=0.2500000
	FadeOutStartTime=0.0500000
	MaxParticles=12
	StartLocationRange=(X=(Min=-4.0000000,Max=4.0000000),Y=(Min=-4.0000000,Max=4.0000000),Z=(Min=-4.0000000,Max=4.0000000))
	SpinCCWorCW=(X=0.4900000,Y=0.5000000,Z=0.5000000)
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=-75.0000000,Max=75.0000000),Y=(Min=-75.0000000,Max=75.0000000),Z=(Min=-75.0000000,Max=75.0000000))
	ParticlesPerSecond=4.0000000
	InitialParticlesPerSecond=20.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.NewSmoke1g'
	TextureUSubdivisions=1
	TextureVSubdivisions=1
	LifetimeRange=(Min=0.5000000,Max=0.7500000)
	StartVelocityRange=(X=(Min=-45.0000000,Max=45.0000000),Y=(Min=-45.0000000,Max=45.0000000),Z=(Min=-45.0000000,Max=45.0000000))
end object
