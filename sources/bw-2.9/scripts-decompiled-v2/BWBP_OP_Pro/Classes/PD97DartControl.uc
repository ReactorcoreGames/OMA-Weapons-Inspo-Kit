class PD97DartControl extends BallisticEmitter;

const EffectInterval = 1;
const MaxDarts = 6;

var Pawn Victim;
var float Damage;
var float BaseDuration;
var PD97Bloodhound Master;
var Controller InstigatorController;
var Class<DamageType> DamageType;
var array<float> DartDurations;

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

function AddDart()
{
	// End:0x1A
	if(bTearOff || DartDurations.Length >= 6)
	{
		return;
	}
	DartDurations[DartDurations.Length] = BaseDuration;
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
	// End:0x8C
	if(((Victim == none) || Victim.Health < 1) || DartDurations.Length == 0)
	{
		// End:0x83
		if((int(Level.NetMode) == int(NM_DedicatedServer)) || int(Level.NetMode) == int(NM_ListenServer))
		{
			bTearOff = true;
			GotoState('NetWait');			
		}
		else
		{
			Kill();
		}		
	}
	else
	{
		// End:0x1A3
		if(Instigator != none)
		{
			// End:0x150
			if(((InstigatorController != none) && Victim.Controller != none) && InstigatorController.SameTeamAs(Victim.Controller))
			{
				// End:0x127
				if(BallisticPawn(Victim) != none)
				{
					BallisticPawn(Victim).GiveAttributedHealth(int(Damage * float(DartDurations.Length)), int(Victim.HealthMax), Instigator);					
				}
				else
				{
					Victim.GiveHealth(int(Damage), int(Victim.HealthMax));
				}				
			}
			else
			{
				Victim.SetDelayedDamageInstigatorController(InstigatorController);
				Class'BCoreProV55.BallisticDamageType'.static.GenericHurt(Victim, Damage * float(DartDurations.Length), Instigator, Location, vect(0.0000000, 0.0000000, 0.0000000), DamageType);
			}
		}
		i = 0;
		J0x1AA:

		// End:0x1FD [Loop If]
		if(i < DartDurations.Length)
		{
			// End:0x1E3
			if(DartDurations[i] <= float(1))
			{
				DartDurations.Remove(i, 1);
				i--;
				// [Explicit Continue]
				goto J0x1F3;
			}
			DartDurations[i] -= float(1);
			J0x1F3:

			i++;
			// [Loop Continue]
			goto J0x1AA;
		}
	}
	//return;	
}

simulated function Destroyed()
{
	// End:0x2D
	if((int(Role) == int(ROLE_Authority)) && Master != none)
	{
		Master.LostControl(self);
	}
	super(Actor).Destroyed();
	//return;	
}

state NetWait
{
	function BeginState()
	{
		bHidden = true;
		bAlwaysRelevant = true;
		SetBase(none);
		SetTimer(1.0000000, false);
		//return;		
	}

	function Timer()
	{
		Destroy();
		//return;		
	}
	stop;	
}

defaultproperties
{
	Damage=2.0000000
	BaseDuration=8.0000000
	DamageType=Class'BWBP_OP_Pro.DTPD97Poison'
	// Reference: SpriteEmitter'BWBP_OP_Pro.PD97DartControl.SpriteEmitter0'
	begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
		FadeOut=true
		SpinParticles=true
		UseSizeScale=true
		UseRegularSizeScale=false
		UniformSize=true
		AutomaticInitialSpawning=false
		ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
		ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.2500000,Max=0.2500000),Z=(Min=0.2500000,Max=0.2500000))
		Opacity=0.3500000
		FadeOutStartTime=0.7500000
		MaxParticles=80
		StartLocationRange=(X=(Min=-4.0000000,Max=4.0000000),Y=(Min=-4.0000000,Max=4.0000000),Z=(Min=-4.0000000,Max=4.0000000))
		SpinCCWorCW=(X=0.4900000,Y=0.5000000,Z=0.5000000)
		StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
		SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
		SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=1.0000000)
		StartSizeRange=(X=(Min=-75.0000000,Max=75.0000000),Y=(Min=-75.0000000,Max=75.0000000),Z=(Min=-75.0000000,Max=75.0000000))
		InitialParticlesPerSecond=20.0000000
		DrawStyle=1
		Texture=Texture'BW_Core_WeaponTex.Particles.NewSmoke1g'
		TextureUSubdivisions=1
		TextureVSubdivisions=1
		StartVelocityRange=(X=(Min=-45.0000000,Max=45.0000000),Y=(Min=-45.0000000,Max=45.0000000),Z=(Min=-45.0000000,Max=45.0000000))
	end object
	Emitters[0]=SpriteEmitter0
	AutoDestroy=true
	bReplicateInstigator=true
	Physics=10
	RemoteRole=2
	AmbientSound=Sound'BW_Core_WeaponSound.FP7.FP7FireLoop'
	SoundRadius=128.0000000
	bNotOnDedServer=false
}

// ===== Sub-objects owned by this class (referenced from defaultproperties above) =====
// Reference: SpriteEmitter'BWBP_OP_Pro.PD97DartControl.SpriteEmitter0'
begin object name="SpriteEmitter0" class=Engine.SpriteEmitter
	FadeOut=true
	SpinParticles=true
	UseSizeScale=true
	UseRegularSizeScale=false
	UniformSize=true
	AutomaticInitialSpawning=false
	ColorScale[0]=(RelativeTime=0.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorScale[1]=(RelativeTime=1.0000000,Color=(R=255,G=255,B=255,A=255))
	ColorMultiplierRange=(X=(Min=1.0000000,Max=1.0000000),Y=(Min=0.2500000,Max=0.2500000),Z=(Min=0.2500000,Max=0.2500000))
	Opacity=0.3500000
	FadeOutStartTime=0.7500000
	MaxParticles=80
	StartLocationRange=(X=(Min=-4.0000000,Max=4.0000000),Y=(Min=-4.0000000,Max=4.0000000),Z=(Min=-4.0000000,Max=4.0000000))
	SpinCCWorCW=(X=0.4900000,Y=0.5000000,Z=0.5000000)
	StartSpinRange=(X=(Min=0.0000000,Max=1.0000000),Y=(Min=0.0000000,Max=0.0000000),Z=(Min=0.0000000,Max=0.0000000))
	SizeScale[0]=(RelativeTime=0.0000000,RelativeSize=0.2000000)
	SizeScale[1]=(RelativeTime=0.2500000,RelativeSize=1.0000000)
	StartSizeRange=(X=(Min=-75.0000000,Max=75.0000000),Y=(Min=-75.0000000,Max=75.0000000),Z=(Min=-75.0000000,Max=75.0000000))
	InitialParticlesPerSecond=20.0000000
	DrawStyle=1
	Texture=Texture'BW_Core_WeaponTex.Particles.NewSmoke1g'
	TextureUSubdivisions=1
	TextureVSubdivisions=1
	StartVelocityRange=(X=(Min=-45.0000000,Max=45.0000000),Y=(Min=-45.0000000,Max=45.0000000),Z=(Min=-45.0000000,Max=45.0000000))
end object
